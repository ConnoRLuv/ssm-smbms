package com.connor.dao;

import com.connor.domain.Bill;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BillDao {
    List<Bill> findAll(@Param("billCode") String billCode);
    Bill getBillByCode(@Param("billCode")String billCode);
    void addBill(Bill bill);

    void updateBill(Bill bill);

    void deleteBill(String billCode);
}
