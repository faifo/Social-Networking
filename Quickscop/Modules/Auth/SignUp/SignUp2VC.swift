//
//  SignUp2VC.swift
//  Quickscop
//
//  Created by Solo on 22/10/2021.
//

import UIKit
import Moya
import ObjectMapper

class SignUp2VC: BaseVC {
    
    let emailTag = 996
    let passwordTag = 995
    let confirmPasswordTag = 994
    @IBOutlet weak var tf_email: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    
    @IBOutlet weak var tf_confirmPassword: UITextField!
    
    @IBOutlet weak var btn_showPassword: UIButton!
    @IBOutlet weak var btn_showConfirmPassword: UIButton!
    @IBOutlet weak var lbl_step: UILabel!
    
    @IBOutlet weak var btn_signUp: UIButton!
    
    @IBOutlet weak var btn_signIn: UIButton!
    
    var registerParams : RegisterParameters!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setUpUI() {
        tf_email.attributedPlaceholder = NSAttributedString(string: "email".l10n(), attributes: [NSAttributedString.Key.font : AppFont.regular(size: 18),
                                                                                                      NSAttributedString.Key.foregroundColor: UIColor.init(white: 1, alpha: 0.65)])
        tf_email.font = AppFont.regular(size: 18)
        tf_email.textColor = UIColor.white
        
        
        tf_password.attributedPlaceholder = NSAttributedString(string: "password".l10n(), attributes: [NSAttributedString.Key.font : AppFont.regular(size: 18),
                                                                                                      NSAttributedString.Key.foregroundColor: UIColor.init(white: 1, alpha: 0.65)])
        tf_password.font = AppFont.regular(size: 18)
        tf_password.textColor = UIColor.white
        tf_password.isSecureTextEntry = true
        
        tf_confirmPassword.attributedPlaceholder = NSAttributedString(string: "confirm_password".l10n(), attributes: [NSAttributedString.Key.font : AppFont.regular(size: 18),
                                                                                                      NSAttributedString.Key.foregroundColor: UIColor.init(white: 1, alpha: 0.65)])
        tf_confirmPassword.font = AppFont.regular(size: 18)
        tf_confirmPassword.textColor = UIColor.white
        tf_confirmPassword.isSecureTextEntry = true
        
        btn_showPassword.setAttributedTitle(NSAttributedString(string: "view".l10n().uppercased(), attributes: [
            NSAttributedString.Key.font : AppFont.bold(size: 9),
            NSAttributedString.Key.foregroundColor: UIColor.white,

        ]), for: .normal)
        
        btn_showConfirmPassword.setAttributedTitle(NSAttributedString(string: "view".l10n().uppercased(), attributes: [
            NSAttributedString.Key.font : AppFont.bold(size: 9),
            NSAttributedString.Key.foregroundColor: UIColor.white,

        ]), for: .normal)
        
        btn_showPassword.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        btn_showConfirmPassword.addTarget(self, action: #selector(showConfirmPassword), for: .touchUpInside)

        lbl_step.font = AppFont.regular(size: 12)
        lbl_step.textColor = UIColor.white
        lbl_step.text = "2/2"
        
        btn_signUp.gradientButton(titleStr: "sign_up".l10n())
        btn_signIn.clearButton(titleStr: "sign_in".l10n())
        
        btn_signUp.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        btn_signIn.addTarget(self, action: #selector(showSignIn), for: .touchUpInside)
        
        // create right barbutton
        let rightButton = UIButton(type: .custom)
        rightButton.setAttributedTitle(NSAttributedString(string: "skip".l10n(), attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.font : AppFont.regular(size: 14)
        ]), for: .normal)
        let rightBarButtonItem = UIBarButtonItem(customView: rightButton)
        navigationItem.rightBarButtonItem = rightBarButtonItem
        

        tf_email.tag = emailTag
        tf_password.tag = passwordTag
        tf_confirmPassword.tag = confirmPasswordTag
        
        tf_email.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        tf_password.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        tf_confirmPassword.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)

        
    }
    
    @objc func textFieldDidChange(textField : UITextField) {
        let text = textField.text
        switch textField.tag {
        case emailTag:
            registerParams.email = text
        case passwordTag:
            registerParams.password = text
        case confirmPasswordTag:
            registerParams.password_confirmation = text
        default:
            break
        }
    }
    
    @objc func showPassword() {
        tf_password.isSecureTextEntry = !tf_password.isSecureTextEntry
    }
    
    @objc func showConfirmPassword() {
        tf_confirmPassword.isSecureTextEntry = !tf_confirmPassword.isSecureTextEntry
    }
    
    @objc func signUp() {
        //validated first
        guard let email = registerParams.email else {
            state = .Alert("Please enter Email", nil)
            return
        }
        
        guard email.isEmail else {
            state = .Alert("Please enter valid Email", nil)
            return
        }
        
        guard let password = registerParams.password else {
            state = .Alert("Please enter Password", nil)
            return
        }
        
        guard let passwordConfirm = registerParams.password_confirmation else {
            state = .Alert("Please enter Password Confirmation", nil)
            return
        }
        
        guard password == passwordConfirm else {
            state = .Alert("Password not match", nil)
            return
        }

        state = .Loading("Sign up ...")
        //do sign up
        let provider = MoyaProvider<QuickScop>()
        provider.request(.register(
            first_name: registerParams.first_name!,
            last_name: registerParams.last_name!,
            username: registerParams.username!,
            email: registerParams.email!,
            password: registerParams.password!,
            password_confirmation: registerParams.password_confirmation!)) { result in
                switch result {
                case let .success(response):
                    let statusCode = response.statusCode
                    switch statusCode {
                    case 201:
                        // do success request
                        // move to main screen
                        DispatchQueue.main.async {
                            self.state = .Idle
                            self.setMainWindow()
                        }
                    default:
                        // handle error
                        print("test")
                    }
                case .failure:
                    self.state = .Alert("Please try again!", nil)
            }
        }
        
    }
    
    @objc func showSignIn() {
        resetWindow(with: StoryboardBuilder.shared.signIn())
    }
}
