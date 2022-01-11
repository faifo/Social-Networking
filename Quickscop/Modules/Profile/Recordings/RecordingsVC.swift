//
//  RecordingsVC.swift
//  Quickscop
//
//  Created by Solo on 07/11/2021.
//

import UIKit

class RecordingsVC: BaseVC {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setUpUI() {
        super.setUpUI()
        setTitle(title: "recordings".l10n())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: RecordingItem.identifier, bundle: Bundle.main), forCellWithReuseIdentifier: RecordingItem.identifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let itemWidth = CGFloat((self.view.frame.width - 10 - 3) / 2).rounded(.down)
        let itemHeight = ((itemWidth * RecordingItem.ratioHeight)/RecordingItem.ratioWidth).rounded(.down)
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.minimumLineSpacing = 3
        layout.minimumInteritemSpacing = 1
        
        collectionView.collectionViewLayout = layout
      
        createCreateButton()
        setBackButton()
        
    }
    
    private func createCreateButton() {
        
        let rightBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 57, height: 34))
        rightBtn.layer.masksToBounds = true
        rightBtn.layer.cornerRadius = 11
        rightBtn.layer.borderWidth = 1
        rightBtn.layer.borderColor = AppColor.gray.cgColor
        
        let fullString = NSMutableAttributedString(string: "")

        // create our NSTextAttachment
        // wrap the attachment in its own attributed string so we can append it
        let image1String = NSAttributedString(attachment: self.textAttachment())

        // add the NSTextAttachment wrapper to our full string, then add some more text.
        fullString.append(image1String)
        fullString.append(NSAttributedString(string: " \("create".l10n())", attributes: [
            .font: AppFont.semiBold(size: 10),
            .foregroundColor : UIColor.black
        ]))
        
        fullString.setAttachmentsAlignment(.center)

        // draw the result in a label
        rightBtn.setAttributedTitle(fullString, for: .normal)
        
        let itemBar = UIBarButtonItem(customView: rightBtn)
        navigationItem.rightBarButtonItem = itemBar
    }
    
    private func textAttachment() -> NSTextAttachment {
        let font = AppFont.semiBold(size: 10) //set accordingly to your font, you might pass it in the function
        let textAttachment = NSTextAttachment()
        let image = UIImage(named: "ic_glow_plus")
        textAttachment.image = image
        let mid = font.descender + font.capHeight
        textAttachment.bounds = CGRect(x: 0, y: font.descender - image!.size.height / 2 + mid + 2, width: image!.size.width, height: image!.size.height).integral
        return textAttachment
    }
}

extension RecordingsVC : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecordingItem.identifier, for: indexPath) as! RecordingItem
        cell.setLeftTitle(title: "Paysages")
        cell.setRightTitle(title: "622 photos")
        return cell
    }
}
