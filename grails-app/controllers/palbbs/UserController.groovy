package palbbs

class UserController {
    def signIn(){
        try {
            User u = User.findByNameAndPw(params.name,params.password)
            if(u) render("登录成功，关闭窗口后跳转！")
            else render("用户名或密码错误！")
        }catch (Exception e){
            render "数据库连接异常！"
        }

    }
    def adminSignIn(){
        try {
            User a = User.findByNameAndPw(params.name,params.password)
            if(a){
                if(a.level == 0)
                    render"登录失败，您不是管理员！"
                else render '1'
            }
            else render("用户名或密码错误！")
        }catch (Exception e){
            render "数据库连接异常！"
        }

    }

    def signUp(){
        try {
            User u = new User()
            u.name = params.username
            u.pw = params.password
            u.state = 0
            u.level = 0
            if(u.save()) render("注册成功！")
            else render("注册失败！用户名或密码超出长度或用户名重复")
        }catch (Exception e){
            render "数据库连接异常！"
        }

    }
    def login() { }
    def admin() { }
}
