package com.pv.productversion.service.impl;

import com.pv.productversion.entity.Product;
import com.pv.productversion.mapper.ProductMapper;
import com.pv.productversion.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductMapper productMapper;

    @Override
    public int insert(Product product) {
        return productMapper.insertSelective(product);
    }

    @Override
    public int delete(Long id) {
        return productMapper.isDelete(id);
    }

    @Override
    public int update(Product product) {
        return productMapper.updateByPrimaryKeySelective(product);
    }

    @Override
    public Product getProductById(Long id) {
        return productMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Product> listProducts(String name,int pageSize, int pageNumber) {
        return productMapper.listProducts(name,pageSize, pageNumber);
    }

    @Override
    public List<Product> selectProducts(Long id) {
        return productMapper.selectProducts(id);
    }

    @Override
    public int count(String name) {
        return productMapper.count(name);
    }

//    @Override
//    public List<Product> allProducts(String name,int pageSize, int pageNumber) {
//        return productMapper.allProducts(name,pageSize,pageNumber);
//    }
//
//    @Override
//    public int checked(Long id) {
//        return productMapper.checked(id);
//    }
//
//    @Override
//    public int countChecked(String name) {
//        return productMapper.countChecked(name);
//    }
}
