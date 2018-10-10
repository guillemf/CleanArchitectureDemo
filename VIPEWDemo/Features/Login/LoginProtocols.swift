// View -> Presenter
protocol LoginViewPresenter {
    func doLogin() -> Void
}

// Presenter -> View
protocol LoginPresenterView {
    var presenter: LoginViewPresenter? { get set }
    func getUsername() -> String
    func getPassword() -> String
    
    func showError(_ error :String)
}

// Presenter -> Interactor
protocol LoginPresenterInteractor {
    func login(username :String, password :String,
               completion: (Error?) -> Void)
}
