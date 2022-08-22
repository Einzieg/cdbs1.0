package com.etc.entity;

public class Admin {
    private int adminId;//管理员编号
    private String adminName;//管理员姓名
    private String adminPassword;//管理员密码
    private int adminState;//管理员状态(1在职 0离职)

    public Admin(int adminId, String adminName, String adminPassword, int adminState) {
        this.adminId = adminId;
        this.adminName = adminName;
        this.adminPassword = adminPassword;
        this.adminState = adminState;
    }

    public Admin() {
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword;
    }

    public int getAdminState() {
        return adminState;
    }

    public void setAdminState(int adminState) {
        this.adminState = adminState;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "adminId=" + adminId +
                ", adminName='" + adminName + '\'' +
                ", adminPassword='" + adminPassword + '\'' +
                ", adminState=" + adminState +
                '}';
    }

	public Admin(String adminName, String adminPassword) {
		super();
		this.adminName = adminName;
		this.adminPassword = adminPassword;
	}
    
}
