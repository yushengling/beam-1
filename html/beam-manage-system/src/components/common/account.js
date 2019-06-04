
import http from '@/util/http'


export default {
    // 修改密码
    modifyPwd : params => {
        return http.post("/sys/user/change/password", params)
    },
    handleLogout:()=>{
    	return http.get("/logout", {})
    },
    getNavList:()=>{
        return http.get("/sys/menu/nav", {})
    },
    clearCache:()=>{
        return http.get("/clearCache", {})
    },

}
