//
//  EditProfileVC.swift
//  Quickscop
//
//  Created by Solo on 07/11/2021.
//

import UIKit

class EditProfileVC: BaseVC {

    @IBOutlet weak var photoContainer: UIView!
    
    @IBOutlet weak var nameContainer: UIView!
    
    @IBOutlet weak var userNameContainer: UIView!
    
    @IBOutlet weak var descriptionContainer: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setUpUI() {
        super.setUpUI()
        setTitle(title: "profile".l10n())
        setBackButton()
        
        setBorderForView(view: photoContainer)
        setBorderForView(view: nameContainer)
        setBorderForView(view: userNameContainer)
        setBorderForView(view: descriptionContainer)
        avatarImageView.layer.masksToBounds = true
        avatarImageView.layer.cornerRadius = 15

    }
    
    private func setBorderForView(view : UIView) {
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.layer.borderColor = AppColor.gray.cgColor
        view.layer.borderWidth = 1
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
