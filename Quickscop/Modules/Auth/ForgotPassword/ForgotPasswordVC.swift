//
//  ForgotPasswordVC.swift
//  Quickscop
//
//  Created by Solo on 22/10/2021.
//

import UIKit
import RxSwift
import RxCocoa
class ForgotPasswordVC: BaseVC {

    @IBOutlet weak var btn_forgotPassword: UIButton!
    @IBOutlet weak var imgv_validated: UIImageView!
    @IBOutlet weak var tf_email: UITextField!
    let disposebag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setUpUI() {
        imgv_validated.isHidden = true
        
        tf_email.attributedPlaceholder = NSAttributedString(string: "your_email".l10n(), attributes: [NSAttributedString.Key.font : AppFont.regular(size: 18),
                                                                                                      NSAttributedString.Key.foregroundColor: UIColor.init(white: 1, alpha: 0.65)])
        tf_email.font = AppFont.regular(size: 18)
        tf_email.textColor = UIColor.white
        
        btn_forgotPassword.gradientButton(titleStr: "recover_password".l10n())
        
        let emailObservable: Observable<String?> = tf_email.rx.text.asObservable()
        emailObservable.subscribe(
                    onNext: {(string: String?) in
                        self.imgv_validated.isHidden = !string!.isEmail
                    }).disposed(by: disposebag)

    }

}
