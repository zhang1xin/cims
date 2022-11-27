package com.oioi77.cims.person.service.impl;

import com.oioi77.cims.person.dao.PersonDao;
import com.oioi77.cims.person.entity.Person;
import com.oioi77.cims.person.factory.PersonFactory;
import com.oioi77.cims.person.service.PersonService;
import com.oioi77.cims.util.mybatis.SqlSessionUtils;
import com.oioi77.cims.util.validate.Validator;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

/**
 * [干部收入管理系统]
 * [人员管理-人员逻辑层实现类]
 */
public class PersonServiceImpl implements PersonService {

    /** 获取人员模块数据层实现类 */
    private PersonDao personDao = PersonFactory.getPersonDao();
    @Override
    public int insert(Person entity) {
        return personDao.insert(entity);
    }

    @Override
    public int update(Person entity) {
        return personDao.update(entity);
    }

    @Override
    public int delete(int id) {
        return personDao.delete(id);
    }

    @Override
    public int delete(String... ids) {

        if(Validator.isNotEmpty(ids)){
            // 1. String... -> int...
            int[] array = new int[ids.length];
            for (int i = 0; i < ids.length; i++) {
                array[i] = Integer.valueOf(ids[i]);
            }
            return personDao.delete(array);
        }
        return 0;
    }

    @Override
    public Person queryById(int id) {
        return personDao.queryById(id);
    }

    @Override
    public long queryByCount(Map<String, Object> params) {
        return personDao.queryByCount(params);
    }

    @Override
    public List<Person> quertByPage(Map<String, Object> params) {
        return personDao.quertByPage(params);
    }

    @Override
    public List<Person> queryAll() {
        return personDao.queryAll();
    }

    @Override
    public Map<String, Object> queryCountByPersonCard(String personCard) {
        int count = personDao.queryCountByPersonCard(personCard);
        return Map.of("success", count == 0,"message",count == 0 ?"恭喜... ":"很遗憾...");
    }

    @Override
    public List<Map<String, Object>> queryPersonBySubsidy(int type) {
        return personDao.queryPersonBySubsidy(type);
    }
}
