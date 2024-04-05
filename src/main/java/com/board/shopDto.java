package com.board;

public class shopDto {
    private String num;
    private String pay;
    private String title;
    private String img;
    private String content;
    private String name;
    private String upload_date;
    
    // Default constructor
    public shopDto() {
        
    }
    
    // Getter and setter methods for 'num'
    public String getnum() {
        return num;
    }
    
    public void setnum(String num) {
        this.num = num;
    }
    
    // Getter and setter methods for 'pay'
    public String getpay() {
        return pay;
    }
    
    public void setpay(String pay) {
        this.pay = pay;
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
    
    // Getter and setter methods for 'upload_date'
    public String getupload_date() {
        return upload_date;
    }
    
    public void setupload_date(String upload_date) {
        this.upload_date = upload_date;
    }
    
    // Parameterized constructor
    public shopDto(String num, String pay, String title, String img, String content,String name,  String upload_date) {
        super();
        this.num = num;
        this.pay = pay;
        this.title = title;
        this.img = img;
        this.content = content;
        this.name = name;
        this.upload_date = upload_date;
    }
}
