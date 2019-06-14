package cn.ggtggt.service;

import java.util.List;
import java.util.Map;


import cn.ggtggt.entity.Relationc;

/**
 * 联系我们的业务接口
 * @author JOB
 *
 */
public interface IRelationService {
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
