package com.oioi77.cims.user.dao.impl;

import com.oioi77.cims.person.dao.PersonDao;
import com.oioi77.cims.person.entity.Person;
import com.oioi77.cims.util.mybatis.SqlSessionUtils;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

/**
 * [干部收入管理系统]
 * [人员管理-人员数据层实现]
 */
public class PersonDaoImpl implements PersonDao {
    private PersonDaoImpl() {
    }

    /**
     * 类级的内部类, 也就是静态的成员式内部类, 该内部类的实例与外部类的实例没有绑定关系, 而且只有被调用到才会装载, 从而实现了延迟加载
     */
    private static class PersonDaoImplHolder {
        /**
         * 静态初始化器, 由JVM来保证线程安全
         */
        private static PersonDaoImpl instance = new PersonDaoImpl();
    }

    public static PersonDaoImpl getInstance() {
        return PersonDaoImplHolder.instance;
    }

    @Override
    public int insert(Person entity) {
        SqlSession sqlSession = SqlSessionUtils.openSession(true);
        int result = sqlSession.insert("person.insert", entity);
        sqlSession.close();
        return result;
    }

    @Override
    public int update(Person entity) {
        SqlSession sqlSession = SqlSessionUtils.openSession(true);
        int result = sqlSession.insert("person.update",entity);
        sqlSession.close();
        return result;
    }

    @Override
    public int delete(int id) {
        SqlSession sqlSession = SqlSessionUtils.openSession(true);
        int result = sqlSession.delete("person.delete", id);
        sqlSession.close();
        return result;
    }

    @Override
    public int delete(int... ids) {
        SqlSession sqlSession = SqlSessionUtils.openSession(true);
        int result = sqlSession.delete("person.batch", ids);
        sqlSession.close();
        return result;
    }

    @Override
    public Person queryById(int id) {
        SqlSession sqlSession = SqlSessionUtils.openSession();
        Person person = sqlSession.selectOne("person.queryById", id);
        sqlSession.close();
        return person;
    }

    @Override
    public long queryByCount(Map<String, Object> params) {
        SqlSession sqlSession = SqlSessionUtils.openSession();
        long count = sqlSession.selectOne("person.queryByCount", params);
        sqlSession.close();
        return count;
    }

    @Override
    public List<Person> quertByPage(Map<String, Object> params) {
        SqlSession sqlSession = SqlSessionUtils.openSession();
        List<Person> list = sqlSession.selectList("person.queryByPage", params);
        sqlSession.close();
        return list;
    }

    @Override
    public List<Person> queryAll() {
        // Mybatis实现了SQL与java分离
        SqlSession sqlSession = SqlSessionUtils.openSession();
        List<Person> list = sqlSession.selectList("person.queryAll");
        sqlSession.close();
        return list;
    }

    @Override
    public int queryCountByPersonCard(String personCard) {
        SqlSession sqlSession = SqlSessionUtils.openSession();
        int count = sqlSession.selectOne("person.queryCountByPersonCard",personCard);
        sqlSession.close();
        return count;
    }

    @Override
    public List<Map<String, Object>> queryPersonBySubsidy(int type) {
        SqlSession sqlSession = SqlSessionUtils.openSession();
        List<Map<String, Object>> list = sqlSession.selectList("person.queryPersonBySubsidy",type);
        sqlSession.close();
        return list;
    }
}
