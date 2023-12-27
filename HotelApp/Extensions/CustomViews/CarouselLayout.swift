//
//  CarouselLayout.swift
//  HotelApp
//
//  Created by Dmitry on 27.12.2023.
//

import UIKit

final class CarouselLayout: UICollectionViewFlowLayout {
    //MARK: - Init
    
    override init() {
        super.init()
        self.minimumInteritemSpacing = 0
        self.minimumLineSpacing = 0
        self.scrollDirection = .horizontal
        self.sectionInset = .zero
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //update layout size
    override func prepare() {
        super.prepare()
        if let collectionView {
            itemSize = collectionView.frame.size
        }
    }
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        guard itemSize != newBounds.size else {return false}
        itemSize = newBounds.size
        return true
    }
}
