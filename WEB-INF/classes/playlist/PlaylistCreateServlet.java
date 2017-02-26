package playlist;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Date;
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
        String arg_playlist = request.getParameter("playlist");
        String arg_song = request.getParameter("song");

        // get today's date and convert to sql date data type
        Date today = (Date) Calendar.getInstance().getTime();

        // update the database, from the input parameters
        String query = "insert into Playlists (uid, pid, sid) values (";
        query += " ? ,";
        query += today + ",";
        query += today + ")";
        query += ";";

        // This is how we'll handle being safe from SQL injection
        // the set___ functions take the first number as the number of the
        // question mark, in order of appearance, to replace.
        // 1 means 1st question mark, 2 means 2nd, and so on.
        // the second argument is what to replace the question mark by.
        PreparedStatement preparedStatement = _DB.prepareStatement(query);
        preparedStatement.setString(1, arg_playlist);
        ResultSet rs = preparedStatement.executeQuery();
        String result1 = rs.getString(1);

        // update the database, from the input parameters
        String query2 = "insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (";
        query2 += "(select uid from Users U where U.username = ?),";
        query2 += "(select pid from Playlists P where P.name = ?),";
        query2 += "(select sid from Songs S where S.name = ?),";
        query2 += ";";

        // This is how we'll handle being safe from SQL injection
        // the set___ functions take the first number as the number of the
        // question mark, in order of appearance, to replace.
        // 1 means 1st question mark, 2 means 2nd, and so on.
        // the second argument is what to replace the question mark by.
        preparedStatement = _DB.prepareStatement(query2);
        preparedStatement.setString(1, arg_username);
        preparedStatement.setString(2, arg_playlist);
        preparedStatement.setString(3, arg_song);
        rs = preparedStatement.executeQuery();
        String result2 = rs.getString(1);

        rs.close();
        preparedStatement.close();

        return result2;

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
