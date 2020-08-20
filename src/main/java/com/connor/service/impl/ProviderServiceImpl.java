package com.connor.service.impl;

import com.connor.dao.ProviderDao;
import com.connor.dao.UserDao;
import com.connor.domain.Provider;
import com.connor.service.ProviderService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("providerService")
public class ProviderServiceImpl implements ProviderService {
    @Autowired
    private ProviderDao providerDao;

    @Override
    public List<Provider> findAll(String proName,Integer page, Integer size) {
        PageHelper.startPage(page, size);
        return providerDao.findAll(proName);
    }

    @Override
    public void addProvider(Provider provider) {
        providerDao.addProvider(provider);
    }

    @Override
    public Provider getProviderByCode(String proCode) {
        return providerDao.getProviderByCode(proCode);
    }

    @Override
    public void updateProvider(Provider provider) {
        providerDao.updateProvider(provider);
    }

    @Override
    public void deleteProvider(String proCode) {
        providerDao.deleteProvider(proCode);
    }
}
