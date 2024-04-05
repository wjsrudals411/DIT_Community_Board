package com.board;

public class Dto {
    private int num;
    private String topik;
    private String title;
    private String img;
    private String content;
    private String writer;
    private String userimg;
    private String date;
    
    // Default constructor
    public Dto() {
        
    }
    
    // Getter and setter methods for 'num'
    public int getnum() {
        return num;
    }
    
    public void setnum(int num) {
        this.num = num;
    }
    
    // Getter and setter methods for 'topik'
    public String gettopik() {
        return topik;
    }
    
    public void settopik(String topik) {
        this.topik = topik;
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
    
    public String getwriter() {
        return writer;
    }
    
    public void setwriter(String writer) {
        this.writer = writer;
    }
    
    public String getuserimg() {
		return userimg;
	}
	
	public void setuserimg(String userimg) {
		this.userimg = userimg;
	}
	
	public String getdate() {
		return date;
	}
	
	public void setdate(String date) {
		this.date = date;
	}
	
    
    // Parameterized constructor
    public Dto(int num, String topik, String title, String img, String content, String writer, String userimg,String date) {
        super();
        this.num = num;
        this.topik = topik;
        this.title = title;
        this.img = img;
        this.content = content;
        this.writer = writer;
        this.userimg = userimg;
        this.date = date;
    }
    
    public Dto(int num , String topik, String title, String img, String content, String writer, String date) {
    	  super();
    	  this.num = num;
          this.topik = topik;
          this.title = title;
          this.img = img;
          this.content = content;
          this.writer = writer;
          this.date = date;
    }
    public Dto(String topik, String title, String img, String content, String writer, String date) {
        super();
        this.topik = topik;
        this.title = title;
        this.img = img;
        this.content = content;
        this.writer = writer;
        this.date = date;
    }
    
    public Dto(String topik, String title, String img, String content, int num) {
    	super();
        this.topik = topik;
        this.title = title;
        this.img = img;
        this.content = content;
       this.num = num;
    }
}
