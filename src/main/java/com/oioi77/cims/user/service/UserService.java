package com.oioi77.cims.user.service;

import com.oioi77.cims.user.entity.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    /**
     * 用户添加
     * @param entity 对象
     * @return 执行结果
     */
    public int insert(User entity);
    /**
     * 用户修改
     * @param entity 对象
     * @return 执行结果
     */
    public int update(User entity);
    /**
     * 用户删除
     * @param id 主键
     * @return 执行结果
     */
    public int delete(int id);
    /**
     * 用户批量删除
     * @param id 主键数组
     * @return 执行结果
     */
    public int delete(int... id);
    /**
     * 根据主键查询用户
     * @param id 主键
     * @return 对象
     */
    public User queryById(int id);
    /**
     * 根据账号密码查询用户
     * @param userName 登陆账号
     * @param userPass 登陆密码
     * @return 对象
     */
    public User queryByLogin(String userName, String userPass);
    /**
     * 根据条件查询总条数
     * @param params 查询条件
     * @return 总条数
     */
    public long queryByCount(Map<String, Object> params);
    /**
     * 根据条件分页查询
     * @param params 查询条件
     * @return 结果集
     */
    public List<User> queryByPage(Map<String, Object> params);
}
