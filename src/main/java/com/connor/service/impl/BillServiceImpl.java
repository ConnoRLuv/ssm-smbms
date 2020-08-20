package com.connor.service.impl;

import com.connor.dao.BillDao;
import com.connor.domain.Bill;
import com.connor.service.BillService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BillServiceImpl implements BillService {
    @Autowired
    private BillDao billDao;

    @Override
    public List<Bill> findAll(String billCode, Integer page, Integer size) {
        PageHelper.startPage(page, size);
        return billDao.findAll(billCode);
    }

    @Override
    public void addBill(Bill bill) {
        billDao.addBill(bill);
    }

    @Override
    public Bill getBillByCode(String billCode) {
        return billDao.getBillByCode(billCode);
    }

    @Override
    public void updateBill(Bill bill) {
        updateBill(bill);
    }

    @Override
    public void deleteBill(String billCode) {
        deleteBill(billCode);
    }
}
