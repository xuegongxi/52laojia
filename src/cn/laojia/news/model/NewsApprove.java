package cn.laojia.news.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@Entity
@Table(name = "news_approve")
public class NewsApprove implements Serializable{

	private static final long serialVersionUID = 1907427774766291014L;
	@Id
	@Basic(optional = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private Integer id;
	@Column(name = "news_id")
	private Integer news_id;
	@Column(name = "news_create_userid")
	private Integer news_create_userid;
	@Column(name = "news_approve_userid")
	private Integer news_approve_userid;
	@Column(name = "approve_state")
	private Integer approve_state;
	@Column(name = "approve_opinion")
	private String approve_opinion;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_time", nullable = false, length = 10)
	private Date create_time;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "approve_time", nullable = false, length = 10)
	private Date approve_time;
	
	
	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Integer getNews_id() {
		return news_id;
	}


	public void setNews_id(Integer news_id) {
		this.news_id = news_id;
	}


	public Integer getNews_create_userid() {
		return news_create_userid;
	}


	public void setNews_create_userid(Integer news_create_userid) {
		this.news_create_userid = news_create_userid;
	}


	public Integer getNews_approve_userid() {
		return news_approve_userid;
	}


	public void setNews_approve_userid(Integer news_approve_userid) {
		this.news_approve_userid = news_approve_userid;
	}


	public Integer getApprove_state() {
		return approve_state;
	}


	public void setApprove_state(Integer approve_state) {
		this.approve_state = approve_state;
	}


	public String getApprove_opinion() {
		return approve_opinion;
	}


	public void setApprove_opinion(String approve_opinion) {
		this.approve_opinion = approve_opinion;
	}


	public Date getCreate_time() {
		return create_time;
	}


	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}


	public Date getApprove_time() {
		return approve_time;
	}


	public void setApprove_time(Date approve_time) {
		this.approve_time = approve_time;
	}


	public NewsApprove() {
		// TODO Auto-generated constructor stub
	}

}
