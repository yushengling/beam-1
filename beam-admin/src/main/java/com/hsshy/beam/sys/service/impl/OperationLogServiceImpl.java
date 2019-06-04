package com.hsshy.beam.sys.service.impl;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hsshy.beam.sys.dao.OperationLogMapper;
import com.hsshy.beam.sys.entity.LoginLog;
import com.hsshy.beam.sys.entity.OperationLog;
import com.hsshy.beam.sys.service.IOperationLogService;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
/**
 * 操作日志
 *
 * @author hs
 * @email 457030599@qq.com
 * @date 2019-04-12 14:12:44
 */
@Service
public class OperationLogServiceImpl extends ServiceImpl<OperationLogMapper, OperationLog> implements IOperationLogService {

    @Override
    public IPage<OperationLog> selectPageList(Page page, OperationLog operationLog) {
        return baseMapper.selectPageList(page,operationLog);
    }

    @Override
    public void deleteAll() {
        baseMapper.deleteAll();
    }
}
