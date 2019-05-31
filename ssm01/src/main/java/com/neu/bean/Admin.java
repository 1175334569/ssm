package com.neu.bean;
/*管理员持久化类*/
public class Admin {
    private Integer adminid;
    private String adminname;
    private String adminpassword;

    public Admin(){

    }
    public Admin(Integer adminid, String adminname, String adminpassword) {
        this.adminid = adminid;
        this.adminname = adminname;
        this.adminpassword = adminpassword;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "adminid=" + adminid +
                ", adminname='" + adminname + '\'' +
                ", adminpassword='" + adminpassword + '\'' +
                '}';
    }

    public Integer getAdminid() {
        return adminid;
    }

    public String getAdminname() {
        return adminname;
    }

    public String getAdminpassword() {
        return adminpassword;
    }

    public void setAdminid(Integer adminid) {
        this.adminid = adminid;
    }

    public void setAdminname(String adminname) {
        this.adminname = adminname;
    }

    public void setAdminpassword(String adminpassword) {
        this.adminpassword = adminpassword;
    }
}
