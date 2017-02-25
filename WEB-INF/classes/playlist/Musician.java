package playlist;
import java.util.Date;
import com.google.gson.Gson;

/**
 * 
 * An implementation of the Musician class.
 *  
 * @author Marc S. Thomson (marc.steven.thomson@drexel.edu) 
 * @author Charles Unruh (ceu24@cs.drexel.edu)
 *
 */
public class Musician {
  
  private String name;
  private Date dob;
  private String band;
  private String album;

  /**
   * Constructor
   * @param id
   * @param name
   * @param gpa
   */
  public Musician(String name, Date dob, String band, String album) {
    this.name = name;
    this.dob = dob;
    this.band = band;
    this.album = album;
  }
  
  public String toJson() {
      Gson gson = new Gson();
      return gson.toJson(this);
   } 

}