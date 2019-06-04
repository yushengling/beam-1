package com.hsshy.beam.sys.controller;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hsshy.beam.common.base.controller.BaseController;
import com.hsshy.beam.common.shiro.ShiroUtils;
import com.hsshy.beam.common.utils.R;
import com.hsshy.beam.common.utils.RedisUtil;
import com.hsshy.beam.common.utils.ToolUtil;
import com.hsshy.beam.sys.entity.Dept;
import com.hsshy.beam.sys.entity.Menu;
import com.hsshy.beam.sys.service.IMenuService;
import com.hsshy.beam.sys.wrapper.MenuWrapper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * 菜单管理
 *
 * @author hs
 * @email 457030599@qq.com
 * @date 2018-10-08 16:33:17
 */
@Api(value="MenuController",tags={"Menu接口"})
@RestController
@RequestMapping("/sys/menu")
public class MenuController extends BaseController {

    @Autowired
    private IMenuService menuService;

    @Autowired
    private RedisUtil redisUtil;

    /**
     * 树形菜单
     */
    @ApiOperation(value = "树形菜单")
    @GetMapping("/tree/menu")
    @RequiresPermissions("sys:menu:tree")
    public R treeMenu(Menu menu){

        return R.ok(menuService.treeMenuList(0L,menu));
    }

    /**
     * 导航菜单
     */
    @ApiOperation(value = "导航菜单")
    @GetMapping("/nav")
    public R nav(){
        List<Map> menuList = menuService.getUserMenuList(ShiroUtils.getUserId());
        return R.ok(menuList);
    }

    //分页
    @ApiOperation("分页列表")
    @GetMapping(value = "/page/list")
    public R pageList(Menu menu){

        QueryWrapper qw = new QueryWrapper<Menu>();

        IPage<Map> page = menuService.page(new Page(menu.getCurrentPage(),menu.getPageSize()),qw);
        return R.ok(new MenuWrapper(page).wrap());
    }
    @ApiOperation("列表")
    @GetMapping(value = "/list")
    public R list(Menu menu){

        QueryWrapper qw = new QueryWrapper<Menu>();

        List<Menu> menuList = menuService.list(qw);
        return R.ok(menuList);
    }
    @ApiOperation("保存")
    @RequiresPermissions("sys:menu:save")
    @PostMapping(value = "/save")
    public R save(@RequestBody Menu menu){

        if(ToolUtil.isEmpty(menu.getParentId())){
            menu.setParentId(0L);
        }

        if(menuService.saveOrUpdate(menu)){
            //清除缓存
            redisUtil.clearCache();
            return R.ok();

        }
        else {
            return R.fail();
        }
    }

    @ApiOperation("详情")
    @GetMapping(value = "/info")
    @RequiresPermissions("sys:menu:info")
    public R info(@RequestParam Long menuId){

        Menu menu = menuService.getById(menuId);
        if(ToolUtil.isEmpty(menu)){
            return R.fail("找不到该菜单");
        }

        if(menu.getParentId()!=0){
            Menu pmenu = menuService.getById(menu.getParentId());
            menu.setPname(pmenu.getName());
        }
        else {
            menu.setPname("顶级");

        }
        return R.ok(menu);

    }
    @RequiresPermissions("sys:menu:delete")
    @ApiOperation("删除")
    @PostMapping(value = "/delete")
    public R delete(@RequestBody Long menuIds[]){

        if(ToolUtil.isEmpty(menuIds)||menuIds.length<=0){
            return R.fail("未提交要删除的记录");
        }
        for(Long menuId:menuIds){
            Integer count = menuService.count(new QueryWrapper<Menu>().lambda().eq(Menu::getParentId,menuId));
            if(count>0){
                return R.fail("删除失败，请先删除菜单关联的子菜单");
            }

        }
        //清除缓存
        redisUtil.clearCache();
        menuService.removeByIds(Arrays.asList(menuIds));
        return R.ok();
    }











}