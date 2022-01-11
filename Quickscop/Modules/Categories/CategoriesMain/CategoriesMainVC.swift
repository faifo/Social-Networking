//
//  CategoriesMainVC.swift
//  Quickscop
//
//  Created by GnolDrol on 11/2/21.
//

import UIKit
import MASegmentedControl

class CategoriesMainVC: BaseVC {
    @IBOutlet weak var segment: MASegmentedControl!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lbl_categories: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func setUpUI() {
        super.setUpUI()
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
        segment.setSegmentedWith(items: ["free".l10n(), "competition".l10n()])
        segment.addTarget(self, action: #selector(self.changeSegmentValue), for: .valueChanged)
        
        collectionView.register(UINib(nibName: CategoriesCell.identifier, bundle: Bundle.main), forCellWithReuseIdentifier: CategoriesCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let widthDimension : CGFloat = CGFloat(self.view.frame.width / 2)
        let heightDimension : CGFloat = CGFloat(CategoriesCell.cellHeight)
        layout.itemSize = CGSize(width: widthDimension, height: heightDimension)
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 0
        
        collectionView.collectionViewLayout = layout
    }
    
    @objc func changeSegmentValue() {
        
    }
    
}

extension CategoriesMainVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCell.identifier, for: indexPath) as! CategoriesCell
        return cell
    }
    
}
