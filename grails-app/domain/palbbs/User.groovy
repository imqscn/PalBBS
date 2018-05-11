package palbbs

class User {
    String pw
    String name
    byte state
    byte level

    static constraints = {
        name(unique: true,blank: false)
        pw(blank: false,size: 1..40)
    }
}
