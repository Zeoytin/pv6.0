package com.pv.productversion.entity;

public class Product {
    private Long id;

    private String name;

    private String paltform;

    private Boolean isDelete = false;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPaltform() {
        return paltform;
    }

    public void setPaltform(String paltform) {
        this.paltform = paltform == null ? null : paltform.trim();
    }

    public Boolean getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Boolean isDelete) {
        this.isDelete = isDelete;
    }
}