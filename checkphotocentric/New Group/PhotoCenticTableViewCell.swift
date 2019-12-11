//
//  photoCenticTableViewCell.swift
//  checkphotocentric
//
//  Created by Ponkumar's Mac on 10/12/19.
//  Copyright © 2019 Ponkumar's Mac. All rights reserved.
//

import UIKit

class PhotoCenticTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    var dataInfoObj = DataInfo.dataInstance
    var setData = DataModel()
    var dumlabel : UILabel = UILabel()
    var maxNumberOfLines:Int!
    override func awakeFromNib() {
        super.awakeFromNib()
          self.collectionView.dataSource = self
         self.collectionView.delegate = self
    }


}

extension PhotoCenticTableViewCell : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         
         let collectionviewCellWidth : CGFloat  = (self.frame.size.width/2) - 20
         let collectionviewCellHeight : CGFloat  = (self.frame.height/2)
         return CGSize(width: collectionviewCellWidth, height: collectionviewCellHeight)
     }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
           1
       }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count = dataInfoObj.title.count
        count = count >= 4 ? 4 : count >= 2 ? 2 : 0
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collect" , for: indexPath) as! PhotoCenticCollectionViewCell
        setData = DataModel(image: dataInfoObj.image[indexPath.row], status: dataInfoObj.status[indexPath.row], title: dataInfoObj.title[indexPath.row])
        cell.setView(data: setData)
        return cell
    }
    
}

extension  PhotoCenticTableViewCell {
    func setupDummyLabel() {
        dumlabel.frame.size.width = UIScreen.main.bounds.width/2
    }
    
        func findnoLine(datainfo : [String]) -> [Int]
        {
            var lineData1 = [Int]()
            let data1 = dataInfoObj.title
            for string1 in data1 {
                dumlabel.text = string1
                let count = dumlabel.maxNumberOfLines
                lineData1.append(count)
            }
            return lineData1
        }
    public func maxNumber(inArray array:[Int]) -> Int {
        var max = 0
        for number in array {
            if(number > max) {
                max = number
            }
        }
        return max
    }
}

extension UILabel {
    var maxNumberOfLines: Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(MAXFLOAT))
        let text = (self.text ?? "") as NSString
       let textHeight = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [.font: font as Any], context: nil).height
        let lineHeight = font.lineHeight
       if (Int(ceil(textHeight / lineHeight))) > 3 {
          return 3
       }
       else{
           return Int(ceil(textHeight / lineHeight))
       }
    }
}
