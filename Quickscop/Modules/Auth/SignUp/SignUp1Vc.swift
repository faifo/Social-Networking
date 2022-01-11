//
//  SignUp1Vc.swift
//  Quickscop
//
//  Created by Solo on 22/10/2021.
//

import UIKit

class SignUp1Vc: BaseVC {

    let firstNameTag = 999
    let lastNameTag = 998
    let userNameTag = 997
    @IBOutlet weak var tf_fristName: UITextField!
    @IBOutlet weak var tf_lastName: UITextField!
    @IBOutlet weak var tf_userName: UITextField!
    @IBOutlet weak var lbl_step: UILabel!
    @IBOutlet weak var btn_signIn: UIButton!
    @IBOutlet weak var btn_next: UIButton!
    var registerParams : RegisterParameters = RegisterParameters()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func setUpUI() {
        tf_fristName.attributedPlaceholder = NSAttributedString(string: "first_name".l10n(), attributes: [NSAttributedString.Key.font : AppFont.regular(size: 18),
                                                                                                      NSAttributedString.Key.foregroundColor: UIColor.init(white: 1, alpha: 0.65)])
        tf_lastName.attributedPlaceholder = NSAttributedString(string: "last_name".l10n(), attributes: [NSAttributedString.Key.font : AppFont.regular(size: 18),
                                                                                                      NSAttributedString.Key.foregroundColor: UIColor.init(white: 1, alpha: 0.65)])
        tf_userName.attributedPlaceholder = NSAttributedString(string: "user_name".l10n(), attributes: [NSAttributedString.Key.font : AppFont.regular(size: 18),
                                                                                                      NSAttributedString.Key.foregroundColor: UIColor.init(white: 1, alpha: 0.65)])
        
        tf_lastName.font = AppFont.regular(size: 18)
        tf_lastName.textColor = UIColor.white
        
        tf_fristName.font = AppFont.regular(size: 18)
        tf_fristName.textColor = UIColor.white
        
        tf_userName.font = AppFont.regular(size: 18)
        tf_userName.textColor = UIColor.white
        
        btn_next.gradientButton(titleStr: "next".l10n())
        btn_signIn.clearButton(titleStr: "sign_in".l10n())
        
        lbl_step.font = AppFont.regular(size: 12)
        lbl_step.textColor = UIColor.white
        lbl_step.text = "1/2"
        
        // create right barbutton
        let rightButton = UIButton(type: .custom)
        rightButton.setAttributedTitle(NSAttributedString(string: "skip".l10n(), attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.font : AppFont.regular(size: 14)
        ]), for: .normal)
        let rightBarButtonItem = UIBarButtonItem(customView: rightButton)
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        btn_signIn.addTarget(self, action: #selector(changeToSignInVC), for: .touchUpInside)
        btn_next.addTarget(self, action: #selector(clickNext), for: .touchUpInside)
        
        tf_fristName.tag = firstNameTag
        tf_userName.tag = userNameTag
        tf_lastName.tag = lastNameTag
        tf_fristName.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        tf_userName.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        tf_lastName.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
    }
    
    @objc func changeToSignInVC() {
        self.resetWindow(with: StoryboardBuilder.shared.signIn())
    }
    
    @objc func clickNext() {
        // validated
        guard let _ = registerParams.first_name else {
            state = .Alert("Please Enter First Name", nil)
            return
        }
        
        guard let _ = registerParams.last_name else {
            state = .Alert("Please Enter Last Name", nil)
            return
        }
        
        guard let _ = registerParams.username else {
            state = .Alert("Please Enter Username", nil)
            return
        }
        
        let vc = StoryboardBuilder.shared.signUp2()
        vc.registerParams = registerParams
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    @objc func textFieldDidChange(textField : UITextField) {
        let text = textField.text
        switch textField.tag {
        case firstNameTag:
            registerParams.first_name = text
        case userNameTag:
            registerParams.username = text
        case lastNameTag:
            registerParams.last_name = text
        default:
            break
            
        }
    }
    
 

}

extension SignUp1Vc : UITextFieldDelegate {
    
}
