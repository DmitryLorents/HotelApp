//
//  LeftAlignedLayout.swift
//  HotelApp
//
//  Created by Dmitry on 27.12.2023.
//

import UIKit

class LeftAlignedLayout: UICollectionViewFlowLayout {

        override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
                let attributes = super.layoutAttributesForElements(in: rect)
                var leftMargin = sectionInset.left
                var maxY: CGFloat = -1.0
                attributes?.forEach { layoutAttribute in
                    if layoutAttribute.frame.origin.y >= maxY {
                        leftMargin = sectionInset.left
                    }
                    layoutAttribute.frame.origin.x = leftMargin
                    leftMargin += layoutAttribute.frame.width + self.minimumInteritemSpacing
                    maxY = max(layoutAttribute.frame.maxY , maxY)
                }
                return attributes
        }
}
