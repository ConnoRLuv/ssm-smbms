package com.connor.controller;

import com.alibaba.fastjson.JSONObject;
import com.connor.domain.User;
import com.connor.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/user")
@SessionAttributes({"loginUser", "list", "userName"})

public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 注册一个类型解析器
     *
     * @param binder
     */
    @InitBinder
    public void InitBinder(WebDataBinder binder) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @RequestMapping("/findAll")
    public String selectAll(ModelMap modelMap,
                            @RequestParam(defaultValue = "1") Integer page,
                            @RequestParam(defaultValue = "8") Integer size,
                            String userName,
                            @RequestParam(defaultValue = "0") int type) {

        if (type == 1) {
            modelMap.addAttribute("userName", userName);
        } else {
            userName = (String) modelMap.get("userName");

        }
        List<User> list = userService.findAll(userName, page, size);
        PageInfo<User> pi = new PageInfo<>(list);
        modelMap.addAttribute("list", pi);


        return "userList";
    }

//    @RequestMapping("/selectUserByName")
//    @ResponseBody
//    public String selectUserByName(String userName,Model model,
//                            @RequestParam(defaultValue = "1") Integer page,
//                            @RequestParam(defaultValue = "8") Integer size){
//        JSONObject jsonObject = new JSONObject();
//        List<User> list = userService.selectUserByName(userName,page,size);
//        //分页
//        PageInfo<User> pi = new PageInfo<>(list);
//
//        model.addAttribute("list",pi);
//        jsonObject.put("result","1");
//        return jsonObject.toString();
//    }
//
//    @RequestMapping("/select")
//    public String select(Model model){
//
//        model.toString();
//        return "userList";
//    }


    @RequestMapping("/addUser")
    @ResponseBody
    public String addUser(User user, @ModelAttribute("loginUser") User loginUser) {
        JSONObject jsonObject = new JSONObject();
        user.setCreatedBy(loginUser.getId());
        user.setCreationDate(new Date());

//        if(userService.addUser(user)){
//            jsonObject.put("result","1");
//        }else {
//            jsonObject.put("result","0");
//        }
        userService.addUser(user);
        jsonObject.put("result", "1");
        return jsonObject.toString();
    }


    @RequestMapping("/userView")
    public String userView(String userName, Model model) {
        User user = userService.getUserByName(userName);
        model.addAttribute("userView", user);
        return "userView";
    }


    @RequestMapping("/update")
    public String getUser(String userName, Model model) {
        User user = userService.getUserByName(userName);
        model.addAttribute("userUpdate", user);
        return "userUpdate";
    }

    @RequestMapping("/updateUser")
    @ResponseBody
    public String updateUser(User user, ModelMap modelMap) {
        JSONObject jsonObject = new JSONObject();
        User loginUser = (User) modelMap.get("loginUser");
        user.setModifyBy(loginUser.getId());
        user.setModifyDate(new Date());

        userService.updateUser(user);
        jsonObject.put("result", "1");
        return jsonObject.toString();
    }


    @RequestMapping("/deleteUser")
    public String deleteUser(String userName) {
        userService.deleteUser(userName);
        return "redirect:findAll.do";
    }

    @RequestMapping("/password")
    @ResponseBody
    public String password(String newPassword, ModelMap modelMap) {
        JSONObject jsonObject = new JSONObject();
        User loginUser = (User) modelMap.get("loginUser");
        userService.passwordUpdate(loginUser.getId(), newPassword);

        jsonObject.put("result", "1");
        return jsonObject.toString();
    }

    @RequestMapping("/logOut")
    public String logOut(ModelMap modelMap) {
        modelMap.remove("loginUser");
        return "/login/doLogin.do";
    }


}
