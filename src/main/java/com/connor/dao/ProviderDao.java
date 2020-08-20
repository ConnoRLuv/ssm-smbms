package com.connor.dao;

import com.connor.domain.Provider;
import com.connor.domain.User;
import org.apache.ibatis.annotations.Param;


import java.util.List;

public interface ProviderDao {
    List<Provider> findAll(@Param("proName") String proName);
    Provider getProviderByCode(@Param("proCode")String proCode);
    void addProvider(Provider provider);

    void updateProvider(Provider provider);

    void deleteProvider(String proCode);
}
