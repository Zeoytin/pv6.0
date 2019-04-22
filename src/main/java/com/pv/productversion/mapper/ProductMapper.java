package com.pv.productversion.mapper;

import com.pv.productversion.entity.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);

    List<Product> listProducts(@Param("name")String name,@Param("limit")int pageSize,@Param("beginNumber")int pageNumber);

    List<Product> selectProducts(@Param("id") Long id);

    int count(@Param("name")String name);

    int isDelete(@Param("id")Long id);

//    List<Product> allProducts(@Param("name")String name,@Param("limit")int pageSize,@Param("beginNumber")int pageNumber);
//    int countChecked(@Param("name")String name);
//
//    int checked(@Param("id")Long id);

}