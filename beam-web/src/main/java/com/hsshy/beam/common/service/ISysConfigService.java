package com.hsshy.beam.common.service;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hsshy.beam.common.entity.SysConfig;

/**
 * <p>
 * 系统配置信息表 服务类
 * </p>
 *
 * @author stylefeng
 * @since 2018-10-15
 */
public interface ISysConfigService extends IService<SysConfig> {

     <T> T getConfigObject(String key, Class<T> clazz);

     void updateValueByKey(String key, String value);

     String getValue(String key, String defaultValue) ;

}
