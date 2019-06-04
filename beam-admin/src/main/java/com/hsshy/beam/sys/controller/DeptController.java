package com.hsshy.beam.sys.controller;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hsshy.beam.common.utils.R;
import com.hsshy.beam.common.utils.ToolUtil;
import com.hsshy.beam.sys.entity.Dept;
import com.hsshy.beam.sys.entity.Menu;
import com.hsshy.beam.sys.service.IDeptService;
import com.hsshy.beam.common.base.controller.BaseController;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 部门管理
 *
 * @author hs
 * @email 457030599@qq.com
 * @date 2018-12-17 15:21:00
 */
@Api(value="DeptController",tags={"Dept接口"})
@RequestMapping("/sys/dept")
@RestController
public class DeptController extends BaseController {

    @Autowired
    private IDeptService deptService;


    //分页
    @ApiOperation("分页列表")
    @GetMapping(value = "/page/list")
    public R pageList(Dept dept){

        QueryWrapper qw = new QueryWrapper<Dept>();

        IPage page = deptService.page(new Page(dept.getCurrentPage(),dept.getPageSize()),qw);
        return R.ok(page);
    }
    @ApiOperation("列表")
    @GetMapping(value = "/list")
    public R list(Dept dept){

        QueryWrapper qw = new QueryWrapper<Dept>();

        List<Dept> deptList = deptService.list(qw);
        return R.ok(deptList);
    }
    @ApiOperation("保存")
    @PostMapping(value = "/save")
    @RequiresPermissions("sys:dept:save")
    public R save(@RequestBody Dept dept){

        deptService.saveOrUpdate(dept);
        return R.ok();
    }
    @ApiOperation("删除")
    @PostMapping(value = "/delete")
    @RequiresPermissions("sys:dept:del")
    public R delete(@RequestBody Long deptIds[]){

        if(ToolUtil.isEmpty(deptIds)||deptIds.length<=0){
            return R.fail("未提交要删除的记录");
        }
            deptService.removeByIds(Arrays.asList(deptIds));
        return R.ok();
    }

    /**
     * 树形
     */
    @ApiOperation(value = "树形部门")
    @RequiresPermissions("sys:dept:tree")
    @GetMapping("/tree/dept")
    public R treeDept(Dept dept){
        return R.ok(deptService.treeDeptList(0L,dept));
    }


    @ApiOperation("详情")
    @GetMapping(value = "/info")
    @RequiresPermissions("sys:dept:info")
    public R info(@RequestParam Long deptId){

        Dept dept = deptService.getById(deptId);
        if(ToolUtil.isEmpty(dept)){
            return R.fail("找不到该部门");
        }

        if(dept.getParentId()!=0){
            Dept pdept = deptService.getById(dept.getParentId());
            dept.setPname(pdept.getName());
        }
        else {
            dept.setPname("顶级");

        }
        return R.ok(dept);
    }






}