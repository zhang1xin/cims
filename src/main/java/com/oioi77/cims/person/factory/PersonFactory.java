package com.oioi77.cims.person.factory;

import com.oioi77.cims.person.dao.PersonDao;
import com.oioi77.cims.person.service.PersonService;
import com.oioi77.cims.person.service.impl.PersonServiceImpl;
import com.oioi77.cims.user.dao.impl.PersonDaoImpl;

/**
 * [干部收入管理系统]
 * [人员管理-人员工厂实现类]
 */
public class PersonFactory {

    /**
     * 获取人员模块逻辑层实现类
     * @return 人员模块逻辑层实现类
     */
    public static PersonService getPersonService(){
        return new PersonServiceImpl();
    }

    /**
     * 获取人员模块数据层实现类
     * @return 人员模块数据层实现类
     */
    public static PersonDao getPersonDao(){
        return PersonDaoImpl.getInstance();
    }
}
