//
//  HomeVC.swift
//  Quickscop
//
//  Created by Solo on 22/10/2021.
//

import UIKit
import MASegmentedControl
class HomeVC: BaseVC {

    @IBOutlet weak var segment: MASegmentedControl!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setUpUI() {
        setLogoLeftBar()
        setRightNavigationButtons()
       
        
        // set up segment
        segment.roundedControl = true
        segment.itemsWithText = true
        segment.selectedTextColor = UIColor.white
        segment.textColor = AppColor.gray
        segment.titlesFont = AppFont.bold(size: 14)
        segment.segmentedBackGroundColor = UIColor.white
        segment.thumbViewColor = UIColor(gradientStyle: .topToBottom, withFrame: segment.frame, andColors: [AppColor.mainGradientStart, AppColor.mainGradientEnd])
        segment.fillEqually = true
        segment.setSegmentedWith(items: ["subscriptions".l10n(), "home".l10n()])
        segment.addTarget(self, action: #selector(self.changeSegmentValue), for: .valueChanged)
        
        //set up collectionView
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: PageWithListCell.identifier, bundle: Bundle.main), forCellWithReuseIdentifier: PageWithListCell.identifier)
        collectionView.register(UINib(nibName: PageWithGridView.identifier, bundle: Bundle.main), forCellWithReuseIdentifier: PageWithGridView.identifier)
        collectionView.isPagingEnabled = true
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: self.view.frame.width, height: collectionView.frame.height)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        collectionView.collectionViewLayout = layout
        
    }
    
    @objc func changeSegmentValue() {
        DispatchQueue.main.async {
            self.collectionView.isPagingEnabled = false
            self.collectionView.scrollToItem(at: IndexPath(item: self.segment.selectedSegmentIndex, section: 0), at: .centeredHorizontally, animated: true)
            self.collectionView.isPagingEnabled = true
        }
    }
    
    


}

extension HomeVC : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return 15
        } else {
            return 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as! ImageCell
            return cell
        } else {
            switch indexPath.item {
            case 0:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageWithListCell.identifier, for: indexPath) as! PageWithListCell
                cell.tableView.tag = 0
                cell.tableView.delegate = self
                cell.tableView.dataSource = self
                cell.tableView.register(UINib(nibName: HomeSubcriptionCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: HomeSubcriptionCell.identifier)
                return cell
            case 1:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageWithGridView.identifier, for: indexPath) as! PageWithGridView
                cell.gridView.delegate = self
                cell.gridView.dataSource = self
                cell.gridView.tag = 1
                cell.gridView.register(UINib(nibName: ImageCell.identifier, bundle: Bundle.main), forCellWithReuseIdentifier: ImageCell.identifier)
                let layout = UICollectionViewFlowLayout()
                layout.scrollDirection = .vertical
                let cellDimension = CGFloat((self.view.frame.width - 4) / 3)
                layout.itemSize = CGSize(width: cellDimension, height: cellDimension)
                layout.minimumLineSpacing = 2
                layout.minimumInteritemSpacing = 2
                cell.gridView.collectionViewLayout = layout
                return cell
            default:
                return UICollectionViewCell()
            }
        }
        
    }
    
}

extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeSubcriptionCell.identifier, for: indexPath) as! HomeSubcriptionCell
        cell.lbl_top_title.text = "pseudo"
        cell.lbl_top_subTitle.text = "Prestige 5"
        cell.lbl_location.text = "Floride, USA"
        cell.lbl_views.text = "13’987 Vues"
        cell.lbl_comment.text = "583 Commentaires"
        cell.lbl_categories.text = "Catégorie"
        cell.lbl_bottomTitle.text = "Publié il y a 58 minutes."
        return cell
    }
    
    
    
}

extension HomeVC : UIScrollViewDelegate{
       func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
   
           let pageWidth = self.collectionView.frame.size.width
           let index = Int(self.collectionView.contentOffset.x / pageWidth)
           
       }
}
