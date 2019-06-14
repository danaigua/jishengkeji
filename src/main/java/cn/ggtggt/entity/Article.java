package cn.ggtggt.entity;

import java.util.Date;


/**
 * 文章的实体类
 * @author JOB
 *
 */
public class Article {
	private String articleInfo;//文章的内容
	private String articleTitle;//文章的标题
	private String uuid;//文章的uuid
	private String articleAuthor;//文章作者
	private Integer id;//文章id
	private String simpleArticleInfo;//文章的简要信息
	private Date articleTime;//文章创建时间
	private int articleWest;//文章权重
	private String articlePic;
	public String getArticleInfo() {
		return articleInfo;
	}
	public void setArticleInfo(String articleInfo) {
		this.articleInfo = articleInfo;
	}
	public String getArticleTitle() {
		return articleTitle;
	}
	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getArticleAuthor() {
		return articleAuthor;
	}
	public void setArticleAuthor(String articleAuthor) {
		this.articleAuthor = articleAuthor;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSimpleArticleInfo() {
		return simpleArticleInfo;
	}
	public void setSimpleArticleInfo(String simpleArticleInfo) {
		this.simpleArticleInfo = simpleArticleInfo;
	}
	public Date getArticleTime() {
		return articleTime;
	}
	public void setArticleTime(Date articleTime) {
		this.articleTime = articleTime;
	}
	public int getArticleWest() {
		return articleWest;
	}
	public void setArticleWest(int articleWest) {
		this.articleWest = articleWest;
	}
	public String getArticlePic() {
		return articlePic;
	}
	public void setArticlePic(String articlePic) {
		this.articlePic = articlePic;
	}
	
	
}
