/*
 *  This file is part of FGMP-Hotelverwaltung
 *
 *  Copyright © 2011, 2010, 2009  Daniel Fischer, David Gawehn, Martin Meyer, Christian Pusch
 *
 *  FGMP-Hotelverwaltung is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

package FGMP_Hotel_Management.Configuration;

import FGMP_Hotel_Management.Language.ErrorMsg;
import FGMP_Hotel_Management.Language.LanguageFile;
import FGMP_Hotel_Management.Messaging;
import java.beans.XMLDecoder;
import java.beans.XMLEncoder;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 * Get and set information in the main config file
 *
 * @author David Gawehn
 */
public class Main_Config2 {
    private String fileName;
    private XMLDecoder d;
    private XMLEncoder o;

    private String hotelAddress;
    private String fax;
    private String telephone;
    private String mail;
    private String web;
	private String VAT;
	private String invoice_Place;
    private String invoice_extD;
	private Vector[] cancellationFee = new Vector[2];
	
	private String DB_Host;
    private String DB_Port;
    private String DB_Name;
    private String DB_User;
    private String DB_Password;

    private String Currency;
    private String Bill_Top;
    private String Bill_Bottom;

    private String languageFileAbsolutePath;
	
	public Main_Config2(String fn) throws Exception{
        this.fileName = fn;
        this.init(fn);
    }

    private void init(String fn) throws Exception{
        this.load_config();
    }
	
	private void load_config() throws FileNotFoundException, ArrayIndexOutOfBoundsException{
        d = new XMLDecoder(new BufferedInputStream(new FileInputStream(this.fileName)));

        this.hotelAddress = (String) d.readObject();
		this.fax = (String) d.readObject();
		this.telephone = (String) d.readObject();
		this.mail = (String) d.readObject();
		this.web = (String) d.readObject();
		this.VAT = (String) d.readObject();
		this.invoice_Place = (String) d.readObject();
		this.invoice_extD = (String) d.readObject();
		this.cancellationFee[0] = (Vector)d.readObject();
		this.cancellationFee[1] = (Vector)d.readObject();
		this.DB_Name = (String) d.readObject();
		this.DB_Host = (String) d.readObject();
		this.DB_User = (String) d.readObject();
		this.DB_Port = (String) d.readObject();
		this.DB_Password = (String) d.readObject();
		this.Currency = (String) d.readObject();
		this.Bill_Top = (String) d.readObject();
		this.Bill_Bottom = (String) d.readObject();
		
		String pa = (String) d.readObject();
		if (pa != null) {
			LanguageFile.applyLanguageFile(new File(pa));
		}
    }

    public void save_config() throws FileNotFoundException{
		this.o = new XMLEncoder(new BufferedOutputStream(new FileOutputStream(this.fileName)));
		o.writeObject(hotelAddress);
		o.writeObject(fax);
		o.writeObject(telephone);
		o.writeObject(mail);
		o.writeObject(web);
		o.writeObject(VAT);
		o.writeObject(invoice_Place);
		o.writeObject(invoice_extD);
		o.writeObject(cancellationFee[0]);
		o.writeObject(cancellationFee[1]);
		o.writeObject(DB_Name);
		o.writeObject(DB_Host);
		o.writeObject(DB_User);
		o.writeObject(DB_Port);
		o.writeObject(DB_Password);
		o.writeObject(Currency);
		o.writeObject(Bill_Top);
		o.writeObject(Bill_Bottom);
		o.writeObject(languageFileAbsolutePath);
		o.flush();
    }

	/*			*
	* 	SETs	*
	*			*/			
    public void setBill_Bottom(String Bill_Bottom) {
        this.Bill_Bottom = Bill_Bottom;
    }

    public void setBill_Top(String Bill_Top) {
        this.Bill_Top = Bill_Top;
    }

    public void setCurrency(String Currency) {
        this.Currency = Currency;
    }

    public void setLanguageFileAbsolutePath(String LanguageFileAbsolutePath) {
        this.languageFileAbsolutePath = LanguageFileAbsolutePath;
    }

    public void setVAT(String vat) {
        this.VAT = vat;
    }

    public void setInvoice_Place(String invoice_Place) {
        this.invoice_Place = invoice_Place;
    }

    public void setInvoice_extD(String invoice_extD) {
        this.invoice_extD = invoice_extD;
    }

