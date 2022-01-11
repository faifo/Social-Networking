//
//  PersonalInfoVC.swift
//  Quickscop
//
//  Created by GnolDrol on 11/8/21.
//

import UIKit

class PersonalInfoVC: BaseVC {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setUpUI() {
        super.setUpUI()
        setTitle(title: "personal_information".l10n())
        setBackButton()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: CellWithText.identifier, bundle: Bundle.main), forCellReuseIdentifier: CellWithText.identifier)
        tableView.register(UINib(nibName: CellWithSwitch.identifier, bundle: Bundle.main), forCellReuseIdentifier: CellWithSwitch.identifier)
        tableView.register(UINib(nibName: CellWithDropDown.identifier, bundle: Bundle.main), forCellReuseIdentifier: CellWithDropDown.identifier)

    }
    

}

extension PersonalInfoVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellWithSwitch.identifier, for: indexPath) as! CellWithSwitch
            cell.titleLbl.text = "Afficher mon prénom et mon nom sur la page profile."
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellWithSwitch.identifier, for: indexPath) as! CellWithSwitch
            cell.titleLbl.text = "Désactiver commentaires"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellWithText.identifier, for: indexPath) as! CellWithText
            cell.titleLabel.text = "Langue de l’application"
            cell.subTitleLabel.text = "Français"
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellWithDropDown.identifier, for: indexPath) as! CellWithDropDown
            cell.titleLbl.text = "Changer de mot de passe"
            cell.subTitleLbl.text = "Modifier"
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellWithDropDown.identifier, for: indexPath) as! CellWithDropDown
            cell.titleLbl.text = "Changer mon e-mail"
            cell.subTitleLbl.text = "Modifier"
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellWithText.identifier, for: indexPath) as! CellWithText
            cell.titleLabel.text = "Supprimer mon compte"
            cell.subTitleLabel.text = ""
            return cell
        default:
            return UITableViewCell()
        }
    }
}
