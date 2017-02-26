package playlist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;

/**
 * 
 * Database Connection Manager.
 * 
 * @author Charles Unruh (ceu24@cs.drexel.edu)
 *
 */
public class DBManager {

    private static Connection _conn = null;
    private static ResourceBundle _bundle;

    /**
     * 
     * @param bundle
     *            - resource bundle that contains database connection
     *            information
     * @return
     */
    public String openDBConnection(String bundle) {
        _bundle = ResourceBundle.getBundle(bundle);
        return openDBConnection(_bundle.getString("dbUser"), _bundle.getString("dbPass"), _bundle.getString("dbSID"),
                _bundle.getString("dbHost"), Integer.parseInt(_bundle.getString("dbPort")));
    }

    /**
     * Open the database connection.
     * 
     * @param dbUser
     * @param dbPass
     * @param dbSID
     * @param dbHost
     * @return
     */
    public String openDBConnection(String dbUser, String dbPass, String dbSID, String dbHost, int port) {

        String res = "";
        if (_conn != null) {
            closeDBConnection();
        }

        try {
            _conn = DBUtils.openDBConnection(dbUser, dbPass, dbSID, dbHost, port);
            res = DBUtils.testConnection(_conn);
        } catch (SQLException sqle) {
            sqle.printStackTrace(System.err);
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace(System.err);
        }
        return res;
    }

    /**
     * Close the database connection.
     */
    public void closeDBConnection() {
        try {
            DBUtils.closeDBConnection(_conn);
            System.out.println("Closed a connection");
        } catch (SQLException sqle) {
            sqle.printStackTrace(System.err);
        }
    }

    /**
     * Provides a statement from an established connection.
     */
    public Statement createStatement() {
        Statement rval = null;
        try {
            rval = _conn.createStatement();
        } catch (SQLException sqle) {
            sqle.printStackTrace(System.err);
        }
        return rval;
    }

    /**
     * Provides a PreparedStatement from an established connection.
     */
    public PreparedStatement prepareStatement(String statement_string) {
        PreparedStatement rval = null;
        try {
            rval = _conn.prepareStatement(statement_string);
        } catch (SQLException sqle) {
            sqle.printStackTrace(System.err);
        }
        return rval;
    }

}
