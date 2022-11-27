package com.oioi77.cims.person.entity;

import lombok.Data;

import java.util.Date;

/**
 * [干部收入管理系统]
 * [人员管理-人员对象]
 */
@Data
public class Person {

    private int id;
    private String name;
    private String personCard;
    private int state;
    private String grade;
    private Date startedDate;
    private int hotting;
    private int property;
    private String reasons;

}
