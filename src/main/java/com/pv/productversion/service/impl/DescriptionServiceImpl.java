package com.pv.productversion.service.impl;

import com.pv.productversion.entity.Description;
import com.pv.productversion.entity.Type;
import com.pv.productversion.mapper.DescriptionMapper;
import com.pv.productversion.mapper.TypeMapper;
import com.pv.productversion.service.DescriptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DescriptionServiceImpl implements DescriptionService {
    @Autowired
    private DescriptionMapper descriptionMapper;
    @Autowired
    private TypeMapper typeMapper;
    @Override
    public int insert(Description description) {
        return descriptionMapper.insertSelective(description);
    }

    @Override
    public int delete(Long id) {
        return descriptionMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int update(Description description) {
        return descriptionMapper.updateByPrimaryKeySelective(description);
    }

    @Override
    public Description getDescriptionById(Long id) {
        return descriptionMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Description> listDescription(Long versionId, String type, int pageSize, int pageNumber) {
        return descriptionMapper.listDescription(versionId, type, pageSize, pageNumber);
    }

    @Override
    public int count(Long versionId, String type) {
        return descriptionMapper.count(versionId,type);
    }


    @Override
    public List<Type> typeList() {
        return typeMapper.typeList();
    }

    @Override
    public int count() {
        return typeMapper.count();
    }

    @Override
    public int addType(Type type) {
        return typeMapper.insertSelective(type);
    }

    @Override
    public int updateType(Type type) {
        return typeMapper.updateByPrimaryKeySelective(type);
    }

    @Override
    public int delType(Long id) {
        return typeMapper.deleteByPrimaryKey(id);
    }
}
