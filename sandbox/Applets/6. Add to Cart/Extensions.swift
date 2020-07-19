//
//  Extensions.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-07-10.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//


import UIKit

extension ProductPgViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    /*
        let padding: CGFloat =  50
        let collectionViewSize = collectionView.frame.size.width - padding

        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
     */
        
        return CGSize(width: collectionView.bounds.size.width/2 - 10, height: 200)
        
        //collectionView.bounds.size.height/2 -
        
        let bounds = collectionView.bounds
        let heightVal = collectionView.frame.height
        let widthVal = collectionView.frame.width
        let cellsize = (heightVal < widthVal) ? bounds.height/2 : bounds.width/2
        
        return CGSize(width: cellsize - 30, height: -30)

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 18
    }
}

 /*

 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
     return 8
 }
 
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     // We subtract 16 because there are 2 inter item spaces like:
     // [CELL] [spacing:8] [CELL] [spacing:8] [CELL]
     let usableWidth = collectionView.frame.width - (2 * 8)

     let cellWidth: CGFloat = usableWidth / 3
     let cellHeight: CGFloat = cellWidth

     return CGSize(width: cellWidth, height: cellHeight)
 }
 
 
 */
