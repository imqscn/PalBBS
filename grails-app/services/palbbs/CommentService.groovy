package palbbs

import grails.gorm.transactions.Transactional
import groovy.sql.Sql

@Transactional
class CommentService {
    def dataSource
    def getAllComment(int postId) {
        def db = new Sql(dataSource)
        List list = new ArrayList()
        try{
            db.eachRow("""select  c.content,c.date,u.name
          from  comment c, user u
          where c.user_id=u.id and c.post_id="""+ postId +
          " ORDER BY 2 asc;"){
                row -> list.add([row.content,row.date,row.name])
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
