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
	
	@Column(name = "news_province")
	private String news_province;
	@Column(name = "news_city")
	private String news_city;
	@Column(name = "news_county")
	private String news_county;
	@Column(name = "news_town")
	private String news_town;
	@Column(name = "news_village")
	private String news_village;
	
	@Column(name = "img_path")
	private String img_path;
	@Column(name = "news_summary")
	private String news_summary;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_time", nullable = false, length = 10)
	private Date create_time;
	@Column(name = "is_delete")
	private Integer is_delete;
	
	
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

	public String getNews_village() {
		return news_village;
	}

	public void setNews_village(String news_village) {
		this.news_village = news_village;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	
	public Integer getIs_delete() {
		return is_delete;
	}

	public void setIs_delete(Integer is_delete) {
		this.is_delete = is_delete;
	}
	
	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}

	public String getNews_summary() {
		return news_summary;
	}

	public void setNews_summary(String news_summary) {
		this.news_summary = news_summary;
	}
	
	public String getNews_province() {
		return news_province;
	}

	public void setNews_province(String news_province) {
		this.news_province = news_province;
	}

	public String getNews_city() {
		return news_city;
	}

	public void setNews_city(String news_city) {
		this.news_city = news_city;
	}

	public String getNews_county() {
		return news_county;
	}

	public void setNews_county(String news_county) {
		this.news_county = news_county;
	}

	public String getNews_town() {
		return news_town;
	}

	public void setNews_town(String news_town) {
		this.news_town = news_town;
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