    public void setCancellationFee(Vector[] cancellation) {
        this.cancellationFee = cancellation;
    }

    public void setHost(String Host) {
        this.DB_Host = Host;
    }

    public void setPassword(String PSWD) {
        this.DB_Password = PSWD;
    }

    public void setPort(String Port) {
        this.DB_Port = Port;
    }

    public void setUser(String User) {
        this.DB_User = User;
    }

    public void setDatabase(String DBName) {
        this.DB_Name = DBName;
    }

    public void setHotelAddress(String text) {
        this.hotelAddress = text;
    }

    public void setTelephone(String text) {
        this.telephone = text;
    }

    public void setFax(String text) {
        this.fax = text;
    }

    public void setMail(String text) {
        this.mail = text;
    }

    public void setWeb(String text) {
        this.web = text;
    }
	
	/*			*
	* 	GETs	*
	*			*/	
    public String getLanguageFileAbsolutePath() {
        return languageFileAbsolutePath;
    }

    public Vector[] getCancellationFee() {
        return cancellationFee;
    }
	public String getDB_Host() {
        return this.DB_Host;
    }

    public String getDB_Port() {
        return this.DB_Port;
    }

    public String getDB_Name() {
        return this.DB_Name;
    }

    public String getDB_Password() {
        return this.DB_Password;
    }

    public String getDB_User() {
        return this.DB_User;
    }

    public String getHotelAddress() {
        return this.hotelAddress;
    }

    public String getFax() {
        return this.fax;
    }

    public String getTelephone() {
        return this.telephone;
    }

    public String getMail() {
        return this.mail;
    }

    public String getWeb() {
        return this.web;
    }

    public String getVAT() {
        return this.VAT;
    }

    public String getInvoice_Place() {
        return this.invoice_Place;
    }

    public String getInvoice_extD() {
        return this.invoice_extD;
    }

    public Vector[] getCancellation() {
        return this.cancellationFee;
    }

    public String getCurrency() {
        return this.Currency;
    }

    public String getBill_Top() {
        return this.Bill_Top;
    }

    public String getBill_Bottom() {
        return this.Bill_Bottom;
    }
}

//=============================================================//

/*
 *  This file is part of FGMP-Hotelverwaltung
 *
 *  Copyright © 2010, 2009  Daniel Fischer, David Gawehn, Martin Meyer, Christian Pusch
 *
 *  FGMP-Hotelverwaltung is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

package FGMP_Hotel_Management.Datenbank2;

import FGMP_Hotel_Management.Language.ErrorMsg;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.DefaultComboBoxModel;
import javax.swing.DefaultListModel;
import javax.swing.JOptionPane;
import FGMP_Hotel_Management.Messaging;

/**
 * Provide several "helpers" for the DB access
 *
 * @author Daniel Fischer, David Gawehn
 */
public class DB_Helpers {

