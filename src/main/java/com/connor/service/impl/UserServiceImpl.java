package com.connor.service.impl;

import com.connor.dao.UserDao;
import com.connor.domain.User;
import com.connor.service.UserService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("userService")
public class UserServiceImpl implements UserService {
    //根据类进行注入
    @Autowired
    private UserDao userDao;

    @Override
    public List<User> findAll(String userName, Integer page, Integer size) {
        PageHelper.startPage(page, size);
        return userDao.findAll(userName);
    }

//    @Override
//    public List<User> selectUserByName(String userName, Integer page, Integer size) {
//        PageHelper.startPage(page, size);
//        userName = "%"+userName+"%";
//        return userDao.selectUserByName(userName);
//    }

    @Override
    public void addUser(User user) {
        userDao.addUser(user);
    }

    @Override
    public void updateUser(User user) {
        userDao.updateUser(user);
    }

    @Override
    public void deleteUser(String userName) {
        userDao.deleteUser(userName);
    }

    @Override
    public void passwordUpdate(Long id, String newPassword) {
        userDao.passwordUpdate(id, newPassword);
    }

    @Override
    public User getUserByCode(String userCode) {
        return userDao.getUserByCode(userCode);
    }

    @Override
    public User getUserByName(String username) {
        return userDao.getUserByName(username);
    }


}
