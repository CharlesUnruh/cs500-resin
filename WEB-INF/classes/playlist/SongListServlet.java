package playlist;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
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
public class SongListServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private DBManager _DB;
    private String _message;

    public void init() throws ServletException {
   _DB = new DBManager();
	_message = _DB.openDBConnection("PgBundle");
    }

    public ArrayList<Song> getSongList(String arg_title, String arg_band, String arg_album, String arg_genre) throws SQLException {
     
       ArrayList<Song> songlist = new ArrayList<Song>();
       
       String query = "select S.name as \"Title\""; 
			  query += ", S.duration as \"Duration\""; 
			  query += ", S.release_date as \"Release Date\""; 
			  query += ", B.name as \"Band\""; 
			  query += ", A.name as \"Album\""; 
			  query += ", G.name as \"Genre\""; 
			  query += " from Songs S";
			  query += " inner join AlbumsSongs_Xref AS_X on (S.sid = AS_X.sid)"; 
			  query += " inner join Albums A on (AS_X.aid = A.aid)";
			  query += " inner join SongGenres_Xref SG_X on (S.sid = SG_X.sid)"; 
			  query += " inner join Genres G on (SG_X.gid = G.gid)";
			  query += " inner join Bands B on (A.band = B.bid)";
           //COALESCE returns first of its arguments that isn't null.
           //Here, we use it to say, if there isn't an argument,
           //don't constrain the search (e.g. S.name will always equal S.name)
           query += " where (S.name = coalesce(?, S.name))";
           query += "  and (B.name = coalesce(?, B.name))";
           query += "  and (A.name = coalesce(?, A.name))";
           query += "  and (G.name = coalesce(?, G.name))";
           query += ";";
      
        //This is how we'll handle being safe from SQL injection
        // the set___ functions take the first number as the number of the
        // question mark, in order of appearence, to replace.
        // 1 means 1st question mark, 2 means 2nd, and so on.
        // the second argument is what to replace the question mark by.
        PreparedStatement preparedStatement = _DB.prepareStatement(query);
        preparedStatement.setString(1,arg_title);
        preparedStatement.setString(2,arg_band);
        preparedStatement.setString(3,arg_album);
        preparedStatement.setString(4,arg_genre);
        ResultSet rs = preparedStatement.executeQuery();

        
        while (rs.next()) {
			String title = rs.getString("Title");
			int duration = rs.getInt("Duration");
			Date releaseDate = rs.getDate("Release Date"); 
			String band = rs.getString("Band");
			String album = rs.getString("Album");
			String genre = rs.getString("Genre");
			Song song = new Song(title, duration, releaseDate, band, album, genre);
           
			songlist.add(song);
        }
        
        rs.close();
        preparedStatement.close();

        return songlist;
   
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
      String title = request.getParameter("title");
      String band = request.getParameter("band");
      String album = request.getParameter("album");
      String genre = request.getParameter("genre");

 
	   if (!_message.startsWith("Servus")) {
         JsonResponse jsonResponse = new JsonResponse("ERROR",_message);
         response.getWriter().println(jsonResponse.toJson());
	   } else {    
         try {
	         ArrayList<Song> songlist = getSongList(title,band,album,genre);
            Gson gson = new Gson();
            JsonResponse jsonResponse = new JsonResponse("OK",gson.toJson(songlist));
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

