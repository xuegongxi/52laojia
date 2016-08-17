package cn.laojia.news.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@Entity
@Table(name = "news")
public class News implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@Basic(optional = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "news_id", nullable = false)
	private Integer news_id;
	@Column(name = "news_title")
	private String news_title;
	@Column(name = "news_person")
	private String news_person;
	@Column(name = "news_from")
	private String news_from;
	@Lob
    @Column(name = "news_content", columnDefinition = "BLOB",nullable=true)
	private byte[]  news_content;
	@Column(name = "news_type")
	private String news_type;
	@Column(name = "news_address")
	private String news_address;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_time", nullable = false, length = 10)
	private Date create_time;
	
	public Integer getNews_id() {
		return news_id;
	}

	public void setNews_id(Integer news_id) {
		this.news_id = news_id;
	}

	public String getNews_title() {
		return news_title;
	}

	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}
    
	public String getNews_person() {
		return news_person;
	}

	public void setNews_person(String news_person) {
		this.news_person = news_person;
	}

	public String getNews_from() {
		return news_from;
	}

	public void setNews_from(String news_from) {
		this.news_from = news_from;
	}

	public byte[] getNews_content() {
		return news_content;
	}

	public void setNews_content(byte[] news_content) {
		this.news_content = news_content;
	}

	public String getNews_type() {
		return news_type;
	}

	public void setNews_type(String news_type) {
		this.news_type = news_type;
	}

	public String getNews_address() {
		return news_address;
	}

	public void setNews_address(String news_address) {
		this.news_address = news_address;
	}
	
	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public String getContent(){
    	byte[] s =this.getNews_content();
    	String content = null;
		try {
			content = new String(s);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

    	return content;
    	
    	
    }
	public News() {
		// TODO Auto-generated constructor stub
	}


}
