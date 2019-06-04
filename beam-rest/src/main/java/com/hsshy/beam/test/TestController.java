package com.hsshy.beam.test;
import com.hsshy.beam.common.annotion.IgnoreUTokenAuth;
import com.hsshy.beam.common.base.controller.BaseBeanController;
import com.hsshy.beam.common.utils.R;
import com.hsshy.beam.common.utils.RedisUtil;
import com.hsshy.beam.test.dto.LoginForm;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

/**
 * @description: 测试
 * @author: hs
 * @create: 2019-04-01 22:16:07
 **/
@Api(value = "测试",tags = "TestController")
@RequestMapping(value = "/test")
@RestController
public class TestController extends BaseBeanController {

    @Autowired
    private RedisUtil redisUtil;

    /*
    *
    *  请求参数  可以再sign/util/signTest中进行模拟
        {
            "object":"ewogICJwYXNzd29yZCI6ICJzdHJpbmciLAogICJ1c2VybmFtZSI6ICJzdHJpbmciCn0=",
            "sign":"15dedfdf8c0d9d81378a22903ff6ab98"
        }
    *
    *
    */

    //签名方式：
    // 请求对象为 object: 整个对象进行base64编码后的值  sign: 将整个对象进行base64编码得到的值拼接上密钥做md5加密作为sign
    @ApiOperation(value = "登陆")
    @IgnoreUTokenAuth
    @PostMapping(value = "/login")
    public R  login(@RequestBody LoginForm loginForm){
        System.out.println(loginForm.getUsername());
        System.out.println(loginForm.getPassword());
        //存入userId
        String uuid = UUID.randomUUID().toString().replaceAll("-","");
        redisUtil.set(uuid,"1L"); //可以在这设置过期时间 返回登陆后将uuid设置为请求header中的utoken  以后所有请求带上utoken就可以获取到用户ID
        return R.ok(uuid);
    }

    @ApiOperation(value = "免授权")
    @IgnoreUTokenAuth
    @GetMapping(value = "/ignore")
    public R  testIgnore(){

        return R.ok();
    }

    //在登陆完执行

    @ApiOperation(value = "授权")
    @GetMapping(value = "/no/ignore")
    public R  testNoIgnore(){
        System.out.println(getUserId());
        return R.ok();
    }




}
