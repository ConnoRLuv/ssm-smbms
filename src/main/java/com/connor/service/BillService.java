package com.connor.service;

import com.connor.domain.Bill;

import java.util.List;

public interface BillService {
    List<Bill> findAll(String billCode, Integer page, Integer size);

    void addBill(Bill bill);

    Bill getBillByCode(String billCode);

    void updateBill(Bill bill);

    void deleteBill(String billCode);
}
