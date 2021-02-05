package com.bujuming.furniture.common;

public enum BizCode {
    SUCCESS(200, "成功"),
    SYSTEM_ERR(500, "系统异常"),
    INVALID_ACCOUNT(201, "无效的用户名或密码")
    ;
    private int code;
    private String desc;

    BizCode(int code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public int getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }
}
