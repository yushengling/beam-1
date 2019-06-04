# beam-parent

#### 项目介绍
- Beam基于SpringBoot 2，致力于做更简洁的后台管理系统，一款快速开发的脚手架。springmvc + shiro + MyBatis-Plus + vue。
- 基础模块：
  -  **用户管理**
  -  **角色管理** 
  -  **部门管理**
  -  **菜单模块**
  -  **定时任务**
  -  **字典管理**
  -  **登陆日志**
  -  **业务日志**
- 项目代码参考了
  - Guns：https://gitee.com/stylefeng/guns
  - renren-security：https://gitee.com/renrenio/renren-security
  - vue-manage-system：https://github.com/lin-xin/vue-manage-system
  
- 项目特点：
  - **使用SpringBoot自动装配，MyBatis-Plus配置文件提为默认配置放在了common包的default-config.properties中，
  子项目的xml只需固定放在com/hsshy/beam/\*/mapping/\*.xml，实体类固定放在com.hsshy.beam.\**.entity中。
  即可使用MyBatis-Plus。若不使用默认配置，可在子工程配置文件直接写入自己的配置即可覆盖。**
  - **提出公共的模块，service、dao、entity接口和后台管理系统可共用（将相应的模块放在beam-web中），当然也可不共用，只需将相应的模块放在子工程中**
  - **接口模块已添加拦截和post请求签名，可直接使用**
  - **后端使用guns的map+wrapper返回方式返回字段的字典值**
  - **前后端分离**
  - **集成了异步插入日志**
  - **实现了基础的用户角色菜单权限动态配置**
  - **日志分类等**



#### 项目结构
````
beam-parent
├─beam-common     公共模块
│ 
├─beam-admin     管理后台
│        └─resources 
│           ├─application.yml  配置文件
│           ├─logback-spring.xml  日志配置文件
│ 
├─beam-rest        API服务 （post请求签名、token)
│        
│ 
├─beam-generator  代码生成器
│        └─resources 
│           ├─mapper   MyBatis文件
│           ├─template 代码生成器模板（可增加或修改相应模板）
│           ├─application.yml    全局配置文件
│           └─generator.properties   代码生成器，配置文件
│       
│ 
├─beam-web  公用实体类、dao、service
│   
│ 
├─doc  数据库sql文件
│ 
│ 
│ 
````

<br>

#### 技术选型
- 核心框架：Spring Boot 2.1.3
- 安全框架：Apache Shiro 1.4
- 视图框架：Spring MVC 5.0
- 持久层框架：MyBatis-Plus 3.0-RC1
- 定时器：Quartz 2.3
- 数据库连接池：hikari
- 页面交互：Vue2.x
- 前后端分离
- 缓存：Redis
- 图片上传：七牛云

#### Spring Boot其他案例：https://gitee.com/hsshy/beam-example
- 秒杀案例模块（加锁、aop加锁、redis锁、消息队列）
- 动态数据源案例模块
- Spring Boot 整合RabbitMQ案例
- Spring Boot 整合dubbo消费者
- Spring Boot 整合dubbo服务提供者
- Spring Boot 整合email发送邮件（异步发送、消息队列发送）
- Spring Boot 整合Kafka案例


#### 软件需求
- JDK1.8
- MySQL5.5+
- Maven3.0+
- Redis
- lombok插件

#### 前端地址：
/html/beam-manage-system

#### 演示地址
http://www.hsshy.com
演示账户：test 123456

#### 常见问题
第一次运行项目若菜单没有出来，先注释掉MenuServiceImpl里的缓存注解

#### 项目截图
##### 后台管理系统：
![image.png](https://upload-images.jianshu.io/upload_images/13498144-c83089109737709c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/13498144-3efb2aa334717c6b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/13498144-47608fef199fac65.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/13498144-23439e67ae3df2f7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/13498144-01f8a58a32d513ca.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/13498144-81e727c82affa1b0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/13498144-32261ca3ec99e6ee.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/13498144-5bb29689629e43c9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/13498144-56d2d548f945d51b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### 代码生成器使用（待续...）
###### 代码生成器是独立的，可以随时删掉或者独立成一个项目
- 1、修改generator.properties里的配置，例如包路径、表前缀、作者
- 2、运行代码生成器：http://localhost:8083/beam-generator/#generator.html
- 3、选中要生成的表、点击生成
- 4、将生成的实体类、dao、service、controller、vue、js放到对应的目录下

#### 部署流程
##### 后端：
- 打包：package -Dmaven.test.skip=true -P produce -f pom.xml
- 上传：scp -r beam-admin-0.0.1-SNAPSHOT.jar root@xxx.xx.xx.xx:/usr/local/beam/
- 启动：将doc下的脚本上传到和jar包相同目录下，运行脚本(记得给脚本权限)
- 查看运行日志：tail -f xxx/log_total.log(xxx文件名为yml配置的的log.path)
##### 前端（这边是用nginx进行部署）：
- 打包：npm run build
- 上传：进入dist文件夹，scp -r * root@xx.xx.xx.xx:/etc/nginx/html/beam-manage-system/
- nginx配置请参考doc下的beam.conf文件,可直接传到服务器下的nginx/conf.d/下进行使用，记得删除默认的default.conf文件。

#### 部署可能出现的问题
- 数据库改成大小写不敏感
- 脚本运行报错（执行dos2unix deploy.sh，window环境下与Linux环境下文本格式有所不同）

### 加入Java互助群
搜索qq号：750416471