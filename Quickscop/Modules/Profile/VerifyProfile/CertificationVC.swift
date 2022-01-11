//
//  CertificationVC.swift
//  Quickscop
//
//  Created by Solo on 07/11/2021.
//

import UIKit

class CertificationVC: BaseVC {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var sendBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setUpUI() {
        super.setUpUI()
        setTitle(title: "certification".l10n())
        sendBtn.gradientButton(titleStr: "send".l10n())
        setBackButton()
        scrollView.contentSize = containerView.frame.size
       
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
