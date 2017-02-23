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
  
  private String title;
  private int duration;
  private Date releaseDate;
  private String band;
  private String album;
  private String genre;

  /**
   * Constructor
   * @param id
   * @param name
   * @param gpa
   */
  public Song(String title, int duration, Date releaseDate, String band, String album, String genre) {
    this.title = title;
    this.duration = duration;
    this.releaseDate = releaseDate;
    this.band = band;
    this.album = album;
    this.genre = genre;
  }
  
  public String toJson() {
      Gson gson = new Gson();
      return gson.toJson(this);
   } 

  public String toHTML() {
	  return "<tr><td>" + title + "</td><td>" + duration + "</td><td>" + releaseDate + "</td><td>" + band + "</td><td>" + album + "</td><td>" + genre + "</td><td></tr>";
  }

}
