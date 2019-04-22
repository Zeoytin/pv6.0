package com.pv.productversion.entity;

public class UserRoleKey {
    private Integer rid;

    private Integer uid;

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public UserRoleKey(Integer uid,Integer rid){
        this.uid=uid;
        this.rid=rid;
    }
}