package com.connor.service;

import com.connor.domain.User;

import java.util.List;

public interface UserService {
    User getUserByCode(String userCode);

    User getUserByName(String username);

    List<User> findAll(String userName, Integer page, Integer size);

    void addUser(User user);

    void updateUser(User user);

    void deleteUser(String userName);

    void passwordUpdate(Long id, String newPassword);


}
