package com.bujuming.furniture.common;

public enum BizCode {
    SUCCESS(200, "成功"),
    SYSTEM_ERR(500, "系统异常")
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
}
