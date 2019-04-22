package com.pv.productversion.service;

import com.pv.productversion.entity.Product;

import java.util.List;

public interface ProductService {
    //增加
    int insert(Product product);
    //删除
    int delete(Long id);
    //修改
    int update(Product product);
    //根据id查询
    Product getProductById(Long id);
    //查所有
    List<Product> listProducts(String name,int pageSize, int pageNumber);
    //除本身
    List<Product> selectProducts(Long id);
    //列表数量
    int count(String name);
    //没审核的所有产品
//    List<Product> allProducts(String name,int pageSize, int pageNumber);
//    //审核通过
//    int checked(Long id);
//    //没审核的数量
//    int countChecked(String name);
}