    /**
     * Provides the nearest free ID of a table
     * MAY STILL BE OPTIMIZED
     *
     * @param Table     DB-Table
     * @param Column    Column IDs
     * @return          -1, if failed, otherwise ID
     */
    public static int getNextID(String Table, String Column) {
        try {
            Statement stmt_id = DB_Backend.getConnection().createStatement();
            ResultSet max_id = stmt_id.executeQuery("SELECT MAX(" + Column + ") FROM " + Table);
            max_id.next();
            return max_id.getInt(1) + 1;
        } catch (SQLException ex) {
            Logger.getLogger(DB_Helpers.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    /**
     * Delete a record from a table
     *
     * @param Table                 table Name
     * @param where                 column Name
     * @param what                  column entry
     * @return                      -1, if failed, otherwise 1
     */
    public static int delEntry(String Table, String where, int what){
        try{
            PreparedStatement stmt_id = DB_Backend.getConnection().prepareStatement("DELETE FROM " + Table + " WHERE " + where + " = ?");
            stmt_id.setInt(1,what);
            stmt_id.execute();
            return 1;
        } catch (SQLException ex){
            Logger.getLogger(DB_Helpers.class.getName()).log(Level.SEVERE, null, ex);
            Messaging.show_Dialog(ErrorMsg.msg[1], "Error", JOptionPane.ERROR_MESSAGE);
            return -1;
        }
    }


    public static int delEntry(String Table, String where, String what){
        try{
            PreparedStatement stmt_id = DB_Backend.getConnection().prepareStatement("DELETE FROM " + Table + " WHERE " + where + " = ?");
            stmt_id.setString(1,what);
            stmt_id.execute();
            return 1;
        } catch (SQLException ex){
            Logger.getLogger(DB_Helpers.class.getName()).log(Level.SEVERE, null, ex);
            Messaging.show_Dialog(ErrorMsg.msg[1], "Error", JOptionPane.ERROR_MESSAGE);
            return -1;
        }
    }

   
    /**
     * Fill a combo box with entries from the database conditions
     *
     * @param Model                 DefaultComboBoxModel
     * @param List_id               ArrayList of entries to be filled
     * @param Table                 DB-Table
     * @param Column_name    		DB column names
     * @param Column_ID             DB column IDs
     */
    public static void getComboItems(DefaultComboBoxModel Model, ArrayList List_id, String Table, String Column_name, String Column_ID) {
        try {
            if (Model != null) {
                Model.removeAllElements();
            }
            List_id.clear();
            Statement stmt = DB_Backend.getConnection().createStatement();
            ResultSet RS = stmt.executeQuery("SELECT * FROM " + Table + " ORDER BY " + Column_ID);
            while (RS.next()) {
                if (Model != null) {
                    Model.addElement(RS.getString(Column_name));
                }
                List_id.add(RS.getString(Column_ID));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DB_Helpers.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     *  Fill a JList with entries from the database conditions
     *
     * @param ListModel             DefaultListModel
     * @param Liste                 ArrayList of IDs
     * @param Table                 DB-Table
     * @param Column_name		    DB-Column names
     * @param Column_ID             DB-Column IDs
     */
    public static void getListItems(DefaultListModel ListModel, ArrayList Liste, String Table, String Column_name, String Column_ID) {
        try {
            Statement stmt = DB_Backend.getConnection().createStatement();
            Liste.clear();
            ListModel.clear();
            ResultSet rs = stmt.executeQuery("SELECT * FROM " + Table);
            while (rs.next()) {
                ListModel.addElement(rs.getString(Column_name));
                if (Liste != null) {
                    Liste.add(rs.getString(Column_ID));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(DB_Helpers.class.getName()).log(Level.SEVERE, null, ex);
        }
}

    /**
     * Checks whether a room loaded from the database can be deleted
     */
    public static boolean isRoomDeletable(int ID) {
       try {
            PreparedStatement stmt1 = DB_Backend.getConnection().prepareStatement("SELECT * FROM booking_room WHERE room_id = ?");
            stmt1.setInt(1, ID);
            ResultSet rs1 = stmt1.executeQuery();
            while(rs1.next()) {
                int counter = 0;
                PreparedStatement stmt2 = DB_Backend.getConnection().prepareStatement("SELECT * FROM booking WHERE booking_id= ? && paid = '0'");
                stmt2.setString(1, rs1.getString("booking_id"));
                ResultSet rs2 = stmt2.executeQuery();
                while(rs2.next()) {
                    counter++;
                }
                if (counter > 0) {
                    return false;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(DB_Helpers.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }
    
    /**
     * Returns the number rooms in use at the specified date d
     * 
     * @param d date
     * @return  number of rooms
     */

    public static int getReservedRoomsAtDate(Date d) {
        int res = 0;
        try {
            PreparedStatement stmt1 = DB_Backend.getConnection().prepareStatement("SELECT * FROM booking,booking_room WHERE booking.arrivaldate <= ? AND booking.departuredate >= ? AND booking.cancellation = 0 AND booking.booking_id = booking_room.booking_id");
            stmt1.setDate(1, d);
            stmt1.setDate(2, d);
            ResultSet rs1 = stmt1.executeQuery();
            while(rs1.next()) {
                res++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DB_Helpers.class.getName()).log(Level.SEVERE, null, ex);
        }
        return res;
    }

    /**
     * Returns the number of rooms in the database
     *
     * @return number of rooms
     */

    public static int getNumberOfRooms() {
        int rooms = 0;
        try {
            PreparedStatement stmt1 = DB_Backend.getConnection().prepareStatement("SELECT * FROM room");
            ResultSet rs1 = stmt1.executeQuery();
            while (rs1.next()) {
                rooms++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DB_Helpers.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rooms;
    }
}


