package playlist;
import java.util.Date;
import com.google.gson.Gson;

/**
 * 
 * An implementation of the Song class.
 *  
 * @author Marc S. Thomson (marc.steven.thomson@drexel.edu) 
 * @author Charles Unruh (ceu24@cs.drexel.edu)
 *
 */
public class Song {
  
  private String _title;
  private int _duration;
  private Date _releaseDate;
  private String _band;
  private String _album;
  private String _genre;

  /**
   * Constructor
   * @param id
   * @param name
   * @param gpa
   */
  public Song(String title, int duration, Date releaseDate, String band, String album, String genre) {
    _title = title;
    _duration = duration;
    _releaseDate = releaseDate;
    _band = band;
    _album = album;
    _genre = genre;
  }
  
  public String toJSON() {
      Gson gson = new Gson();
      return gson.toJson(this);
   } 

  public String toHTML() {
	  return "<tr><td>" + _title + "</td><td>" + _duration + "</td><td>" + _releaseDate + "</td><td>" + _band + "</td><td>" + _album + "</td><td>" + _genre + "</td><td></tr>";
  }

}
