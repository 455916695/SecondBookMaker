package com.ax.service;

import com.ax.pojo.SBResult;
import com.ax.pojo.TbUser;

public interface UserService {

    //check
    public SBResult check (String param, Integer type);

    SBResult register(TbUser tbUser);

    SBResult login(TbUser tbUser);
}
