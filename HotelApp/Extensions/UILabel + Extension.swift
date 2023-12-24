//
//  UILabel + Extension.swift
//  HotelApp
//
//  Created by Dmitry on 23.12.2023.
//

import UIKit

extension UILabel {
    static func makePriceLabel(title: String, subtitle: String) -> UILabel {
            let label = UILabel()
            //beginning
            let beginningAttributes: [NSAttributedString.Key: Any] = [.font: HotelModel.standardFont30]
            let beginningAttributeContainer = AttributeContainer(beginningAttributes)
            let beginningAttString = AttributedString((title),attributes: beginningAttributeContainer)
            
            //end
            let endAttributes: [NSAttributedString.Key: Any] = [
                .font: HotelModel.standardFont16,
                .foregroundColor: UIColor.gray
            ]
            let endAttContainer = AttributeContainer(endAttributes)
            let endAttString = AttributedString(subtitle, attributes: endAttContainer)
            let fullAttText = beginningAttString + endAttString
            label.attributedText = NSAttributedString(fullAttText)
            return label
    }
}
