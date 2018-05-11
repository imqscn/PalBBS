package palbbs

class Post {
    String title
    String content
    Date date
    int userId
    int zoneId
    static constraints = {
        title(blank: false)
    }
}
