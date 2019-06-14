package cn.ggtggt.service;

import java.util.List;
import java.util.Map;

import cn.ggtggt.entity.Admin;

/**
 * 管理员的service接口
 * @author JOB
 *
 */
public interface IAdminService {

	public Admin getByAdminName(String adminName);
	/**
	 * 管理员更新
	 * @param admin
	 * @return
	 */
	public Integer update(Admin admin);
	/**
	 * 管理员添加
	 * @param admin
	 * @return
	 */
	public Integer add(Admin admin);
	/**
	 * 管理员删除
	 * @param id
	 * @return
	 */
	public Integer delete(String id);
	/**
	 * 获取管理员的总数
	 * @return
	 */
	public Integer adminCount();
	/**
	 * 列出所有的管理员
	 * @return
	 */
	public List<Admin> list(Map<String, Object> map);
}
