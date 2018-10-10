enum LoginError: Error {
    case wrongPassword
}

class LoginInteractor: LoginPresenterInteractor {
    
    func login(username: String, password: String, completion: (Error?) -> Void) {
        guard password.count >= 8 else {
            completion(LoginError.wrongPassword)
            return
        }
        
        let user = User(username: username, password: password)
        
        user.login { (result, error) in
            guard error == nil else {
                completion(error!)
                return
            }
            
            let newUser = LocalUser(username: username,
                                    password: password,
                                    token: result)
            newUser.store()
            
            completion(nil)
        }
    }
}
