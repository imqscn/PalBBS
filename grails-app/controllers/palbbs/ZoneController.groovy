package palbbs

import grails.converters.JSON

class ZoneController {

    def pushZoneData(){
        List list = Zone.list()
        render list as JSON
    }

    def createZone(){
        if(User.findById(params.userId as Integer).getState()==0) {
            render 'baned'
        }
        else{
            Zone z = new Zone()
            z.title = params.title
            z.content = ""
            z.date = new Date()
            z.uId = params.userId as Integer
            if(z.save()) render("创建成功！")
            else render('0')
        }
    }

    def pushZoneName(){
        Zone z = Zone.findById(params.zid)
        if(z)
            render z.title
    }

    def index() { }
    def zone(){ }
}
