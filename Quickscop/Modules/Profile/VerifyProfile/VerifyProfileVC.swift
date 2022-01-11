//
//  VerifyProfileVC.swift
//  Quickscop
//
//  Created by Solo on 07/11/2021.
//

import UIKit
//"first_name"="Prénom";
//"name"="Nom";
//"user_name"="Nom d’utilisateur";
//"date_of_birth"="Date de naissance";
//"document_type"="Type De Document";
//"send"="ENVOYER";
class VerifyProfileVC: BaseVC {

    @IBOutlet weak var documentTypeContainer: UIView!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var lblDocumentType: UILabel!
    @IBOutlet weak var lblDateOfBirth: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblFirstName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setUpUI() {
        super.setUpUI()
        setTitle(title: "check_my_account".l10n())
        setBackButton()
        
        lblFirstName.text = "first_name".l10n()
        lblName.text = "name".l10n()
        lblUserName.text = "user_name".l10n()
        lblDateOfBirth.text = "date_of_birth".l10n()
        lblDocumentType.text = "document_type".l10n()
        
        sendBtn.gradientButton(titleStr: "send".l10n())
        sendBtn.addTarget(self, action: #selector(clickSend), for: .touchUpInside)
        
        documentTypeContainer.layer.masksToBounds = true
        documentTypeContainer.layer.cornerRadius = 5
        documentTypeContainer.layer.borderWidth = 1
        documentTypeContainer.layer.borderColor = AppColor.gray.cgColor
    }
    
    @objc func clickSend() {
        DispatchQueue.main.async {
            
        }
    }

}
