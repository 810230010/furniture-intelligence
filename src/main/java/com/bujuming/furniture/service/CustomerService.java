package com.bujuming.furniture.service;

import com.bujuming.furniture.request.CustomerLoginRequest;
import com.bujuming.furniture.vo.CustomerVO;

import java.util.List;

public interface CustomerService {

    /**
     * 买家登录
     * @param loginRequest
     */
    void login(CustomerLoginRequest loginRequest);
}
