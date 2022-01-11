//
//  BaseVC.swift
//  Quickscop
//
//  Created by GnolDrol on 10/22/21.
//

import UIKit
import ESTabBarController_swift
import MBProgressHUD

typealias BaseVCAlertHandler = () -> ()

enum ViewControllerState {
    case Idle
    case Loading(String?)
    case Alert(String?, BaseVCAlertHandler?)
}
class BaseVC: UIViewController {

    var state : ViewControllerState = .Idle {
        didSet {
            switch state {
            case .Idle:
                self.dismissProgress()
                break
            case .Loading(let message):
                self.showProgressWithTitle(title: message ?? "Đang tải")
                break
            case .Alert(let message, let handler):
                self.showAlertViewWithHandler(message: message ?? "", with: handler)
                break
            }
        }
    }
    
    func showProgressWithTitle(title : String) {
        DispatchQueue.main.async {
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
    }
    
    func dismissProgress() {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    
    func showAlertViewWithHandler(message : String, with handler : BaseVCAlertHandler?) {
        self.state = .Idle
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                handler?()
                alert.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    var leftBarButtonItem : UIBarButtonItem! {
        didSet {
            self.navigationItem.leftBarButtonItem = leftBarButtonItem
        }
    }
    
    var rightBarButtonItem : UIBarButtonItem! {
        didSet {
            self.navigationItem.rightBarButtonItem = rightBarButtonItem
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCommon()
        setUpUI()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    
    private func setUpCommon() {
//        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    func setUpUI() {
        
    }
    
    func setTitle(title : String) {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        label.textAlignment = .center
        label.font = AppFont.bold(size: 18)
        
        label.text = title
        navigationItem.titleView = label
    }
    
    func setBackButton() {
        let button = UIButton(type: .custom)
        button.setBackgroundImage(UIImage(named: "ic_back"), for: .normal)
        button.addTarget(self, action: #selector(clickBack), for: .touchUpInside)
        let barButtonItem = UIBarButtonItem(customView: button)
        navigationItem.leftBarButtonItem = barButtonItem
    }
    
    @objc func clickBack() {
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func setLogoLeftBar() {
        let button = UIButton(type: .custom)
        button.setBackgroundImage(UIImage(named: "top_bar_logo"), for: .normal)
        let barButtonItem = UIBarButtonItem(customView: button)
        navigationItem.leftBarButtonItem = barButtonItem
    }
    
    func setRightNavigationButtons() {
        let button = UIButton(type: .custom)
        button.setBackgroundImage(UIImage(named: "left_bar_btn"), for: .normal)
        let barButtonItem = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItem = barButtonItem
    }

}

extension BaseVC {
  func resetWindow(with vc: BaseVC) {
    guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
      fatalError("could not get scene delegate ")
    }
    sceneDelegate.window?.rootViewController = UINavigationController(rootViewController: vc)
  }
    
    func setMainWindow() {
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
          fatalError("could not get scene delegate ")
        }
        sceneDelegate.window?.rootViewController = mainScreen()
    }
    
    private func mainScreen() -> ESTabBarController {
        let tabBarController = ESTabBarController()
        let v1 = StoryboardBuilder.shared.homeVC()
        let v2 = StoryboardBuilder.shared.contestVC()
        let v3 = StoryboardBuilder.shared.mainCategoriesVC()
        let v4 = StoryboardBuilder.shared.mainNotificationsVC()
        let v5 = StoryboardBuilder.shared.mainProfile()
        
        let tabbarItem1 = ESTabBarItem.init(title: "home".l10n(), image: UIImage(named: "tabbar_home"), selectedImage: UIImage(named: "tabbar_home_on"))
       
        tabbarItem1.contentView?.renderingMode = .alwaysOriginal
        tabbarItem1.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : AppColor.mainGradientStart,
                                            NSAttributedString.Key.font: AppFont.semiBold(size: 8)], for: .selected)
        let tabbarItem2 = ESTabBarItem.init(title: "competion".l10n(), image: UIImage(named: "tabbar_trophy"), selectedImage: UIImage(named: "tabbar_trophy_on"))
        tabbarItem2.contentView?.renderingMode = .alwaysOriginal
        tabbarItem2.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : AppColor.mainGradientStart,
                                            NSAttributedString.Key.font: AppFont.semiBold(size: 8)], for: .selected)
        let tabbarItem3 = ESTabBarItem.init(title: "categories".l10n(), image: UIImage(named: "tabbar_categories"), selectedImage: UIImage(named: "tabbar_categories_on"))
        tabbarItem3.contentView?.renderingMode = .alwaysOriginal
        tabbarItem3.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : AppColor.mainGradientStart,
                                            NSAttributedString.Key.font: AppFont.semiBold(size: 8)], for: .selected)
        let tabbarItem4 = ESTabBarItem.init(title: "notifications".l10n(), image: UIImage(named: "tabbar_notifications"), selectedImage: UIImage(named: "tabbar_notifications_on"))
        tabbarItem4.contentView?.renderingMode = .alwaysOriginal
        tabbarItem4.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : AppColor.mainGradientStart,
                                            NSAttributedString.Key.font: AppFont.semiBold(size: 8)], for: .selected)
        let tabbarItem5 = ESTabBarItem.init(title: "profile".l10n(), image: UIImage(named: "tabbar_profile"), selectedImage: UIImage(named: "tabbar_profile"))
        tabbarItem5.contentView?.renderingMode = .alwaysOriginal
        tabbarItem5.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : AppColor.mainGradientStart,
                                            NSAttributedString.Key.font: AppFont.semiBold(size: 8)], for: .selected)
        
        v1.tabBarItem = tabbarItem1
        v2.tabBarItem = tabbarItem2
        v3.tabBarItem = tabbarItem3
        v4.tabBarItem = tabbarItem4
        v5.tabBarItem = tabbarItem5

        tabBarController.viewControllers = [UINavigationController(rootViewController: v1),
                                            UINavigationController(rootViewController: v2),
                                            UINavigationController(rootViewController: v3),
                                            UINavigationController(rootViewController: v4),
                                            UINavigationController(rootViewController: v5)]
        return tabBarController
    }

}
