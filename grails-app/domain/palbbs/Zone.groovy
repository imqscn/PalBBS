package palbbs

class Zone {
    String title
    String content
    Date date
    int uId
    static constraints = {
        title(blank: false)
    }
}
