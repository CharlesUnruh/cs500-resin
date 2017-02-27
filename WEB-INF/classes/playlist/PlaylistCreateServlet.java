package playlist;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * 
 * @author Marc S. Thomson (marc.steven.thomson@drexel.edu)
 * @author Charles Unruh (ceu24@cs.drexel.edu)
 *
 */
public class PlaylistCreateServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private DBManager _DB;
    private String _message;

    public void init() throws ServletException {
        _DB = new DBManager();
        _message = _DB.openDBConnection("PgBundle");
    }

    /**
     * Create a new playlist using the input parameters
     * 
     * @param request
     *            - front end request
     * 
     */
    public String createPlaylist(HttpServletRequest request) throws SQLException {

        // get the parameters from the request
        String arg_username = request.getParameter("username");
        String arg_playlist = request.getParameter("playlistname");
        String arg_song = request.getParameter("songname");

        String validation1 = "select U.username from Users U where U.username = ?;";
        String validation3 = "select S.name from Songs S where S.name = ?;";
        String validation4 = "select *";
        validation4 += " from Users U";
        validation4 += " inner join UsersPlaylistsSongs_Xref UPS_X on ( U.username = ? and U.uid = UPS_X.uid )";
        validation4 += " inner join Playlists PL on ( PL.name = ? and PL.pid = UPS_X.pid )";
        validation4 += ";";

        PreparedStatement validationStatement1 = _DB.prepareStatement(validation1);
        validationStatement1.setString(1, arg_username);
        PreparedStatement validationStatement3 = _DB.prepareStatement(validation3);
        validationStatement3.setString(1, arg_song);
        PreparedStatement validationStatement4 = _DB.prepareStatement(validation4);
        validationStatement4.setString(1, arg_username);
        validationStatement4.setString(2, arg_playlist);
        ResultSet rs1 = validationStatement1.executeQuery();
        ResultSet rs3 = validationStatement3.executeQuery();
        ResultSet rs4 = validationStatement4.executeQuery();

        if (!rs1.next()) {
            return "Error, user not found!";
        }
        if (!rs3.next()) {
            return "Error, song not found!";
        }
        if (rs4.next()) {
            return "Error, playlist is already associated with user!";
        }

        // get today's date and convert to sql date data type
        java.sql.Date today = new java.sql.Date(Calendar.getInstance().getTime().getTime());

        // update the database, from the input parameters
        String query1 = "insert into Playlists (name, created, modified) values (";
        query1 += " ?,";
        query1 += " ?,";
        query1 += "?)";
        query1 += ";";

        // update the database, from the input parameters
        String query2 = "insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (";
        query2 += "(select uid from Users U where U.username = ?),";
        query2 += "(select pid from Playlists P where P.name = ?),";
        query2 += "(select sid from Songs S where S.name = ?))";
        query2 += ";";

        // This is how we'll handle being safe from SQL injection
        // the set___ functions take the first number as the number of the
        // question mark, in order of appearance, to replace.
        // 1 means 1st question mark, 2 means 2nd, and so on.
        // the second argument is what to replace the question mark by.
        PreparedStatement preparedStatement1 = _DB.prepareStatement(query1);
        preparedStatement1.setString(1, arg_playlist);
        preparedStatement1.setDate(2, today);
        preparedStatement1.setDate(3, today);

        PreparedStatement preparedStatement2 = _DB.prepareStatement(query2);
        preparedStatement2.setString(1, arg_username);
        preparedStatement2.setString(2, arg_playlist);
        preparedStatement2.setString(3, arg_song);

        _DB.enableTransactionMode();
        preparedStatement1.executeUpdate();
        preparedStatement2.executeUpdate();

        _DB.commit();
        _DB.disableTransactionMode();

        preparedStatement1.close();
        preparedStatement2.close();

        return "Success";

    }

    /**
     * Process the request from the frontend and return a response
     * 
     * @param request
     *            - from frontend
     * @param response
     *            - to frontend
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("application/json");

        // Query Strings are of the form arg=val&arg2=val2&arg3=val3
        // they show up at the end of the url like: <url>?<query-string>
        // you can get parameters with the functions below
        // if I request http://resin.cci.drexel.edu/songlist?title=abc
        // title will have the value "abc" and the rest will be null
        // out.println(request.getQueryString());

        if (!_message.startsWith("Servus")) {
            JsonResponse jsonResponse = new JsonResponse("ERROR", _message);
            response.getWriter().println(jsonResponse.toJson());
        } else {
            try {
                String result = createPlaylist(request);
                Gson gson = new Gson();
                JsonResponse jsonResponse = new JsonResponse("OK", gson.toJson(result));
                response.getWriter().println(jsonResponse.toJson());
            } catch (Exception e) {
                _DB.abortTransaction();
                StringWriter sw = new StringWriter();
                PrintWriter pw = new PrintWriter(sw);
                e.printStackTrace(pw);
                JsonResponse jsonResponse = new JsonResponse("ERROR", sw.toString());
                response.getWriter().println(jsonResponse.toJson());
            }
        }
    }

    public void doPost(HttpServletRequest inRequest, HttpServletResponse outResponse)
            throws ServletException, IOException {

        doGet(inRequest, outResponse);
    }

    public void destroy() {
        _DB.closeDBConnection();
    }
}
