package ticket;

import java.sql.Date;

public class TicketVO {
	private String ticketNumber;
	private String id;
	private String filmNumber;
	private String theaterName;
	private String roomName;
	private int seatNumber;
	private Date date;
	private int adult;
	private int oldMan;
	private int teenager;
	public String getTicketNumber() {
		return ticketNumber;
	}
	public String getId() {
		return id;
	}
	public String getFilmNumber() {
		return filmNumber;
	}
	public String getTheaterName() {
		return theaterName;
	}
	public String getRoomName() {
		return roomName;
	}
	public int getSeatNumber() {
		return seatNumber;
	}
	public Date getDate() {
		return date;
	}
	public int getAdult() {
		return adult;
	}
	public int getOldMan() {
		return oldMan;
	}
	public int getTeenager() {
		return teenager;
	}
	public void setTicketNumber(String ticketNumber) {
		this.ticketNumber = ticketNumber;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setFilmNumber(String filmNumber) {
		this.filmNumber = filmNumber;
	}
	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public void setSeatNumber(int seatNumber) {
		this.seatNumber = seatNumber;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public void setAdult(int adult) {
		this.adult = adult;
	}
	public void setOldMan(int oldMan) {
		this.oldMan = oldMan;
	}
	public void setTeenager(int teenager) {
		this.teenager = teenager;
	}
	
}
