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
public class Playlist {

    private String name;
    private String username;
    private Date createdDate;
    private Date modifiedDate;
    private Date releaseDate;
    private String song;
    private String album;
    private String band;
    private String genre;
    private int duration;

    /**
     * Constructor
     * 
     * @param name
     * @param username
     * @param createdDate
     * @param modifiedDate
     * @param song
     * @param album
     * @param band
     * @param genre
     * @param duration
     */
    public Playlist(String name, String username, Date createdDate, Date modifiedDate, String song, String album,
            String band, String genre, int duration, Date releaseDate) {
        this.name = name;
        this.username = username;
        this.createdDate = createdDate;
        this.modifiedDate = modifiedDate;
        this.song = song;
        this.album = album;
        this.band = band;
        this.genre = genre;
        this.duration = duration;
        this.releaseDate = releaseDate;
    }

    /**
     * Converting to JSON
     * 
     * @return
     * 
     */
    public String toJson() {
        Gson gson = new Gson();
        return gson.toJson(this);
    }

}
