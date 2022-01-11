//
//  MainProfileVC.swift
//  Quickscop
//
//  Created by GnolDrol on 11/5/21.
//

import UIKit
import MASegmentedControl

enum MainProfileSegment : Int {
    case Published = 0
    case Participated
    case Subcribers
    case Subcription
}

class MainProfileVC: BaseVC {

    @IBOutlet weak var avatarContainer: UIView!
    @IBOutlet weak var imgv_Avatar: UIImageView!
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var tv_Desciption: UILabel!
    @IBOutlet weak var lbl_UserName: UILabel!
    
    @IBOutlet weak var btn_Left: UIButton!
    
    @IBOutlet weak var btn_Right: UIButton!
    
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl4: UILabel!
    @IBOutlet weak var lbl5: UILabel!

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var stackViewContainer: UIView!
    @IBOutlet weak var segment: MASegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setUpUI() {
        super.setUpUI()
        setLogoLeftBar()
        setRightNavigationButtons()
        
        avatarContainer.layer.masksToBounds = true
        setSelectedBtn(isSelected: true, btn: btn_Left, title: "recordings".l10n())
        btn_Left.isSelected = true
        setSelectedBtn(isSelected: false, btn: btn_Right, title: "parameters".l10n())
        btn_Right.isSelected = false
        btn_Left.addTarget(self, action: #selector(clickRecordingBtn), for: .touchUpInside)
        btn_Right.addTarget(self, action: #selector(clickParametersBtn), for: .touchUpInside)
        
        stackViewContainer.layer.masksToBounds = true
        stackViewContainer.layer.cornerRadius = 10
        stackViewContainer.layer.borderColor = AppColor.mainGradientEnd.cgColor
        stackViewContainer.layer.borderWidth = 1.0
        
        lbl1.layer.masksToBounds = true
        lbl1.layer.cornerRadius = 15
        lbl1.backgroundColor = UIColor(gradientStyle: .topToBottom, withFrame: lbl1.frame, andColors: [AppColor.mainGradientStart, AppColor.mainGradientEnd])
        lbl1.textColor = UIColor.white
        lbl1.font = AppFont.semiBold(size: 10)
        lbl1.frame = CGRect(x: 0, y: 0, width: 67, height: 25)
        
        let attr2 = NSMutableAttributedString(string: "Points : ", attributes: [
            NSAttributedString.Key.font : AppFont.bold(size: 10),
            NSAttributedString.Key.foregroundColor : AppColor.gray
        ])
        attr2.append(NSAttributedString(string: "97,5k", attributes: [
            NSAttributedString.Key.font : AppFont.bold(size: 10),
            NSAttributedString.Key.foregroundColor : AppColor.mainGradientEnd
        ]))
        lbl2.attributedText = attr2
        
        let attr3 = NSMutableAttributedString(string: "Victoires : ", attributes: [
            NSAttributedString.Key.font : AppFont.bold(size: 10),
            NSAttributedString.Key.foregroundColor : AppColor.gray
        ])
        attr3.append(NSAttributedString(string: "37", attributes: [
            NSAttributedString.Key.font : AppFont.bold(size: 10),
            NSAttributedString.Key.foregroundColor : AppColor.mainGradientEnd
        ]))
        lbl3.attributedText = attr3
        
        let attr4 = NSMutableAttributedString(string: "Top 10 : ", attributes: [
            NSAttributedString.Key.font : AppFont.bold(size: 10),
            NSAttributedString.Key.foregroundColor : AppColor.gray
        ])
        attr4.append(NSAttributedString(string: "3795", attributes: [
            NSAttributedString.Key.font : AppFont.bold(size: 10),
            NSAttributedString.Key.foregroundColor : AppColor.mainGradientEnd
        ]))
        lbl4.attributedText = attr4
        
        let attr5 = NSMutableAttributedString(string: "Top 26 : ", attributes: [
            NSAttributedString.Key.font : AppFont.bold(size: 10),
            NSAttributedString.Key.foregroundColor : AppColor.gray
        ])
        attr5.append(NSAttributedString(string: "3620", attributes: [
            NSAttributedString.Key.font : AppFont.bold(size: 10),
            NSAttributedString.Key.foregroundColor : AppColor.mainGradientEnd
        ]))
        lbl5.attributedText = attr5
        
        // set up segment
        segment.roundedControl = false
        segment.itemsWithText = true
        segment.selectedTextColor = AppColor.mainGradientEnd
        segment.textColor = AppColor.gray
        segment.titlesFont = AppFont.bold(size: 14)
        segment.segmentedBackGroundColor = UIColor.white
        segment.thumbViewColor = AppColor.mainGradientEnd
        segment.fillEqually = true
        segment.bottomLineThumbView = true
        segment.setSegmentedWith(items: ["published".l10n(), "participated".l10n(), "subscribers".l10n(), "subscriptions".l10n()])
        segment.addTarget(self, action: #selector(self.changeSegmentValue), for: .valueChanged)
        
        tableView.register(UINib(nibName: CellWithCollectionView.identifier, bundle: Bundle.main), forCellReuseIdentifier: CellWithCollectionView.identifier)
        tableView.dataSource = self
        tableView.delegate = self

    }
    
    @objc func changeSegmentValue() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @objc func clickRecordingBtn() {
        let vc = StoryboardBuilder.shared.recordings()
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func clickParametersBtn() {

        let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "edit_profile".l10n(), style: .default, handler: { action in
            let vc = StoryboardBuilder.shared.editProfile()
            DispatchQueue.main.async {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }))
        alert.addAction(UIAlertAction(title: "check_my_account".l10n(), style: .default, handler: { action in
            let vc = StoryboardBuilder.shared.verifyProfile()
            DispatchQueue.main.async {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }))
        alert.addAction(UIAlertAction(title: "explanatory_videos".l10n(), style: .default, handler: { action in
            let vc = StoryboardBuilder.shared.videoExplain()
            DispatchQueue.main.async {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }))
        alert.addAction(UIAlertAction(title: "personal_information".l10n(), style: .default, handler: { action in
            let vc = StoryboardBuilder.shared.personalInfo()
            DispatchQueue.main.async {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }))
        alert.addAction(UIAlertAction(title: "cancel".l10n(), style: .cancel, handler: { action in
            
        }))
        self.navigationController?.present(alert, animated: true, completion: nil)
    }
    
//    @objc func clickBtn() {
//        btn_Left.isSelected = !btn_Left.isSelected
//        btn_Right.isSelected = !btn_Right.isSelected
//        setSelectedBtn(isSelected: btn_Left.isSelected, btn: btn_Left, title: "recordings".l10n())
//        setSelectedBtn(isSelected: btn_Right.isSelected, btn: btn_Right, title: "parameters".l10n())
//
//    }
    
    func setSelectedBtn(isSelected: Bool, btn : UIButton, title : String) {
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 13

        if isSelected {
            btn.backgroundColor = UIColor(gradientStyle: .topToBottom, withFrame: btn.frame, andColors: [AppColor.mainGradientStart, AppColor.mainGradientEnd])
            btn.setAttributedTitle(NSAttributedString(string: title, attributes: [
                NSAttributedString.Key.foregroundColor : UIColor.white,
                NSAttributedString.Key.font : AppFont.regular(size: 10)
            ]), for: .selected)
            btn.layer.borderWidth = 0
            btn.layer.borderColor = UIColor.clear.cgColor
        } else {
            btn.backgroundColor = UIColor.white
            btn.setAttributedTitle(NSAttributedString(string: title, attributes: [
                NSAttributedString.Key.foregroundColor : AppColor.mainGradientEnd,
                NSAttributedString.Key.font : AppFont.regular(size: 10)
            ]), for: .normal)
            btn.layer.borderWidth = 1
            btn.layer.borderColor = AppColor.mainGradientEnd.cgColor
        }
    }

}

extension MainProfileVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch segment.selectedSegmentIndex {
        case MainProfileSegment.Published.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellWithCollectionView.identifier, for: indexPath) as! CellWithCollectionView
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            cell.collectionView.register(UINib(nibName: ImageCell.identifier, bundle: Bundle.main), forCellWithReuseIdentifier: ImageCell.identifier)
            cell.collectionView.tag = MainProfileSegment.Published.rawValue
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            let cellDimension = CGFloat((self.view.frame.width - 4) / 3)
            layout.itemSize = CGSize(width: cellDimension, height: cellDimension)
            layout.minimumLineSpacing = 2
            layout.minimumInteritemSpacing = 2
            cell.collectionView.collectionViewLayout = layout
            
            cell.removeBorder()
            DispatchQueue.main.async {
                cell.collectionView.reloadData()
            }
            return cell
        case MainProfileSegment.Participated.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellWithCollectionView.identifier, for: indexPath) as! CellWithCollectionView
            cell.removeBorder()
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            cell.collectionView.register(UINib(nibName: ImageCell.identifier, bundle: Bundle.main), forCellWithReuseIdentifier: ImageCell.identifier)
            cell.collectionView.tag = MainProfileSegment.Participated.rawValue
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            let cellDimension = CGFloat((self.view.frame.width - 4) / 3)
            layout.itemSize = CGSize(width: cellDimension, height: cellDimension)
            layout.minimumLineSpacing = 2
            layout.minimumInteritemSpacing = 2
            cell.collectionView.collectionViewLayout = layout
            DispatchQueue.main.async {
                cell.collectionView.reloadData()
            }
            return cell
        case MainProfileSegment.Subcribers.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellWithCollectionView.identifier, for: indexPath) as! CellWithCollectionView
            cell.setBorder()
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            cell.collectionView.register(UINib(nibName: ProfileSubCell.identifier, bundle: Bundle.main), forCellWithReuseIdentifier: ProfileSubCell.identifier)
            cell.collectionView.tag = MainProfileSegment.Subcribers.rawValue
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.itemSize = CGSize(width: tableView.frame.width, height: 59)
            layout.minimumLineSpacing = 2
            layout.minimumInteritemSpacing = 0
            cell.collectionView.collectionViewLayout = layout
            DispatchQueue.main.async {
                cell.collectionView.reloadData()
            }
            return cell
        case MainProfileSegment.Subcription.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellWithCollectionView.identifier, for: indexPath) as! CellWithCollectionView
            cell.setBorder()
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            cell.collectionView.register(UINib(nibName: ProfileSubCell.identifier, bundle: Bundle.main), forCellWithReuseIdentifier: ProfileSubCell.identifier)
            cell.collectionView.tag = MainProfileSegment.Subcribers.rawValue
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.itemSize = CGSize(width: tableView.frame.width, height: 59)
            layout.minimumLineSpacing = 2
            layout.minimumInteritemSpacing = 0
            cell.collectionView.collectionViewLayout = layout
            DispatchQueue.main.async {
                cell.collectionView.reloadData()
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension MainProfileVC : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch segment.selectedSegmentIndex {
        case MainProfileSegment.Published.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as! ImageCell
            return cell
        case MainProfileSegment.Participated.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as! ImageCell
            return cell
        case MainProfileSegment.Subcribers.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileSubCell.identifier, for: indexPath) as! ProfileSubCell
            return cell
        case MainProfileSegment.Subcription.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileSubCell.identifier, for: indexPath) as! ProfileSubCell
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}
