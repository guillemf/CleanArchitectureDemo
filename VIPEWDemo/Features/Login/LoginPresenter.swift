class LoginPresenter :LoginViewPresenter {
    private var view :LoginPresenterView
    private var interactor :LoginPresenterInteractor
    
    init(view: LoginPresenterView, interactor: LoginPresenterInteractor) {
        self.view = view
        self.interactor = interactor
        self.view.presenter = self
    }
    
    func doLogin() {
        let username = view.getUsername()
        let password = view.getPassword()
        
        // Verify
        guard !username.isEmpty else {
            view.showError("Username should contain user name")
            return
        }
        
        guard !password.isEmpty else {
            view.showError("Password should not be empty")
            return
        }
        
        interactor.login(username: username, password: password) { (error) in
            guard error == nil else {
                view.showError(error!.localizedDescription)
                return
            }
            
            // No error
            // Navigate to Main window
        }
    }
}
