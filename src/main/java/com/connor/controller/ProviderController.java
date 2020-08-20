package com.connor.controller;

import com.alibaba.fastjson.JSONObject;
import com.connor.domain.Provider;
import com.connor.domain.User;
import com.connor.service.ProviderService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/provider")
@SessionAttributes({"loginUser","proName"})
public class ProviderController {

    @Autowired
    private ProviderService providerService;

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
    public String findAll(ModelMap modelMap,
                            @RequestParam(defaultValue = "1") Integer page,
                            @RequestParam(defaultValue = "8") Integer size,
                            String proName,
                            @RequestParam(defaultValue = "0") int type) {

        if (type == 1) {
            modelMap.addAttribute("proName", proName);
        } else {
            proName = (String) modelMap.get("proName");

        }
        List<Provider> list = providerService.findAll(proName,page,size);
        PageInfo<Provider> pi = new PageInfo<>(list);
        modelMap.addAttribute("list", pi);


        return "providerList";
    }

    @RequestMapping("/addProvider")
    @ResponseBody
    public String addProvider(Provider provider, @ModelAttribute("loginUser") User loginUser) {
        JSONObject jsonObject = new JSONObject();
        provider.setCreatedBy(loginUser.getId());
        provider.setCreationDate(new Date());

//        if(userService.addUser(user)){
//            jsonObject.put("result","1");
//        }else {
//            jsonObject.put("result","0");
//        }
        providerService.addProvider(provider);
        jsonObject.put("result", "1");
        return jsonObject.toString();
    }

    @RequestMapping("/providerView")
    public String providerView(String proCode, Model model) {
        Provider provider = providerService.getProviderByCode(proCode);
        model.addAttribute("providerView", provider);
        return "providerView";
    }

    @RequestMapping("/update")
    public String getProvider(String proCode, Model model) {
        Provider provider = providerService.getProviderByCode(proCode);
        model.addAttribute("providerUpdate", provider);
        return "providerUpdate";
    }

    @RequestMapping("/updateProvider")
    @ResponseBody
    public String updateProvider(Provider provider, ModelMap modelMap) {
        JSONObject jsonObject = new JSONObject();
        User loginUser = (User) modelMap.get("loginUser");
        provider.setModifyBy(loginUser.getId());
        provider.setModifyDate(new Date());

        providerService.updateProvider(provider);
        jsonObject.put("result", "1");
        return jsonObject.toString();
    }

    @RequestMapping("/deleteProvider")
    public String deleteProvider(String proCode) {
        providerService.deleteProvider(proCode);
        return "redirect:findAll.do";
    }
}
