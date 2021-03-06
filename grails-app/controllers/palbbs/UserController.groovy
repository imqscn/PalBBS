package palbbs

import grails.converters.JSON

class UserController {
    def signIn(){
        try {
            User u = User.findByNameAndPw(params.name,params.password)
            if(u) {
                session.setAttribute("userId","")
                session.setAttribute("userName","")
                session.setAttribute("userStatus","")
                session.setAttribute("userId",u.id)
                session.setAttribute("userName",u.name)
                session.setAttribute("userState",u.state)
                render("登录成功，关闭对话框后跳转！")
            }

            else render("用户名或密码错误！")
        }catch (Exception e){
            render "数据库连接异常！"
        }

    }

    def pullUserInfo(){
        List list = User.list()
        render list as JSON
    }

    def adminSignIn(){
        try {
            User a = User.findByNameAndPw(params.name,params.password)
            if(a){
                if(a.level == 0)
                    render"登录失败，您不是管理员！"
                else {
                    render '1'
                    session.setAttribute("userId","")
                    session.setAttribute("userName","")
                    session.setAttribute("userStatus","")
                    session.setAttribute("userId",a.id)
                    session.setAttribute("userName",a.name)
                    session.setAttribute("userStatus",a.state)
                }
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
            u.state = 1
            u.level = 0
            if(u.save()) render("注册成功！")
            else render("注册失败！用户名或密码超出长度或用户名重复")
        }catch (Exception e){
            render "数据库连接异常！"
        }

    }

    def banUser(){
        User u = User.findById(params.id as Integer)
        u.state = 0
        if(u.save(flush: true)){
            render "封禁成功"
        }

    }
    def deBanUser(){
        User u = User.findById(params.id as Integer)
        u.state = 1
        if(u.save(flush: true)){
            render "解封成功"
        }
    }

    def changeName(){
        User u = User.findById(params.id as Integer)
        if(u){
            u.name = params.name
            if(u.save(flush:true)){
                session.setAttribute("userName","")
                session.setAttribute("userName",params.name)
                render "修改用户名成功"
            }
            else render "修改失败，用户名为空或与他人重复"
        }
    }

    def changePw(){
        User u = User.findById(params.id as Integer)
        if(u){
            u.pw = params.pw
            if(u.save(flush:true)){
                render "修改密码成功"
            }
            else render "修改失败，密码不能为空"
        }
    }

    def login() { }
    def admin() { }
    def myinfo(){ }
}
