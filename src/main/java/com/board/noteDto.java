package com.board;

public class noteDto {
	private String num;
	private String name;
	private String content;
	private String date;
	private String toname;
	
	public noteDto() {
		
		
	}
	
	public String getnum() {
		return num;
	}
	
	public void setnum(String num) {
		this.num = num;
	}
	
	public String getname() {
		return name;
	}
	public void setname(String name) {
		this.name = name;
	}
	
	public String getcontent() {
		return content;
	}
	public void setcontent(String content) {
		this.content = content;
	}
	
	public String getdate() {
		return date;
	}
	
	public void setdate(String date) {
		this.date = date;
	}
	
	public String gettoname() {
		return toname;
	}
	public void settoname(String toname) {
		this.toname = toname;
	}
	
	public noteDto(String num, String name, String content, String toname, String date ) {
		super();
		this.num = num;
		this.name = name;
		this.content = content;
		this.toname = toname;
		this.date = date;
		
	}
}
