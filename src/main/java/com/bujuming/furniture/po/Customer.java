package com.bujuming.furniture.po;

import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

@TableName("furniture_customer")
@Data
public class Customer {
    private Long id;
    private String nickname;
    private String password;
}
