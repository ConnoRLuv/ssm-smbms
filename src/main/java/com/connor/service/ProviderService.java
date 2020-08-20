package com.connor.service;

import com.connor.domain.Provider;
import com.connor.domain.User;

import java.util.List;

public interface ProviderService {
    List<Provider> findAll(String proName,Integer page, Integer size);

    void addProvider(Provider provider);

    Provider getProviderByCode(String proCode);

    void updateProvider(Provider provider);

    void deleteProvider(String proCode);
}
