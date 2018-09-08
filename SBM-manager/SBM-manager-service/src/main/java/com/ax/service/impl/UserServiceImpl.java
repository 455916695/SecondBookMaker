package com.ax.service.impl;

import com.ax.mapper.TbUserMapper;
import com.ax.pojo.SBResult;
import com.ax.pojo.TbUser;
import com.ax.pojo.TbUserExample;
import com.ax.service.UserService;
import com.ax.utils.IDUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private TbUserMapper tbUserMapper;

    /**
     *  校验数据是否已经在数据库存在
     * */
    public SBResult check(String param, Integer type) {

       TbUserExample tbUserExample = new TbUserExample();
        TbUserExample.Criteria criteria = tbUserExample.createCriteria();

        SBResult sbResult = null;

        //路径上带参数 1 表示校验用户名， 2表示校验手机号
        if(type.intValue() == 1 ) {
            //校验用户名是否存在
            criteria.andUsernameEqualTo(param);
            List<TbUser> tbUsers = tbUserMapper.selectByExample(tbUserExample);
            if(tbUsers != null && tbUsers.size() >0) {
                sbResult  = SBResult.build(500,"用户名已存在",false);
            }else{
                sbResult  = SBResult.ok(true);
            }
        }else if (type.intValue() == 2) {
            //校验手机号是否存在
            criteria.andPhoneEqualTo(param);
            List<TbUser> tbUsers = tbUserMapper.selectByExample(tbUserExample);
            if(tbUsers != null && tbUsers.size() >0) {
                sbResult  = SBResult.build(500,"手机号已存在",false);
            }else{
                sbResult  = SBResult.ok(true);
            }
        }else {
             sbResult = SBResult.build(500, "数据类型不正确", false);
        }

        return sbResult;
    }

     /**
      *  注册用户
      * */
    public SBResult register(TbUser tbUser) {
        SBResult sbResult = SBResult.ok(true);
        //校验用户数据是否为空，并且校验数据是否已经存在
        if(StringUtils.isBlank(tbUser.getUsername())) { //校验用户名
              return sbResult = SBResult.build(500,"用户名不能为空",false);
        }else {
              sbResult = check(tbUser.getUsername(), 1);
              if(!(boolean)sbResult.getData()) {
                    return sbResult;
              }
        }

        //校验用户数据是否为空，并且校验数据是否已经存在
        if(StringUtils.isBlank(tbUser.getPhone())) { //校验手机号
            return sbResult = SBResult.build(500,"手机号不能为空",false);
        }else {
            sbResult = check(tbUser.getPhone(), 2);
            if(!(boolean)sbResult.getData()) {
                return sbResult;
            }
        }

        if(StringUtils.isBlank(tbUser.getPassword())) { //校验密码
            return sbResult = SBResult.build(500,"密码不能为空",false);
        }

        //提交数据将用户数据添加到表单中
        //对密码加密
        String  mdPassword  = DigestUtils.md5DigestAsHex(tbUser.getPassword().getBytes());
        tbUser.setPassword(mdPassword);
        //补全用户id
        tbUser.setId(IDUtils.genItemId());
        //补全创建时间
        tbUser.setCreateTime(new Date());
        //补全更新时间
        tbUser.setUpdateTime(new Date());

        tbUserMapper.insert(tbUser);

        return sbResult;
    }

    /**
     *  用户登录
     *
     * */
    public SBResult login(TbUser tbUser) {
        TbUserExample tbUserExample = new TbUserExample();
        tbUserExample.createCriteria().andPhoneEqualTo(tbUser.getPhone());
        // 调用方法查询数据
        List<TbUser> tbUsers = tbUserMapper.selectByExample(tbUserExample);
        if(tbUsers != null & tbUsers.size() > 0){
            String password = tbUser.getPassword();
            password = DigestUtils.md5DigestAsHex(password.getBytes());
            if(StringUtils.isNotBlank(password)&&password.equals(tbUsers.get(0).getPassword())) {
                return  SBResult.ok(true);
            }else{
                return SBResult.build(500,"密码错误",false);
            }
        }
        //返回结果
        return SBResult.build(500,"用户不存在",false);
    }
}
