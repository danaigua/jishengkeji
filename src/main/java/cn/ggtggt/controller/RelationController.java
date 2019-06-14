package cn.ggtggt.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.ggtggt.entity.Relationc;
import cn.ggtggt.service.IRelationService;
import cn.ggtggt.utils.ResponseUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 联系我们的控制层
 * @author JOB
 *
 */
@Controller
@RequestMapping("/relation")
public class RelationController {
	@Resource
	private IRelationService relationService;
	/**
	 * 列出所有的需要联系的人
	 * @param limit
	 * @param page
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/list")
	public String listRelation(@RequestParam(value = "limit", required = false) String limit, @RequestParam(value = "page", required = false)String page, HttpServletResponse response) throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("count", relationService.relationCount());
		result.put("code", 0);
		result.put("msg", "");
		Map<String, Integer> map = new HashMap<String, Integer>();
		Integer start = Integer.parseInt(page);
		Integer size = Integer.parseInt(limit);
		start = (start - 1) * size;
		map.put("start", start);
		map.put("size", size);
		List<Relationc> relationList = relationService.list(map);
		JSONArray array = JSONArray.fromObject(relationList);
		result.put("data", array);
		ResponseUtil.write(response, JSONObject.fromObject(result));
		return null;
	}
	/**
	 * 添加联系人
	 * @param relation
	 * @return
	 */
	@RequestMapping("/addRelation")
	public String addRelation(Relationc relation) {
		relationService.add(relation);
		return "redirect:/html/contact.html";
	}
}
