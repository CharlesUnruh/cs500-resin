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
public class MusicianListServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private DBManager _DB;
    private String _message;

    public void init() throws ServletException {
    _DB = new DBManager();
	_message = _DB.openDBConnection("PgBundle");
    }

    public ArrayList<Musician> getMusicianList(HttpServletRequest request) throws SQLException {
     
       ArrayList<Musician> musicianlist = new ArrayList<Musician>();
       
       String arg_name = request.getParameter("name");
       String exactname = request.getParameter("exactname");
       String exactband = request.getParameter("exactband");
       String exactalbum = request.getParameter("exactalbum");
       String exactsong = request.getParameter("exactsong");

       String query = "select distinct M.name as \"Name\""; 
			  query += ", M.dob as \"DOB\""; 
			  if (exactband != null) {
				  query += ", B.name as \"Band\""; 
			  }
			  if (exactalbum != null) {
				  query += ", A.name as \"Album\"";
			  }
			  if (exactsong != null) {
				  query += ", S.name as \"Song\"";
			  }
			  query += " from Musicians M";
			  query += " inner join BandsMusicians_Xref BM_X on (M.mid = BM_X.mid)"; 
			  query += " inner join Bands B on (BM_X.bid = B.bid)";
			  query += " inner join MusiciansSongs_Xref MS_X on (M.mid = MS_X.mid)"; 
			  query += " inner join Songs S on (MS_X.sid = S.sid)";
			  query += " inner join AlbumsSongs_Xref AS_X on (S.sid = AS_X.sid)";
			  query += " inner join Albums A on (AS_X.aid = A.aid)";
			  query += " order by B.name, M.dob";
	           //COALESCE returns first of its arguments that isn't null.
	           //Here, we use it to say, if there isn't an argument,
	           //don't constrain the search (e.g. M.name will always equal M.name)
			  if (exactname != null) {
	               query += " where (M.name = coalesce(?, M.name))";
	           } else {
	               query += " where (M.name like '%'||coalesce(?, M.name)||'%')";
	           }
			  query += ";";
      
        //This is how we'll handle being safe from SQL injection
        // the set___ functions take the first number as the number of the
        // question mark, in order of appearence, to replace.
        // 1 means 1st question mark, 2 means 2nd, and so on.
        // the second argument is what to replace the question mark by.
        PreparedStatement preparedStatement = _DB.prepareStatement(query);
        preparedStatement.setString(1,arg_name);
        ResultSet rs = preparedStatement.executeQuery();

        
        while (rs.next()) {
			String name = rs.getString("Name");
			Date dob = rs.getDate("DOB"); 
			String band = rs.getString("Band");
			String album = rs.getString("Album");
			String song = rs.getString("Song");
			Musician musician = new Musician(name, dob, band, album, song);
           
			musicianlist.add(musician);
        }
        
        rs.close();
        preparedStatement.close();

        return musicianlist;
   
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
      
      
	   if (!_message.startsWith("Servus")) {
         JsonResponse jsonResponse = new JsonResponse("ERROR",_message);
         response.getWriter().println(jsonResponse.toJson());
	   } else {    
         try {
        	 ArrayList<Musician> musicianlist = getMusicianList(request);
            Gson gson = new Gson();
            JsonResponse jsonResponse = new JsonResponse("OK",gson.toJson(musicianlist));
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

