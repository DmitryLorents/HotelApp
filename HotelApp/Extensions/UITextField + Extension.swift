//
//  UITextField + Extension.swift
//  HotelApp
//
//  Created by Dmitry on 25.12.2023.
//

import UIKit

extension UITextField {
    static func makeCustomTF(placeholder: String?) -> UITextField {
        let view = UITextField()
        view.font = BookingModel.standardFont16
        view.placeholder = placeholder
        return view
    }
}
