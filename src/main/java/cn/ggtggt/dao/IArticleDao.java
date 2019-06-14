package cn.ggtggt.dao;


import java.util.List;
import java.util.Map;

import cn.ggtggt.entity.Article;

/**
 * 文章的dao层接口
 * @author JOB
 *
 */
public interface IArticleDao {

	/**
	 * 添加一个文章
	 * @param article
	 * @return
	 */
	public Integer add(Article article);
	/**
	 * 修改文章
	 * @param article
	 * @return
	 */
	public Integer update(Article article);
	/**
	 * 删除文章
	 * @param id
	 * @return
	 */
	public Integer delete(String id);
	/**
	 * 查出文章
	 * @param map
	 * @return
	 */
	public List<Article> list(Map<String, Object> map);
	/**
	 * 查询文章总数
	 * @return
	 */
	public Integer articleCount();
	/**
	 * 根据id查找
	 * @return
	 */
	public Article findArticle(String id);
	/**
	 * 修改保存的文章图片和主要内容
	 * @param article
	 * @return
	 */
	public Integer changeArticle(Article article);
	
}
