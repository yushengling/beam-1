import Vue from 'vue';
import Router from 'vue-router';

Vue.use(Router);

export default new Router({
    routes: [
        {
            path: '/',
            redirect: '/dashboard'
        },
        {
            path: '/',
            component: resolve => require(['../components/common/Home.vue'], resolve),
            meta: { title: '自述文件' },
            children:[
                {
                    path: '/dashboard',
                    component: resolve => require(['../components/page/Dashboard.vue'], resolve),
                    meta: { title: '系统首页' }
                },
                {
                    // 权限页面
                    path: '/permission',
                    component: resolve => require(['../components/page/Permission.vue'], resolve),
                    meta: { title: '权限测试', permission: true }
                },
                {
                    path: '/404',
                    component: resolve => require(['../components/page/404.vue'], resolve),
                    meta: { title: '404' }
                },
                {
                    path: '/403',
                    component: resolve => require(['../components/page/403.vue'], resolve),
                    meta: { title: '403' }
                }
                ,
                {
                    path: '/sysuser',
                    component: resolve => require(['../components/sys/sysuser.vue'], resolve),
                    meta: { title: '用户管理' }
                },
                {
                    path: '/sysrole',
                    component: resolve => require(['../components/sys/sysrole.vue'], resolve),
                    meta: { title: '角色管理' }
                },
                {
                    path: '/sysmenu',
                    component: resolve => require(['../components/sys/sysmenu.vue'], resolve),
                    meta: { title: '菜单管理' }
                },
                {
                    path: '/sysdept',
                    component: resolve => require(['../components/sys/sysdept.vue'], resolve),
                    meta: { title: '部门管理' }
                },
                {
                    path: '/schedulejob',
                    component: resolve => require(['../components/sys/schedulejob.vue'], resolve),
                    meta: { title: '定时任务管理' }
                },
                {
                    path: '/sysdict',
                    component: resolve => require(['../components/sys/sysdict.vue'], resolve),
                    meta: { title: '字典管理' }
                },
                {
                    path: '/loginlog',
                    component: resolve => require(['../components/sys/loginlog.vue'], resolve),
                    meta: { title: '登陆日志' }
                },
                {
                    path: '/operationlog',
                    component: resolve => require(['../components/sys/operationlog.vue'], resolve),
                    meta: { title: '业务日志' }
                }

            ]
        },
        {
            path: '/login',
            component: resolve => require(['../components/page/Login.vue'], resolve)
        },
        {
            path: '*',
            redirect: '/404'
        }
    ]
})
