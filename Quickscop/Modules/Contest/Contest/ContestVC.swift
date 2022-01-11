//
//  ContestVC.swift
//  Quickscop
//
//  Created by Solo on 30/10/2021.
//

import UIKit
import MASegmentedControl

class ContestVC: BaseVC {

    
    let popularityTag = 999
    let week_monthTag = 998
    let all_tag = 997
    @IBOutlet weak var collectionView_Bottom: UICollectionView!
    @IBOutlet weak var collectionView_Top: UICollectionView!
    var topCollectionViewData : [String] = ["Championships", "Mes concours actifs", "Mes résultats"]
    var topCollectionViewSelectedIndex = 0
    
    
    @IBOutlet weak var segment: MASegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setUpUI() {
        super.setUpUI()
        setLogoLeftBar()
        setRightNavigationButtons()
        
        collectionView_Top.delegate = self
        collectionView_Top.dataSource = self
        collectionView_Top.register(UINib(nibName: HorizontalLabelCollectionViewCell.identifier, bundle: Bundle.main), forCellWithReuseIdentifier: HorizontalLabelCollectionViewCell.identifier)
        let topLayout = UICollectionViewFlowLayout()
        topLayout.scrollDirection = .horizontal
        topLayout.minimumLineSpacing = 0
        topLayout.minimumInteritemSpacing = 5
        collectionView_Top.collectionViewLayout = topLayout
        
        // set up segment
        segment.roundedControl = true
        segment.itemsWithText = true
        segment.selectedTextColor = UIColor.white
        segment.textColor = AppColor.gray
        segment.titlesFont = AppFont.bold(size: 14)
        segment.segmentedBackGroundColor = UIColor.white
        segment.thumbViewColor = UIColor(gradientStyle: .topToBottom, withFrame: segment.frame, andColors: [AppColor.mainGradientStart, AppColor.mainGradientEnd])
        segment.fillEqually = true
        segment.setSegmentedWith(items: ["participate".l10n(), "voter".l10n()])
        segment.addTarget(self, action: #selector(self.changeSegmentValue), for: .valueChanged)
        
        collectionView_Bottom.delegate = self
        collectionView_Bottom.dataSource = self
        collectionView_Bottom.register(UINib(nibName: ContestSliderItem.identifier, bundle: Bundle.main), forCellWithReuseIdentifier: ContestSliderItem.identifier)
        collectionView_Bottom.register(UINib(nibName: ContestAllCategoriesItem.identifier, bundle: Bundle.main), forCellWithReuseIdentifier: ContestAllCategoriesItem.identifier)
        
    }
    
    @objc func changeSegmentValue() {
//        DispatchQueue.main.async {
//            self.collectionView_Bottom.isPagingEnabled = false
//            self.collectionView_Bottom.reload
//            self.collectionView.scrollToItem(at: IndexPath(item: self.segment.selectedSegmentIndex, section: 0), at: .centeredHorizontally, animated: true)
//            self.collectionView.isPagingEnabled = true
//        }
    }

}

extension ContestVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionView_Top {
            return topCollectionViewData.count
        }
        if collectionView == collectionView_Bottom {
            return 3
        }
        
        if collectionView.tag == popularityTag {
            return 3
        }
        if collectionView.tag == week_monthTag {
            return 3
        }
        if collectionView.tag == all_tag {
            return 10
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionView_Top {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalLabelCollectionViewCell.identifier, for: indexPath) as! HorizontalLabelCollectionViewCell
            cell.label.text = topCollectionViewData[indexPath.row]
            cell.setSelected(isSelected: topCollectionViewSelectedIndex == indexPath.row)
            return cell
        }
        
        if collectionView == collectionView_Bottom {
            switch indexPath.row {
            case 0:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContestSliderItem.identifier, for: indexPath) as! ContestSliderItem
                cell.lbl_category.text = "Catégories populaires"
                cell.lbl_number.text = "5 catégories"
                cell.collectionView.tag = popularityTag
                cell.collectionView.register(UINib(nibName: ContestCategoryItem.identifier, bundle: Bundle.main), forCellWithReuseIdentifier: ContestCategoryItem.identifier)
                cell.collectionView.delegate = self
                cell.collectionView.dataSource = self
               
                return cell
            case 1:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContestSliderItem.identifier, for: indexPath) as! ContestSliderItem
                cell.lbl_category.text = "Catégories de la semaine/mois"
                cell.lbl_number.text = "5 catégories"
                cell.collectionView.tag = week_monthTag
                cell.collectionView.register(UINib(nibName: ContestCategoryItem.identifier, bundle: Bundle.main), forCellWithReuseIdentifier: ContestCategoryItem.identifier)
                cell.collectionView.delegate = self
                cell.collectionView.dataSource = self
              
               
                return cell
            case 2:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContestAllCategoriesItem.identifier, for: indexPath) as! ContestAllCategoriesItem
                cell.collectionView.tag = all_tag
                cell.collectionView.register(UINib(nibName: ContestCategoryItem.identifier, bundle: Bundle.main), forCellWithReuseIdentifier: ContestCategoryItem.identifier)
                cell.collectionView.delegate = self
                cell.collectionView.dataSource = self
               
            
                return cell
            default:
                return UICollectionViewCell()
                
            }
        }
        
        if collectionView.tag == popularityTag {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContestCategoryItem.identifier, for: indexPath) as! ContestCategoryItem
            cell.imageView.image = UIImage(named: "image_fitness")
            cell.label.text = "Fitness"
            return cell
        }
        if collectionView.tag == week_monthTag {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContestCategoryItem.identifier, for: indexPath) as! ContestCategoryItem
            cell.imageView.image = UIImage(named: "image_fitness")
            cell.label.text = "Fitness"
            return cell
        }
        if collectionView.tag == all_tag {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContestCategoryItem.identifier, for: indexPath) as! ContestCategoryItem
            cell.imageView.image = UIImage(named: "image_fitness")
            cell.label.text = "Fitness"
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionView_Top {
            let textWidth = topCollectionViewData[indexPath.row].width(withConstrainedHeight: 19, font: AppFont.semiBold(size: 12))
            return CGSize(width: textWidth + 32, height: 30)
        }
        if collectionView == collectionView_Bottom {
            if indexPath.row == 2 {
                return CGSize(width: collectionView.frame.width, height: 850)
            }
            return CGSize(width: collectionView.frame.width, height: ContestSliderItem.cellHeight)
        }
        if collectionView.tag == popularityTag || collectionView.tag == week_monthTag {
            return ContestCategoryItem.cellSize
        }
        if collectionView.tag == all_tag {
            let dimension = (collectionView.frame.width - 25) / 2
            return CGSize(width: dimension, height: dimension)
        }
        return CGSize(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionView_Top {
            if topCollectionViewSelectedIndex != indexPath.row {
                let tempIndex = topCollectionViewSelectedIndex
                topCollectionViewSelectedIndex = indexPath.row
                DispatchQueue.main.async {
                    self.collectionView_Top.reloadItems(at: [IndexPath(item: tempIndex, section: indexPath.section), IndexPath(item: self.topCollectionViewSelectedIndex, section: indexPath.section)])
                }
            }
        }
    }
    
}
