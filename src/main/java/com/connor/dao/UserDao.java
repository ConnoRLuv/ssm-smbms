package com.connor.dao;

import com.connor.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 用户dao接口
 */
public interface UserDao {
    User getUserByName(String userName);

    User getUserByCode(String userCode);

    List<User> findAll(@Param("userName") String userName);

    void addUser(User user);

    void updateUser(User user);

    void deleteUser(String userName);

    void passwordUpdate(@Param("id") Long id, @Param("newPassword") String newPassword);

    List<User> selectUserByName(String userName);
}
