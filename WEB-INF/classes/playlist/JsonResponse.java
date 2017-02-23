package playlist;
import com.google.gson.Gson;

/**
 * 
 * An implementation of the Song class.
 *  
 * @author Marc S. Thomson (marc.steven.thomson@drexel.edu) 
 * @author Charles Unruh (ceu24@cs.drexel.edu)
 *
 */
public class JsonResponse {
  
  private String status;
  private String data;

  /**
   * Constructor
   * @param status - Good, Bad, Errors, etc.
   * @param data - Response data with the associated status
   */
  public JsonResponse(String status, String data) {
    this.status = status;
    this.data = data;
  }
  
  public String toJson() {
      Gson gson = new Gson();
      return gson.toJson(this);
   } 
}
