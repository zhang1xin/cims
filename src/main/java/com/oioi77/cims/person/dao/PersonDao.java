package com.oioi77.cims.person.dao;

import com.oioi77.cims.person.entity.Person;

import java.util.List;
import java.util.Map;

/**
 * [干部收入管理系统]
 * [人员管理-人员数据层接口]
 */
public interface PersonDao {

    /**
     * 人员添加
     * @param entity 对象
     * @return 状态
     */
    public int insert(Person entity);
    /**
     * 人员修改
     * @param entity 对象
     * @return 状态
     */
    public int update(Person entity);
    /**
     * 人员删除
     * @param id 对象
     * @return 状态
     */
    public int delete(int id);
    /**
     * 人员删除(批量)
     * @param id 主键数组
     * @retur 状态
     */
    public int delete(int... ids);

    /** ----------------------------------- */

    /**
     * 根据人员逐渐查询人员对象
     * @param id 主键
     * @return 人员对象
     */
    public Person queryById(int id);

    /**
     * 根据条件查询总条数
     * @param params 查询条件
     * @return 总条数
     */
    public long queryByCount(Map<String,Object> params);

    /**
     * 根据条件分页查询
     * @param params 查询条件
     * @return 结果集
     */
    public List<Person> quertByPage(Map<String,Object> params);

    /**
     * 查询所有数据(过时方法)
     * @return 结果集
     */
    @Deprecated
    public List<Person> queryAll();

    /**
     * 根据身份证号查询唯一性
     * @param personCard 身份证号码
     * @return 唯一性
     */
    public int queryCountByPersonCard(String personCard);


    /**
     * 根据补贴类型查询未补贴人员
     * @param type 补贴类型
     * @return 补贴人员
     */
    public List<Map<String ,Object>> queryPersonBySubsidy(int type);

}
