package palbbs

import grails.converters.JSON


class PostController {
    def PostService
    def deletePost(){
        Post p = Post.findById(params.id as Integer)
        try {
            p.delete(flush:true)
            render '1'
        }catch (Exception e){
            render '0'
        }
    }

    def CreatePost(){
        if(User.findById(params.userId as Integer).getState()==0) {
            render 'baned'
        }
        else{
            Post p = new Post()
            p.title = params.title
            p.content = params.main
            p.date = new Date()
            p.userId = params.userId as Integer
            p.zoneId = 0
            if(p.save()) render("发布成功！")
            else render('0')
        }
    }

    def pushPostData(){
        List list = PostService.getAllPost()
        render list as JSON
    }

    def pushSearchData(){
        List list = PostService.search(params.word)
        render list as JSON
    }

    def search(){ }
    def deletePosts(){ }
    def post() { }
}
