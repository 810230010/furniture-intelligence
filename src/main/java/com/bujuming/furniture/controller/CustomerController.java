package com.bujuming.furniture.controller;

import com.bujuming.furniture.service.CustomerService;
import com.bujuming.furniture.vo.CustomerVO;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("customer")
public class CustomerController {
    @Resource
    private CustomerService customerService;

    @GetMapping("list")
    public List<CustomerVO> list() {
        return customerService.list();
    }
}
