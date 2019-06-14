package cn.ggtggt.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


import cn.ggtggt.dao.IRelationDao;
import cn.ggtggt.entity.Relationc;
import cn.ggtggt.service.IRelationService;
/**
 * 联系我们的业务实现类
 * @author JOB
 *
 */
@Service("relationService")
public class RelationServiceImpl implements IRelationService {
	@Resource
	private IRelationDao relationDao;

	public List<Relationc> list(Map<String, Integer> map) {
		return relationDao.list(map);
	}

	public Integer add(Relationc relation) {
		return relationDao.add(relation);
	}

	public Integer relationCount() {
		return relationDao.relationCount();
	}
	
}
