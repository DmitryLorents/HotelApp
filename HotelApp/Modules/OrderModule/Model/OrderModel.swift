//
//  HotelModel.swift
//  HotelApp
//
//  Created by Dmitry on 20.12.2023.
//

import UIKit

enum OrderModel {
    static let title = "Заказ оплачен"
    static let orderStatusText = "Ваш заказ принят в работу"
    static let buttonTitle = "Супер"
    static func getRandomOrderText(orderNumber: Int) -> String {
        "Подтверждение заказа №\(orderNumber) может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление."
    }
    
    static let imageName = "orderImage"
    
    static let buttonCornerRadius: CGFloat = 15
    static let bottomViewHeight: CGFloat = 88
    
    static let backgroundColor = UIColor(named: "BackgroundColor")
    static let buttonBackground = UIColor(named: "ButtonColor")
    
    static let standardFont16 = UIFont.systemFont(ofSize: 16, weight: .semibold)
    static let standardFont22 = UIFont.systemFont(ofSize: 22, weight: .semibold)
    static let standardFont30 = UIFont.systemFont(ofSize: 30)
}
