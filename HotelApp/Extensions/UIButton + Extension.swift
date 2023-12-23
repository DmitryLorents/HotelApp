//
//  UIButton + Extension.swift
//  HotelApp
//
//  Created by Dmitry on 23.12.2023.
//

import UIKit

extension UIButton {
    
    static func makeBlueButton (title: String) -> UIButton {
            let button = UIButton(type: .system)
            button.backgroundColor = HotelModel.buttonBackground
            button.isUserInteractionEnabled = true
            let attributes : [NSAttributedString.Key: Any] = [
                .font: HotelModel.standardFont16,
                .foregroundColor: UIColor.white
            ]
            let attributedTitle = NSAttributedString(string: title, attributes: attributes)
            button.setAttributedTitle(attributedTitle, for: .normal)
            button.layer.cornerRadius = HotelModel.buttonCornerRadius
            button.setTitleColor(.white, for: .normal)
            return button
        }
}
