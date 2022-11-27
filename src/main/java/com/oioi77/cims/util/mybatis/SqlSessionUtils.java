package com.oioi77.cims.util.mybatis;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class SqlSessionUtils {

    private static SqlSessionFactory sqlSessionFactory;

    static {
        //读取mybatis-config.xml文件
        InputStream inputStream = null;
        try {
            inputStream = Resources.getResourceAsStream("mybatis/mybatis-config.xml");
        } catch (IOException e) {
            e.printStackTrace();
        }
        //初始化mybatis,创建SqlSessionFactory类的实例
        sqlSessionFactory =  new SqlSessionFactoryBuilder().build(inputStream);
    }

    /**
     * 手动提交事务
     * 适用于 查询 或 多条SQL依赖手动提交
     * @return SqlSession
     */
    public static SqlSession openSession()
    {
        return SqlSessionUtils.openSession(false);
    }

    /**
     * 自动/手动提交事务(默认执行器)
     * @param autoCommit true 自动提交
     * @param autoCommit false 手动提交
     * @return SqlSession
     */
    public static SqlSession openSession(boolean autoCommit)
    {
        return SqlSessionUtils.openSession(ExecutorType.SIMPLE, autoCommit);
    }

    /**
     * 自动/手动提交事务(指定执行器)
     * @param executorType 执行器类型
     * @param autoCommit true 自动提交
     * @param autoCommit false 手动提交
     * @return SqlSession
     */
    public static SqlSession openSession(ExecutorType executorType, boolean autoCommit)
    {
        return sqlSessionFactory.openSession(executorType, autoCommit);
    }

}
