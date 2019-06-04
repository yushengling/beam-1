package com.hsshy.beam.sys.controller;
import com.google.code.kaptcha.Constants;
import com.hsshy.beam.common.base.controller.BaseAdminController;
import com.hsshy.beam.common.log.LogManager;
import com.hsshy.beam.common.log.factory.LogTaskFactory;
import com.hsshy.beam.common.shiro.ShiroUtils;
import com.hsshy.beam.common.util.KaptchaUtil;
import com.hsshy.beam.common.utils.R;
import com.hsshy.beam.common.utils.RedisUtil;
import com.hsshy.beam.sys.dto.LoginForm;
import com.hsshy.beam.sys.entity.User;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import static com.hsshy.beam.common.support.HttpKit.getIp;

@RestController
public class LoginController  {

    @Autowired
    private RedisUtil redisUtil;


    @PostMapping(value = "/login")
    @ResponseBody
    public Object login(@RequestBody LoginForm loginForm){

        if(new KaptchaUtil().isKaptchaOnOff()){
            String kaptcha = ShiroUtils.getKaptcha(Constants.KAPTCHA_SESSION_KEY);
            if(!loginForm.getCaptcha().equalsIgnoreCase(kaptcha)){
                return R.fail("验证码不正确");
            }
        }
        try{
            Subject subject = ShiroUtils.getSubject();
            UsernamePasswordToken token = new UsernamePasswordToken(loginForm.getUsername(), loginForm.getPassword());
            subject.login(token);
            LogManager.me().executeLog(LogTaskFactory.loginLog(ShiroUtils.getUserId(), getIp()));

        }catch (UnknownAccountException e) {
            return R.fail(e.getMessage());
        }catch (IncorrectCredentialsException e) {
            return R.fail("账号或者密码不正确");
        }catch (LockedAccountException e) {
            return R.fail("账号已被锁定,请联系管理员");
        }catch (AuthenticationException e) {
            return R.fail("账户验证失败");
        }
        return R.ok(ShiroUtils.getUserEntity());
    }



    /**
     * 退出
     */
    @GetMapping(value = "/logout")
    @ResponseBody
    public Object logout() {
        ShiroUtils.logout();
        return R.ok("退出成功");
    }

    /**
     * 清除缓存
     */
    @GetMapping(value = "/clearCache")
    @ResponseBody
    public R clearCache() {
        redisUtil.clearCache();
        return R.ok("清除成功");
    }






}
