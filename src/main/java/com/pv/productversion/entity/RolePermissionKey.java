package com.pv.productversion.entity;

public class RolePermissionKey {
    private Integer pid;

    private Integer rid;

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }
    public RolePermissionKey(Integer rid,Integer pid){
        this.pid=pid;
        this.rid=rid;
    }
}