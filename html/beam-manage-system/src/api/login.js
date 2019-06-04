import http from '@/util/http'
export default {
    // 登录
    login : params => {
        return http.post("/login", params)
    }
}
