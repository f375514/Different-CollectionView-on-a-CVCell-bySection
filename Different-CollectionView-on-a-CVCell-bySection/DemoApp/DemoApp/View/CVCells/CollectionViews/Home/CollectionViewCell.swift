//
//  CollectionViewCell.swift
//  DemoApp
//
//  Created by Md. Faysal Ahmed on 9/11/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var homeCV: UICollectionView!
    
    let images = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "9", "2", "3", "4", "5", "6", "7", "8", "10", "1", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "9", "2", "3", "4", "5", "6", "7", "8", "10", "1", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "9", "2", "3", "4", "5", "6", "7", "8", "10", "1", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "9", "2", "3", "4", "5", "6", "7", "8", "10", "1"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCV()
    }
    
    func setupCV() {
        let nib = UINib(nibName: "HomeCVCell", bundle: nil)
        homeCV.register(nib, forCellWithReuseIdentifier: "cell")
        homeCV.delegate = self
        homeCV.dataSource = self
    }
}


extension CollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = homeCV.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCVCell
        
        cell.img.image = UIImage(named: images[indexPath.row])
        
        return cell
    }
    
    
}


extension CollectionViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        return CGSize(width: width/4 - 2, height: width / 4 - 2)
    }
}
