package palbbs

import grails.converters.JSON

class PostController {
    def deleteAllPost(){
        for(int i=0;i<100;i++){
            Post p = Post.findById(i)
            if(p)p.delete(flush: true)
        }
        render("删除成功！")
    }

    def CreatePost(){
        Post p = new Post()
        p.title = params.title
        p.content = params.main
        p.date = new Date()
        p.userId = 1
        p.zoneId = 0
        if(p.save()) render("发布成功！")
        else render("发布失败，内容异常！"+"debug:"+p.pDate())
    }

    def pushPostData(){
        def post = Post.all
        render post as JSON
    }

    def post() { }
}
