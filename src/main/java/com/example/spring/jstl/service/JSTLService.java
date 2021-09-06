package com.example.spring.jstl.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.spring.jstl.model.User;

@Service
public class JSTLService {

	public List<User> getAllUsersForJstl() {
        List<User> userList = new ArrayList<User>();
        
        User user0 = new User();
        user0.setUser_id(0);
        user0.setName("name0");
        user0.setEmail("name0@mail.com");
        
        User user1 = new User();
        user1.setUser_id(1);
        user1.setName("name1");
        user1.setEmail("name1@mail.com");
        
        User user2 = new User();
        user2.setUser_id(2);
        user2.setName("name2");
        user2.setEmail("name2@mail.com");
        
        userList.add(user0);
        userList.add(user1);
        userList.add(user2);
        
        return userList;
    }
}
