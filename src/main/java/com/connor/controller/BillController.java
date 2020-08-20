package com.connor.controller;

import com.alibaba.fastjson.JSONObject;
import com.connor.domain.Bill;
import com.connor.domain.User;
import com.connor.service.BillService;
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
@RequestMapping("/bill")
@SessionAttributes({"loginUser","billCode"})
public class BillController {
    @Autowired
    private BillService billService;

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
                          String billCode,
                          @RequestParam(defaultValue = "0") int type) {

        if (type == 1) {
            modelMap.addAttribute("billCode", billCode);
        } else {
            billCode = (String) modelMap.get("billCode");

        }
        List<Bill> list = billService.findAll(billCode,page,size);
        PageInfo<Bill> pi = new PageInfo<>(list);
        modelMap.addAttribute("list", pi);


        return "billList";
    }

    @RequestMapping("/addBill")
    @ResponseBody
    public String addBill(Bill bill, @ModelAttribute("loginUser") User loginUser) {
        JSONObject jsonObject = new JSONObject();
        bill.setCreatedBy(loginUser.getId());
        bill.setCreationDate(new Date());

//        if(userService.addUser(user)){
//            jsonObject.put("result","1");
//        }else {
//            jsonObject.put("result","0");
//        }
        billService.addBill(bill);
        jsonObject.put("result", "1");
        return jsonObject.toString();
    }

    @RequestMapping("/billView")
    public String billView(String billCode, Model model) {
        Bill bill = billService.getBillByCode(billCode);
        model.addAttribute("billView", bill);
        return "billView";
    }

    @RequestMapping("/update")
    public String getBill(String billCode, Model model) {
        Bill bill = billService.getBillByCode(billCode);
        model.addAttribute("billUpdate", bill);
        return "billUpdate";
    }

    @RequestMapping("/updateBill")
    @ResponseBody
    public String updateBill(Bill bill, ModelMap modelMap) {
        JSONObject jsonObject = new JSONObject();
        User loginUser = (User) modelMap.get("loginUser");
        bill.setModifyBy(loginUser.getId());
        bill.setModifyDate(new Date());

        billService.updateBill(bill);
        jsonObject.put("result", "1");
        return jsonObject.toString();
    }

    @RequestMapping("/deleteBill")
    public String deleteBill(String billCode) {
        billService.deleteBill(billCode);
        return "redirect:findAll.do";
    }
}
