import UIKit

class LoginView: UIView, LoginPresenterView {
    var presenter: LoginViewPresenter?
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("LoginView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func getUsername() -> String {
        guard let username = username.text else {
            return ""
        }
        return username
    }
    
    func getPassword() -> String {
        guard let password = password.text else {
            return ""
        }
        return password
    }
    
    @objc func doLogin(sender: UIButton) {
        presenter?.doLogin()
    }
    
    func showError(_ error: String) {
        print("Error \(error)")
    }
}
