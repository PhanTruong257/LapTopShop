package com.laptopmall.bo;

import com.laptopmall.bean.User;
import com.laptopmall.dao.UserDAO;

public class UserBo {
   UserDAO userDAO= new UserDAO();
    public UserBo(){

    }
    public User getUserByLoginName(String loginName){
        return userDAO.getUserByLoginName(loginName);
    }
    public User getUserByLoginNameAndPassword(String loginName, String password){
        return userDAO.getUserByLoginNameAndPassword(loginName,password);
    }
    public boolean insertUser(User user){
        return userDAO.insertUser(user);
    }
    public boolean updateUser(User newUser){
        return userDAO.updateUser(newUser);
    }
    public boolean deleteUserById(Integer id){
        return userDAO.deleteUserById(id);
    }

}
