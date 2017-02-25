package playlist;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * @author Charles Unruh (ceu24@cs.drexel.edu)
 *
 */
public class Frontend extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private String _message;

    public void init() throws ServletException {
    }

   public void doGet(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException {
  
	   response.setContentType("text/html");
	   PrintWriter out = response.getWriter();
      BufferedReader br = new BufferedReader( new FileReader("/home/ceu24/resin/frontend.html"));
      try {
         String line = br.readLine();
         while (line != null) {
            out.println(line);
            line = br.readLine();
         }
      } catch (IOException e) {
         e.printStackTrace();
      } finally {
         br.close();
      }   
   }
  
    public void doPost(HttpServletRequest inRequest, HttpServletResponse outResponse) 
	throws ServletException, IOException {  
	
	doGet(inRequest, outResponse);  
    }

    public void destroy() {
    }
}

