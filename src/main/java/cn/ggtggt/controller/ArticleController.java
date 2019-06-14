package cn.ggtggt.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.ggtggt.entity.Article;
import cn.ggtggt.service.IArticleService;
import cn.ggtggt.utils.DateUtil;
import cn.ggtggt.utils.ResponseUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 文章控制器
 * 
 * @author JOB
 */
@Controller
@RequestMapping("/article")
public class ArticleController {
	@Resource
	private IArticleService articleService;

	/**
	 * 修改和保持操作
	 * 
	 * @param article
	 * @param pic
	 * @param is
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public String save(Article article, @RequestParam(value = "time", required = false) String time,
			@RequestParam(value = "pic", required = false) CommonsMultipartFile pic, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		Date articleTime = DateUtil.formatString(time, "yyyyMMdd");
		article.setArticleTime(articleTime);
		int resultTotal = 0;
		if (pic != null) {
			String filePath = request.getServletContext().getRealPath("/");
			String imageName = DateUtil.getCurrentDateStr() + "." + pic.getOriginalFilename().split("\\.")[1];
			pic.transferTo(new File(filePath + "static/userImages/" + imageName));
			article.setArticlePic(imageName);
		}
		if (article.getId() == null) {
			article.setUuid(UUID.randomUUID().toString().trim());
			resultTotal = articleService.add(article);
		} else {
			Map<String, Object> result = new HashMap<String, Object>();
			resultTotal = articleService.update(article);
			if (resultTotal >= 0) {
				result.put("code", 1);
			} else {
				result.put("code", 0);
			}
			ResponseUtil.write(response, JSONObject.fromObject(result));
		}
		return "redirect:/admin/main.jsp";
	}

	/**
	 * 分页查询所有的文章信息
	 * 
	 * @param limit
	 * @param page
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/list")
	public String list(@RequestParam(value = "limit", required = false) String limit,
			@RequestParam(value = "page", required = false) String page, HttpServletResponse response)
			throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> result = new HashMap<String, Object>();
		if(limit != null && page != null) {
			Integer size = Integer.parseInt(limit);
			Integer start = Integer.parseInt(page);
			start = (start - 1) * size;
			map.put("start", start);
			map.put("size", size);
		}
		List<Article> articleList = articleService.list(map);
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", articleService.articleCount());
		JSONArray array = JSONArray.fromObject(articleList);
		result.put("data", array);
		ResponseUtil.write(response, JSONObject.fromObject(result));
		return null;
	}

	/**
	 * 删除一行
	 * 
	 * @param id
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/delete")
	public String delete(@RequestParam("id") String id, HttpServletResponse response) throws IOException {
		Integer totalResult = articleService.delete(id);
		Map<String, Object> result = new HashMap<String, Object>();
		if (totalResult >= 0) {
			result.put("code", 1);
		} else {
			result.put("code", 0);
		}
		ResponseUtil.write(response, JSONObject.fromObject(result));
		return null;
	}

	/**
	 * 修改文章
	 * 
	 * @param updateid
	 * @param updatefield
	 * @param pic
	 * @param updatevalue
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/update")
	public String update(@RequestParam(value = "updateid", required = false) String updateid,
			@RequestParam(value = "updatefield", required = false) String updatefield,
			@RequestParam(value = "pic", required = false) CommonsMultipartFile pic,
			@RequestParam(value = "updatevalue", required = false) String updatevalue, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		Article article = new Article();
		article.setId(Integer.parseInt(updateid));
		if ("articleInfo".equals(updatefield)) {
			article.setArticleInfo(updatevalue);
		}
		if ("articleTitle".equals(updatefield)) {
			article.setArticleTitle(updatevalue);
		}
		if ("articleAuthor".equals(updatefield)) {
			article.setArticleAuthor(updatevalue);
		}
		if ("simpleArticleInfo".equals(updatefield)) {
			article.setSimpleArticleInfo(updatevalue);
		}
		if ("articleWest".equals(updatefield)) {
			article.setArticleWest(Integer.parseInt(updatevalue));
		}
		if (pic != null) {
			String filePath = request.getServletContext().getRealPath("/");
			String imageName = DateUtil.getCurrentDateStr() + "." + pic.getOriginalFilename().split("\\.")[1];
			pic.transferTo(new File(filePath + "static/userImages/" + imageName));
			article.setArticlePic(imageName);
		}
		Integer resultTotal = articleService.update(article);
		Map<String, Object> result = new HashMap<String, Object>();
		if (resultTotal >= 0) {
			result.put("code", 1);
		} else {
			result.put("code", 0);
		}
		ResponseUtil.write(response, JSONObject.fromObject(result));
		return null;
	}
	/**
	 * 根据id查找文章
	 * @param id
	 * @return
	 */
	@RequestMapping("/findArticle")
	public ModelAndView find(@RequestParam(value = "id", required = false) String id) {
		Article article = articleService.findArticle(id);
		ModelAndView modelAndView = new ModelAndView();
		System.out.println(article.getArticleInfo());
		modelAndView.addObject("article", article);
		modelAndView.setViewName("modifyArticle");
		return modelAndView;
	}
	/**
	 * 修改图片和主要内容
	 * @param article
	 * @param pic
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/changeArticle")
	public String changeArticle(Article article,
			@RequestParam(value = "pic", required = false) CommonsMultipartFile pic, 
			HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		if (pic != null) {
			String filePath = request.getServletContext().getRealPath("/");
			String imageName = DateUtil.getCurrentDateStr() + "." + pic.getOriginalFilename().split("\\.")[1];
			pic.transferTo(new File(filePath + "/static/userImages/" + imageName));
			article.setArticlePic(imageName);
		}
		articleService.changeArticle(article);
		return "redirect:/admin/main.jsp";
	}
}
