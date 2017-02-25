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

    public ArrayList<Musician> getMusicianList() throws SQLException {
     
       ArrayList<Musician> musicianlist = new ArrayList<Musician>();
       
       String query = "select distinct M.name as \"Name\""; 
			  query += ", M.dob as \"DOB\""; 
			  query += ", A.name as \"Album\""; 
			  query += ", B.name as \"Band\""; 
			  query += " from Musicians M";
			  query += " inner join BandsMusicians_Xref BM_X on (M.mid = BM_X.mid)"; 
			  query += " inner join Bands B on (BM_X.bid = B.bid)";
			  query += " inner join MusiciansSongs_Xref MS_X on (M.mid = MS_X.mid)"; 
			  query += " inner join Songs S on (MS_X.sid = S.sid)";
			  query += " inner join AlbumsSongs_Xref AS_X on (S.sid = AS_X.sid)";
			  query += " inner join Albums A on (AS_X.aid = A.aid)";
			  query += " order by B.name, M.dob";
           query += ";";
      
        //This is how we'll handle being safe from SQL injection
        // the set___ functions take the first number as the number of the
        // question mark, in order of appearence, to replace.
        // 1 means 1st question mark, 2 means 2nd, and so on.
        // the second argument is what to replace the question mark by.
        PreparedStatement preparedStatement = _DB.prepareStatement(query);
        ResultSet rs = preparedStatement.executeQuery();

        
        while (rs.next()) {
			String name = rs.getString("Name");
			Date dob = rs.getDate("DOB"); 
			String band = rs.getString("Band");
			String album = rs.getString("Album");
			Musician musician = new Musician(name, dob, band, album);
           
			musicianlist.add(musician);
        }
        
        rs.close();
        preparedStatement.close();

        return musicianlist;
   
    }

   public void doGet(HttpServletRequest request, HttpServletResponse response) 
      throws ServletException, IOException {
  
	   response.setContentType("text/html");
      PrintWriter out = response.getWriter();
      
 
	   if (!_message.startsWith("Servus")) {
         JsonResponse jsonResponse = new JsonResponse("ERROR",_message);
         response.getWriter().println(jsonResponse.toJson());
	   } else {    
         try {
        	 ArrayList<Musician> musicianlist = getMusicianList();
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
