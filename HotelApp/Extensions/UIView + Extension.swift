//
//  UIView + Extension.swift
//  HotelApp
//
//  Created by Dmitry on 21.12.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
    func makeWhiteView() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = HotelModel.viewCornerRadius
        return view
    }
}
