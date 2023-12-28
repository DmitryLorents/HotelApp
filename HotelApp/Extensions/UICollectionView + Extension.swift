//
//  UICollectionView + Extension.swift
//  HotelApp
//
//  Created by Dmitry on 28.12.2023.
//

import UIKit

extension UICollectionView {
    static func createChipsCollectionView() -> UICollectionView {
        //configure layout
        let layout = LeftAlignedLayout()
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.estimatedItemSize = LeftAlignedLayout.automaticSize
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(ChipsViewCell.self, forCellWithReuseIdentifier: ChipsViewCell.reuseID)
        view.contentInsetAdjustmentBehavior = .always
        return view
    }
}
