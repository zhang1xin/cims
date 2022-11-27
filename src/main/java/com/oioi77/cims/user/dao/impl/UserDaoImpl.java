package com.oioi77.cims.user.dao.impl;

import com.oioi77.cims.user.dao.UserDao;
import com.oioi77.cims.user.entity.User;
import com.oioi77.cims.util.mybatis.SqlSessionUtils;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

public class UserDaoImpl implements UserDao {

    private UserDaoImpl() {
    }

    /**
     * 类级的内部类，也就是静态的成员式内部类，该内部类的实例与外部类的实例
     * 没有绑定关系，而且只有被调用到才会装载，从而实现了延迟加载
     */
    private static class UserDaoImplHolder
    {
        /**
         * 静态初始化器，由JVM来保证线程安全
         */
        private static UserDaoImpl instance = new UserDaoImpl();
    }

    public static UserDaoImpl getInstance()
    {
        return UserDaoImplHolder.instance;
    }

    @Override
    public int insert(User entity) {
        return 0;
    }

    @Override
    public int update(User entity) {
        return 0;
    }

    @Override
    public int delete(int id) {
        return 0;
    }

    @Override
    public int delete(int... id) {
        return 0;
    }

    @Override
    public User queryById(int id) {
        return null;
    }

    @Override
    public User queryByLogin(Map<String, String> params) {
        SqlSession session = SqlSessionUtils.openSession();
        User user = session.selectOne("user.queryByLogin", params);
        session.close();
        return user;
    }

    @Override
    public long queryByCount(Map<String, Object> params) {
        return 0;
    }

    @Override
    public List<User> queryByPage(Map<String, Object> params) {
        return null;
    }

}
