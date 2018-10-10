struct User {
    let username :String
    let password :String
    
    func login(completion: (String?, Error?) -> Void) {
        //Alamofire
    }
}

struct LocalUser {
    let username :String
    let password :String
    let token : String?
    
    func store() {
        // Store locally user data
    }
}
