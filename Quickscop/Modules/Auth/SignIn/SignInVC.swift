//
//  SignInVCViewController.swift
//  Quickscop
//
//  Created by GnolDrol on 10/22/21.
//

import UIKit
import L10n_swift
import RxSwift
import RxCocoa

class SignInVC: BaseVC {

    @IBOutlet weak var btn_forgotPassword: UIButton!
    @IBOutlet weak var imgv_validated: UIImageView!
    @IBOutlet weak var tf_password: UITextField!
    @IBOutlet weak var tf_email: UITextField!
    
    @IBOutlet weak var btn_signUp: UIButton!
    @IBOutlet weak var btn_signIn: UIButton!
    @IBOutlet weak var btn_show: UIButton!
    
   
    let disposebag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setUpUI() {
        super.setUpUI()
        imgv_validated.isHidden = true
        
        tf_email.attributedPlaceholder = NSAttributedString(string: "your_email".l10n(), attributes: [NSAttributedString.Key.font : AppFont.regular(size: 18),
                                                                                                      NSAttributedString.Key.foregroundColor: UIColor.init(white: 1, alpha: 0.65)])
        tf_password.attributedPlaceholder = NSAttributedString(string: "your_password".l10n(), attributes: [NSAttributedString.Key.font : AppFont.regular(size: 18),
             NSAttributedString.Key.foregroundColor: UIColor.init(white: 1, alpha: 0.65)])
        
        tf_email.font = AppFont.regular(size: 18)
        tf_email.textColor = UIColor.white
        
        tf_password.font = AppFont.regular(size: 18)
        tf_password.textColor = UIColor.white
        tf_password.isSecureTextEntry = true
        
                
        let forgotPasswordAttributedText = NSMutableAttributedString(string: "forgot_your_password".l10n(), attributes: [
            NSAttributedString.Key.font : AppFont.regular(size: 18),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ])
        let textRange = NSRange(location: 0, length: "forgot_your_password".l10n().count)

        forgotPasswordAttributedText.addAttribute(.underlineStyle,
                                            value: NSUnderlineStyle.single.rawValue,
                                            range: textRange)
        btn_forgotPassword.setAttributedTitle(forgotPasswordAttributedText, for: .normal)
        
        btn_signIn.gradientButton(titleStr: "sign_in".l10n())
        btn_signUp.clearButton(titleStr: "sign_up".l10n())
        
        btn_show.setAttributedTitle(NSAttributedString(string: "view".l10n().uppercased(), attributes: [
            NSAttributedString.Key.font : AppFont.bold(size: 9),
            NSAttributedString.Key.foregroundColor: UIColor.white,

        ]), for: .normal)
        
        let emailObservable: Observable<String?> = tf_email.rx.text.asObservable()
        emailObservable.subscribe(
                    onNext: {(string: String?) in
                        self.imgv_validated.isHidden = !string!.isEmail
                    }).disposed(by: disposebag)
        
        btn_show.addTarget(self, action: #selector(showPasswordInput), for: .touchUpInside)
        
        // create right barbutton
        let rightButton = UIButton(type: .custom)
        rightButton.setAttributedTitle(NSAttributedString(string: "pass".l10n(), attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.font : AppFont.regular(size: 14)
        ]), for: .normal)
        let rightBarButtonItem = UIBarButtonItem(customView: rightButton)
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        btn_signUp.addTarget(self, action: #selector(changeToSignUpVC), for: .touchUpInside)
        btn_signIn.addTarget(self, action: #selector(changeToMain), for: .touchUpInside)
        
        btn_forgotPassword.addTarget(self, action: #selector(clickForgotPassword), for: .touchUpInside)
        
    }
    
    @objc func showPasswordInput() {
        tf_password.isSecureTextEntry = !tf_password.isSecureTextEntry
    }
    
    @objc func changeToSignUpVC() {
        self.resetWindow(with: StoryboardBuilder.shared.signUp1())
    }
    
    @objc func clickForgotPassword() {
        navigationController?.pushViewController(StoryboardBuilder.shared.forgotPassword(), animated: true)
    }
    
    @objc func changeToMain() {
        self.setMainWindow()
    }
    
}

