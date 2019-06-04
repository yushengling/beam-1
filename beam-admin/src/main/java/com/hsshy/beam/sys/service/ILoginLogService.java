package com.hsshy.beam.sys.service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hsshy.beam.sys.entity.LoginLog;
import org.apache.ibatis.annotations.Param;

/**
 * 登陆日志
 *
 * @author hs
 * @email 457030599@qq.com
 * @date 2019-04-12 14:08:56
 */
public interface ILoginLogService extends IService<LoginLog> {


    IPage<LoginLog> selectPageList(Page page, LoginLog loginLog);

    void  deleteAll();

}
