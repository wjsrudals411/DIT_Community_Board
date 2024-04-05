package com.board;

public class commentDTO {
	private int comment_id;
	private int post_id;
	private String content;
	private String writer;
	private String userimg;
	
	public commentDTO(int commentId, int postId, String content, String writer,String userimg) {
		this.comment_id = commentId;
		this.post_id = postId;
		this.content = content;
		this.writer = writer;
		this.userimg = userimg;
	}
	
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getuserimg() {
		return userimg;
	}
	
	public void setuserimg(String userimg) {
		this.userimg = userimg;
	}
	
	
}
