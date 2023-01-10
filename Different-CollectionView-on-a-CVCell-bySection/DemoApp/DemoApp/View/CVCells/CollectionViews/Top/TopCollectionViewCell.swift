//
//  TopCollectionViewCell.swift
//  DemoApp
//
//  Created by Md. Faysal Ahmed on 9/11/22.
//

import UIKit

class TopCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var topCV: UICollectionView!
    
    let image = ["a", "b", "c", "d", "e", "f", "g"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCV()
    }
    
    func setupCV() {
        let nib = UINib(nibName: "TopCVCell", bundle: nil)
        topCV.register(nib, forCellWithReuseIdentifier: "cell")
        topCV.delegate = self
        topCV.dataSource = self
    }
}


extension TopCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = topCV.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TopCVCell
        cell.img.image = UIImage(named: image[indexPath.row])
        
        return cell
    }
    
    
    
}

