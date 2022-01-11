//
//  VideoExplainVC.swift
//  Quickscop
//
//  Created by Solo on 07/11/2021.
//

import UIKit

class VideoExplainVC: BaseVC {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setUpUI() {
        super.setUpUI()
        tableView.separatorStyle = .none
        setTitle(title: "explanatory_videos".l10n())
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: TopVideoCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: TopVideoCell.identifier)
        tableView.register(UINib(nibName: MiddleVideoCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: MiddleVideoCell.identifier)
        tableView.register(UINib(nibName: ExplainVideoCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: ExplainVideoCell.identifier)
        tableView.register(UINib(nibName: VideoExplainHeader.identifier, bundle: Bundle.main), forCellReuseIdentifier: VideoExplainHeader.identifier)

    }
    
    
}

extension VideoExplainVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 4
        case 3:
            return 2
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: TopVideoCell.identifier, for: indexPath) as! TopVideoCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: MiddleVideoCell.identifier, for: indexPath) as! MiddleVideoCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: ExplainVideoCell.identifier, for: indexPath) as! ExplainVideoCell
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: ExplainVideoCell.identifier, for: indexPath) as! ExplainVideoCell
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: VideoExplainHeader.identifier) as! VideoExplainHeader
            cell.label.text = "Vidéos participation"
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: VideoExplainHeader.identifier) as! VideoExplainHeader
            cell.label.text = "Vidéos votes"
            return cell
        default:
            return nil
        }
    }
}
