package playlist;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * @author Marc S. Thompson (marc.steven.thomson@drexel.edu)
 * @author Charles Unruh (ceu24@cs.drexel.edu)
 *
 */
public class PlaylistInsertServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private DBManager _DB;
    private String _message;

    public void init() throws ServletException {
   _DB = new DBManager();
	_message = _DB.openDBConnection("PgBundle");
    }

    public String addToPlaylist(String arg_username, String arg_playlist, String arg_song) throws SQLException {
     
       String query = "insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values ("; 
		  	  query += "(select uid from Users U where U.username = ?),"; 
		      query += "(select pid from Playlists P where P.name = ?),"; 
		      query += "(select sid from Songs S where S.name = ?),"; 
	          query += ";";

	          //This is how we'll handle being safe from SQL injection
	          // the set___ functions take the first number as the number of the
	          // question mark, in order of appearence, to replace.
	          // 1 means 1st question mark, 2 means 2nd, and so on.
	          // the second argument is what to replace the question mark by.
        PreparedStatement preparedStatement = _DB.prepareStatement(query);
        preparedStatement.setString(1,arg_username);
        preparedStatement.setString(2,arg_playlist);
        preparedStatement.setString(3,arg_song);
		ResultSet rs = preparedStatement.executeQuery();
    	String result1 = rs.getString(1);
    	
     	Date today = (Date) Calendar.getInstance().getTime();
    	
        String query2 = "update Playlists P set modified = "; 
 		  	   query2 += today; 
 		       query2 += " where P.name = ?"; 
 	           query2 += ";";

       //This is how we'll handle being safe from SQL injection
       // the set___ functions take the first number as the number of the
       // question mark, in order of appearence, to replace.
       // 1 means 1st question mark, 2 means 2nd, and so on.
       // the second argument is what to replace the question mark by.
        preparedStatement = _DB.prepareStatement(query);
        preparedStatement.setString(1,arg_playlist);
 		rs = preparedStatement.executeQuery();
     	String result2 = rs.getString(1);

		rs.close();
        preparedStatement.close();

        return result2;
   
    }

   public void doGet(HttpServletRequest request, HttpServletResponse response) 
      throws ServletException, IOException {
  
	  response.setContentType("application/json");
      PrintWriter out = response.getWriter();
      
      //Query Strings are of the form arg=val&arg2=val2&arg3=val3
      //they show up at the end of the url like: <url>?<query-string>
      //you can get parameters with the functions below
      //if I request http://resin.cci.drexel.edu/songlist?title=abc
      //title will have the value "abc" and the rest will be null
      //out.println(request.getQueryString());
      String username = request.getParameter("username");
      String playlist = request.getParameter("playlist");
      String song = request.getParameter("song");


 
	   if (!_message.startsWith("Servus")) {
         JsonResponse jsonResponse = new JsonResponse("ERROR",_message);
         response.getWriter().println(jsonResponse.toJson());
	   } else {    
         try {
	        String result = addToPlaylist(username, playlist, song);
            Gson gson = new Gson();
            JsonResponse jsonResponse = new JsonResponse("OK",gson.toJson(result));
            response.getWriter().println(jsonResponse.toJson());
	      } catch (Exception e) {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            e.printStackTrace(pw);
            JsonResponse jsonResponse = new JsonResponse("ERROR",sw.toString());
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

