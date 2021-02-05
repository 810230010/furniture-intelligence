package com.bujuming.furniture.common.exception;

import com.bujuming.furniture.vo.RestResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(Exception.class)
    public RestResult<Object> handleException(Exception e) {
        if(e instanceof BizException) {
            return RestResult.fail(((BizException) e).getCode(), e.getMessage());
        }

        return RestResult.fail(e.getMessage());
    }
}
