//
//  NotificationsMainVC.swift
//  Quickscop
//
//  Created by GnolDrol on 11/3/21.
//

import UIKit

class NotificationsMainVC: BaseVC {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setUpUI() {
        super.setUpUI()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: NotificationCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: NotificationCell.identifier)
        
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "triple_dots"), for: .normal)
        
        let barItem = UIBarButtonItem(customView: btn)
        navigationItem.rightBarButtonItem = barItem
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        label.textAlignment = .center
        label.font = AppFont.bold(size: 18)
        
        label.text = "Notifications"
        navigationItem.titleView = label
    }
    


}

extension NotificationsMainVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotificationCell.identifier, for: indexPath) as! NotificationCell
        return cell
    }
}
