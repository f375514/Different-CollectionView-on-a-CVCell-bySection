//
//  ViewController.swift
//  DemoApp
//
//  Created by Md. Faysal Ahmed on 9/11/22.
//


// If I load different collectionView on a collectionViewCell by section and want to scroll top collectionViews when scroll 
// current (vertical) collectionView, then I've to disable customCollectionView scrolling and five them height according to.


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCV()
        

    }
    
    func setupCV() {
        let nib = UINib(nibName: "TopCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        let nib2 = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib2, forCellWithReuseIdentifier: "cell2")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (indexPath.section == 0) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TopCollectionViewCell
            
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! CollectionViewCell
            return cell
        }
    }
    
    
    
}


extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            return CGSize(width: view.frame.width, height: 150)
        }else {
            let width = view.frame.width
            return CGSize(width: width, height: width/4 * 20)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
