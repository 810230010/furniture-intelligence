package com.bujuming.furniture.service.impl;

import com.baomidou.mybatisplus.toolkit.CollectionUtils;
import com.bujuming.furniture.common.BizCode;
import com.bujuming.furniture.common.exception.BizException;
import com.bujuming.furniture.mapper.CustomerMapper;
import com.bujuming.furniture.po.Customer;
import com.bujuming.furniture.request.CustomerLoginRequest;
import com.bujuming.furniture.service.CustomerService;
import com.bujuming.furniture.vo.CustomerVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class CustomerServiceImpl implements CustomerService {
    @Resource
    private CustomerMapper customerMapper;

    @Override
    public void login(CustomerLoginRequest loginRequest) {
        log.info("用户登录请求参数: {}", loginRequest);
        Map<String, Object> queryParam = new HashMap<>();
        queryParam.put("username", loginRequest.getUsername());
        // TODO 密码需要加密
        queryParam.put("password", loginRequest.getPassword());
        List<Customer> customers = customerMapper.selectByMap(queryParam);
        log.info("用户登录请求: {}, 请求结果: {}", loginRequest, customers);
        if(CollectionUtils.isEmpty(customers)) {
            throw new BizException(BizCode.INVALID_ACCOUNT.getCode(), BizCode.INVALID_ACCOUNT.getDesc());
        }
    }

    private CustomerVO convertPO2VO(Customer customer) {
        CustomerVO customerVO = new CustomerVO();
        BeanUtils.copyProperties(customer, customerVO);
        return customerVO;
    }
}
