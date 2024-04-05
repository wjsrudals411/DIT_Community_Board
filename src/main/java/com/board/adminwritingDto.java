package com.board;

public class adminwritingDto {
	private String num;
	private String name;
    private String title;
    private String img;
    private String content;
    private String date;
    
    public adminwritingDto() {
    	
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
    
    // Getter and setter methods for 'title'
    public String gettitle() {
        return title;
    }
    
    public void settitle(String title) {
        this.title = title;
    }
    
    // Getter and setter methods for 'img'
    public String getimg() {
        return img;
    }
    
    public void setimg(String img) {
        this.img = img;
    }
    
    // Getter and setter methods for 'content'
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
	
	 public adminwritingDto(String num, String name, String title, String img, String content,String date) {
	        super();
	        this.num = num;
	        this.name = name;
	        this.title = title;
	        this.img = img;
	        this.content = content;
	        this.date = date;
	    }
}
