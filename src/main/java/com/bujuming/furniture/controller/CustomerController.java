package com.bujuming.furniture.controller;

import com.bujuming.furniture.request.CustomerLoginRequest;
import com.bujuming.furniture.service.CustomerService;
import com.bujuming.furniture.vo.CustomerVO;
import com.bujuming.furniture.vo.RestResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("customer")
@Api("买家接口")
public class CustomerController {
    @Resource
    private CustomerService customerService;

    @GetMapping("login")
    @ApiOperation("买家登录")
    public RestResult<String> login(@RequestBody CustomerLoginRequest loginRequest) {
        customerService.login(loginRequest);
        return RestResult.success("ok");
    }
}
