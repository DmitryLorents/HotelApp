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
    
    static func makeStarLabel() -> UILabel {
        let label = UILabel()
        label.text = HotelModel.starLabelText
        label.backgroundColor = HotelModel.orangeLabelBackgroundColor
        label.textColor = HotelModel.orangeLabelTextColor
        label.font = HotelModel.standardFont16
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        return label
    }
    
    static func makeHotelNameLabel() -> UILabel {
        let label = UILabel()
        label.text = HotelModel.hotelName
        label.font = HotelModel.standardFont22
        return label
    }
}
