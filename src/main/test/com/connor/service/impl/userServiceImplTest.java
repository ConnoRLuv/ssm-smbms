package com.connor.service.impl;

import com.connor.service.UserService;
import org.junit.jupiter.api.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

class userServiceImplTest {

    @Test
    public void findAll() {
        //加载配置文件
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        //获取对象
        UserService us = (UserService) ac.getBean("userService");
        //调用方法
//        us.findAll();
    }
}