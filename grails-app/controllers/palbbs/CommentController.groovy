package palbbs

import grails.converters.JSON

class CommentController {
    def CreateComment(){
        Comment c = new Comment()
        c.content = params.main
        c.date = new Date()
        c.userId = 1
        c.postId = params.pid.toInteger()
        if(c.save()) render("发布成功！")
        else render("回复失败，内容异常！"+"debug:"+c.cDate())
    }

    def pushCommentData(){
        def comment = Comment.findAllByPostId(params.pid.toInteger())
        render comment as JSON
    }

    def pushPostDataInCommentPage(){
        def post = Post.findById(params.pid.toInteger())
        render post as JSON
    }

    def deleteThisPost(){
        Post p = Post.findById(params.pid.toInteger())
        p.delete(flush: true)
        render("删除成功")
    }
    def comment() { }
}
