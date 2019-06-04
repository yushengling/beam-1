/**
 * Copyright 2018 人人开源 http://www.renren.io
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 * <p>
 * http://www.apache.org/licenses/LICENSE-2.0
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */

package com.hsshy.beam.sys.controller;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hsshy.beam.common.factory.impl.ConstantFactory;
import com.hsshy.beam.common.quartz.ScheduleJob;
import com.hsshy.beam.common.utils.R;
import com.hsshy.beam.common.utils.ToolUtil;
import com.hsshy.beam.sys.entity.ScheduleJobEntity;
import com.hsshy.beam.sys.service.ScheduleJobService;
import com.hsshy.beam.sys.wrapper.ScheduleWrapper;
import org.apache.commons.beanutils.PropertyUtilsBean;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.quartz.CronExpression;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.beans.PropertyDescriptor;
import java.util.HashMap;
import java.util.Map;


/**
 * 定时任务
 *
 * @author Mark sunlightcs@gmail.com
 * @since 1.2.0 2016-11-28
 */
@RestController
@RequestMapping("/sys/schedule")
public class ScheduleJobController {
	@Autowired
	private ScheduleJobService scheduleJobService;
	
	/**
	 * 定时任务列表
	 */
	@RequestMapping("/page/list")
	@RequiresPermissions("sys:schedule:list")
	public R list(ScheduleJobEntity scheduleJobEntity){

		QueryWrapper qw = new QueryWrapper<Map>();
		if(ToolUtil.isNotEmpty(scheduleJobEntity.getStatus())){
			qw.eq("status",scheduleJobEntity.getStatus());
		}
		if(ToolUtil.isNotEmpty(scheduleJobEntity.getBeanName())){
			qw.like("bean_name",scheduleJobEntity.getBeanName());
		}

		IPage<ScheduleJob> page = scheduleJobService.page(new Page(scheduleJobEntity.getCurrentPage(),scheduleJobEntity.getPageSize()),qw);


		return R.ok(new ScheduleWrapper(page).wrap());
	}

	/**
	 * 定时任务信息
	 */
	@RequestMapping("/info/{jobId}")
//	@RequiresPermissions("sys:schedule:info")
	public R info(@PathVariable("jobId") Long jobId){
		ScheduleJobEntity schedule = scheduleJobService.getById(jobId);
		
		return R.ok(schedule);
	}
	
	/**
	 * 保存定时任务
	 */
	@RequestMapping("/save")
	@RequiresPermissions("sys:schedule:save")
	public R save(@RequestBody ScheduleJobEntity scheduleJob){
		if(CronExpression.isValidExpression(scheduleJob.getCronExpression())){
			scheduleJobService.saveScheduleJob(scheduleJob);
			return R.ok();

		}
		else {
			return R.fail("cron表达式有误");
		}

	}
	
	/**
	 * 修改定时任务
	 */
	@RequestMapping("/update")
	@RequiresPermissions("sys:schedule:update")
	public R update(@RequestBody ScheduleJobEntity scheduleJob){
		if(CronExpression.isValidExpression(scheduleJob.getCronExpression())){
			scheduleJobService.update(scheduleJob);

			return R.ok();
		}
		else {
			return R.fail("cron表达式有误");
		}

	}
	
	/**
	 * 删除定时任务
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("sys:schedule:delete")
	public R delete(@RequestBody Long[] jobIds){
		scheduleJobService.deleteBatch(jobIds);
		
		return R.ok();
	}
	
	/**
	 * 立即执行任务
	 */
	@RequestMapping("/run")
//	@RequiresPermissions("sys:schedule:run")
	public R run(@RequestBody Long[] jobIds){
		scheduleJobService.run(jobIds);
		
		return R.ok();
	}
	
	/**
	 * 暂停定时任务
	 */
	@RequestMapping("/pause")
//	@RequiresPermissions("sys:schedule:pause")
	public R pause(@RequestBody Long[] jobIds){
		scheduleJobService.pause(jobIds);
		
		return R.ok();
	}
	
	/**
	 * 恢复定时任务
	 */
	@RequestMapping("/resume")
//	@RequiresPermissions("sys:schedule:resume")
	public R resume(@RequestBody Long[] jobIds){
		scheduleJobService.resume(jobIds);
		
		return R.ok();
	}

	/**
	 * 获取定时任务状态下拉框
	 */
	@GetMapping("/status/list")
	public R getStatusList(){
		return R.ok(ConstantFactory.me().getDictListByCode("schedule_status"));
	}

}
