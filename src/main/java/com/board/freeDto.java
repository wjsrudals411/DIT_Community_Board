package com.board;

public class freeDto {
	 	private int num;
	    private String topik;
	    private String title;
	    private String img;
	    private String content;
	    private String name;
	    private String userimg;
	    private String date;
	    
	    
	    public freeDto() {
	        
	    }
	    
	    
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
	    
	    public String getname() {
	        return name;
	    }
	    
	    public void setname(String name) {
	        this.name = name;
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
		
		public freeDto(String topik, String title, String img, String content, int num) {
	    	super();
	        this.topik = topik;
	        this.title = title;
	        this.img = img;
	        this.content = content;
	       this.num = num;
	    }
		
		public freeDto(int num, String topik, String title, String img, String content, String name, String userimg,String date) {
	        super();
	        this.num = num;
	        this.topik = topik;
	        this.title = title;
	        this.img = img;
	        this.content = content;
	        this.name = name;
	        this.userimg = userimg;
	        this.date = date;
	    }
}
