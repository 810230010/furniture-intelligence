package com.bujuming.furniture.vo;

import com.bujuming.furniture.common.BizCode;
import lombok.Data;

@Data
public class RestResult<T> {
    private int code;
    private T data;
    private String message;

    public static<T> RestResult<T> success(T data) {
        RestResult<T> restResult = new RestResult<>();
        restResult.setCode(BizCode.SUCCESS.getCode());
        restResult.setMessage("ok");
        return restResult;
    }

    public static<T> RestResult<T> fail(String message) {
        RestResult<T> restResult = new RestResult<>();
        restResult.setCode(BizCode.SYSTEM_ERR.getCode());
        restResult.setMessage(message);
        return restResult;
    }

    public static<T> RestResult<T> fail(int code, String message) {
        RestResult<T> restResult = new RestResult<>();
        restResult.setCode(code);
        restResult.setMessage(message);
        return restResult;
    }
}
