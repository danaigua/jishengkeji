package cn.ggtggt.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.ggtggt.dao.IArticleDao;
import cn.ggtggt.entity.Article;
import cn.ggtggt.service.IArticleService;
/**
 * 文章的实现类
 * @author JOB
 *
 */
@Service("articleService")
public class ArticleServiceImpl implements IArticleService {
	@Resource
	private IArticleDao articleDao;

	public Integer add(Article article) {
		return articleDao.add(article);
	}

	public Integer update(Article article) {
		return articleDao.update(article);
	}

	public Integer delete(String id) {
		return articleDao.delete(id);
	}

	public List<Article> list(Map<String, Object> map) {
		return articleDao.list(map);
	}

	public Integer articleCount() {
		return articleDao.articleCount();
	}

	public Article findArticle(String id) {
		return articleDao.findArticle(id);
	}

	public Integer changeArticle(Article article) {
		return articleDao.changeArticle(article);
	}
	
}
