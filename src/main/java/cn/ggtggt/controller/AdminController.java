package cn.ggtggt.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.ggtggt.entity.Admin;
import cn.ggtggt.service.IAdminService;
import cn.ggtggt.utils.Md5Util;
import cn.ggtggt.utils.ResponseUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/admin1")
public class AdminController {

	@Resource
	private IAdminService adminService;
	/**
	 * 登陆
	 * @param admin
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/login")
	public String login(Admin admin, HttpServletRequest request) throws Exception{
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(admin.getAdminName(), Md5Util.md5(admin.getAdminPassword(), "jishengkeji"));
		try {
			subject.login(token);
			return "redirect:/admin/main.jsp";
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("admin", admin);
			request.setAttribute("errorInfo", "用户名密码错误");
			return "login";
		}
	}
	/**
	 * 列出所有的管理员
	 * @param limit
	 * @param page
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("list")
	public String list(@RequestParam(value="limit",required=false) String limit,@RequestParam(value="page",required = false)String page, HttpServletResponse response) throws IOException {
		Integer start = Integer.parseInt(page);
		Integer size = Integer.parseInt(limit);
		start = (start - 1) * size;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("size", size);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("count", adminService.adminCount());
		result.put("msg", "");
		result.put("code", 0);
		List<Admin> adminList = adminService.list(map);
		JSONArray array = JSONArray.fromObject(adminList);
		result.put("data", array);
		ResponseUtil.write(response, JSONObject.fromObject(result));
		return null; 
	}
	/**
	 * 删除管理员
	 * @param id
	 * @param response
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("delete")
	public String delete(@RequestParam("id")String id,HttpServletResponse response) throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		Integer resultTotal = adminService.delete(id);
		if(resultTotal > 0) {
			result.put("code", 1);
		}else {
			result.put("code", 0);
		}
		ResponseUtil.write(response, JSONObject.fromObject(result));
		return null;
	}
	/**
	 * 添加管理员
	 * @param admin
	 * @return
	 */
	@RequestMapping("/add")
	public String add(Admin admin) {
		admin.setUuid(UUID.randomUUID().toString().trim());
		admin.setAdminPassword(Md5Util.md5(admin.getAdminPassword(), "jishengkeji"));
		adminService.add(admin);
		return "redirect:/admin/adminManager.jsp";
	}
	/**
	 * 修改管理员
	 * @param updateid
	 * @param updatefield
	 * @param updatevalue
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/update")
	public String update(@RequestParam(value = "updateid", required = false) String updateid,
			@RequestParam(value = "updatefield", required = false) String updatefield,
			@RequestParam(value = "updatevalue", required = false) String updatevalue, HttpServletResponse response) throws IOException {
		Integer resultTotal = 0;
		Map<String, Object> result = new HashMap<String, Object>();
		Admin admin = new Admin();
		admin.setId(Integer.parseInt(updateid));
		if("adminName".equals(updatefield)) {
			admin.setAdminName(updatevalue);
		}
		resultTotal = adminService.update(admin);
		if(resultTotal > 0) {
			result.put("code", 1);
		}else {
			result.put("code", 0);
		}
		ResponseUtil.write(response, JSONObject.fromObject(result));
		return null;
		
	}
	/**
	 * 修改密码
	 * @param id
	 * @param password
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/modify")
	public String modify(@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "password", required = false) String password,
			HttpServletResponse response) throws IOException {
		Admin admin = new Admin();
		admin.setId(Integer.parseInt(id));
		admin.setAdminPassword(Md5Util.md5(password, "jishengkeji"));
		Map<String, Object> result = new HashMap<String, Object>();
		adminService.update(admin);
		result.put("success", true);
		ResponseUtil.write(response, JSONObject.fromObject(result));
		return null;
		
	}
	/**
	 * 退出登陆
	 * @return
	 */
	@RequestMapping("/layout")
	public String layout() {
		SecurityUtils.getSubject().logout();
		return "redirect:/login.jsp";
	}
}
