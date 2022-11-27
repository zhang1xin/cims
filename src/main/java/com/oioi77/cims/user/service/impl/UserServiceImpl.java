package com.oioi77.cims.user.service.impl;

import com.oioi77.cims.user.dao.UserDao;
import com.oioi77.cims.user.entity.User;
import com.oioi77.cims.user.factory.UserFactory;
import com.oioi77.cims.user.service.UserService;

import java.util.List;
import java.util.Map;

public class UserServiceImpl implements UserService {

    private UserDao userDao = UserFactory.getUserDao();

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
    public User queryByLogin(String userName, String userPass) {
        ;
        return userDao.queryByLogin(Map.of("userName", userName, "userPass", userPass));
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
