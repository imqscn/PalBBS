package palbbs

import groovy.sql.Sql
import grails.gorm.transactions.Transactional

@Transactional
class PostService {
    def dataSource
    def getAllPostForDeleteMore(){
        def db = new Sql(dataSource)
        List list = new ArrayList()
        try{
            db.eachRow("""select  p.id,p.title,p.date,u.name
          from  post  p, user u
          where p.user_id=u.id  ORDER BY 3 desc;"""){
                row -> list.add([row.id,row.title,row.date,row.name])
            }
        }catch (Exception e){
            e.printStackTrace()
        }finally{
            if(db!=null)
                db.close()
        }
        return list
    }
    def getAllPost(zid) {
        def db = new Sql(dataSource)
        List list = new ArrayList()
        try{
            db.eachRow("""select  p.id,p.title,p.date,u.name
          from  post  p, user u
          where p.user_id=u.id and p.zone_id='"""
                    +zid+"' ORDER BY 3 desc;"){
                row -> list.add([row.id,row.title,row.date,row.name])
            }
        }catch (Exception e){
            e.printStackTrace()
        }finally{
            if(db!=null)
                db.close()
        }
        return list
    }
    def search(String str){
        def db = new Sql(dataSource)
        List list = new ArrayList()
        try{
            db.eachRow("SELECT p.id,p.title,p.content,u.name FROM post p,user u WHERE p.user_id=u.id and (p.content like \"%"+ str +"%\" or title like \"%"+ str +"%\" or u.name like \"%"+ str +"%\")"){
                row -> list.add([row.id,row.title,row.content,row.name])
            }
        }catch (Exception e){
            e.printStackTrace()
        }finally{
            if(db!=null)
                db.close()
        }
        return list
    }
}
