package playlist;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * @author Julia Stoyanovich
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
       
       String query = "select S.name as \"Title\", "; 
			  query += "S.duration as \"Duration\", "; 
			  query += "S.release_date as \"Release Date\", "; 
			  query += "B.name as \"Band\", "; 
			  query += "A.name as \"Album\", "; 
			  query += "G.name as \"Genre\" "; 
			  query += "from Songs S ";
			  query += "inner join AlbumsSongs_Xref AS_X on (S.sid = AS_X.sid) "; 
			  query += "inner join Albums A on (AS_X.aid = A.aid) ";
			  query += "inner join SongGenres_Xref SG_X on (S.sid = SG_X.sid) "; 
			  query += "inner join Genres G on (SG_X.gid = G.gid) ";
			  query += "inner join Bands B on (A.band = B.bid) ";
           query += ";";
/*
		if (title != null)
			query += "and S.name = " + title;
		if (band != null)
			query += "and B.name = " + band;
		if (album != null)
			query += "and A.name = " + album;
		if (genre != null)
			query += "and G.name = " + genre;
*/
      
        Statement st = _DB.createStatement();
        ResultSet rs = st.executeQuery(query);
        
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
        st.close();

    return songlist;
   
    }

    public void printSongList(PrintWriter out) {

	//out.println("<h1>Song List </h1>");
	//out.println("<table>");
	
	try {
	    ArrayList<Song> songlist = getSongList(null,null,null,null);
       Gson gson = new Gson();
       gson.toJson(songlist,out);	    
       /*for (int i=0; i<songlist.size(); i++) {
		Song song = (Song) songlist.get(i);
		//out.println(song.toJSON());//HTML());
	    }
      */
	} catch (SQLException sqle) {
	    sqle.printStackTrace(out);
	}
	
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException {
  
	response.setContentType("text/html");
	PrintWriter out = response.getWriter();

	//out.println("<html><head></head><body>");
      
	if (!_message.startsWith("Servus")) {
       out.println("<h1>Databaase connection failed to open " + _message + "</h1>");
	} else {    
	    printSongList(out);
	}
	  
	//out.println("</table>");
	//out.println("</html>");
    }
  
    public void doPost(HttpServletRequest inRequest, HttpServletResponse outResponse) 
	throws ServletException, IOException {  
	
	doGet(inRequest, outResponse);  
    }

    public void destroy() {
	_DB.closeDBConnection();
    }
}

