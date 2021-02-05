package com.bujuming.furniture.service.impl;

import com.bujuming.furniture.mapper.CustomerMapper;
import com.bujuming.furniture.po.Customer;
import com.bujuming.furniture.service.CustomerService;
import com.bujuming.furniture.vo.CustomerVO;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class CustomerServiceImpl implements CustomerService {
    @Resource
    private CustomerMapper customerMapper;

    @Override
    public List<CustomerVO> list() {
        List<Long> idList = new ArrayList<>();
        idList.add(1L);
        List<Customer> customers = customerMapper.selectBatchIds(idList);
        return customers.stream().map(this::convertPO2VO).collect(Collectors.toList());
    }

    private CustomerVO convertPO2VO(Customer customer) {
        CustomerVO customerVO = new CustomerVO();
        BeanUtils.copyProperties(customer, customerVO);
        return customerVO;
    }
}
