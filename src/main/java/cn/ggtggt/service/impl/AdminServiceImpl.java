package cn.ggtggt.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.ggtggt.dao.IAdminDao;
import cn.ggtggt.entity.Admin;
import cn.ggtggt.service.IAdminService;

/**
 * 管理员service接口实现类
 * @author JOB
 *
 */
@Service("adminService")
public class AdminServiceImpl implements IAdminService{
	@Resource
	private IAdminDao adminDao;
	public Admin getByAdminName(String adminName) {
		return adminDao.getByAdminName(adminName);
	}
	public Integer update(Admin admin) {
		return adminDao.update(admin);
	}
	public Integer add(Admin admin) {
		return adminDao.add(admin);
	}
	public Integer delete(String id) {
		return adminDao.delete(id);
	}
	public Integer adminCount() {
		return adminDao.adminCount();
	}
	public List<Admin> list(Map<String, Object> map) {
		return adminDao.list(map);
	}


}
