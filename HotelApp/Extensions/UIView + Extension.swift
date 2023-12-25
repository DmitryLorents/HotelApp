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
    func makeGrayView() -> UIView {
        let view = UIView()
        view.backgroundColor = BookingModel.backgroundColor
        view.layer.cornerRadius = BookingModel.grayViewCornenRadius
        return view
    }
    func addViewInside(label: UILabel, textField: UITextField) {
        self.addSubviews(label, textField)
        //constraints
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalTo(16)
        }
        textField.snp.makeConstraints { make in
            make.leading.equalTo(label)
            make.top.equalTo(label.snp.bottom)
            make.bottom.equalToSuperview().inset(10)
        }
    }
}
