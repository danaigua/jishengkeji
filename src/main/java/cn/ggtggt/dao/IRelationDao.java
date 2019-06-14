package cn.ggtggt.dao;
/**
 * 联系我们的dao层
 * @author JOB
 *
 */

import java.util.List;
import java.util.Map;


import cn.ggtggt.entity.Relationc;

public interface IRelationDao {
	/**
	 * 分页查询
	 * @param map
	 * @return
	 */
	public List<Relationc> list(Map<String, Integer> map);
	/**
	 * 需要联系
	 * @param relation
	 * @return
	 */
	public Integer add(Relationc relation);
	/**
	 * 查出relation的总记录条数
	 * @return
	 */
	public Integer relationCount();
}
