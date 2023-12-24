//
//  HotelModel.swift
//  HotelApp
//
//  Created by Dmitry on 20.12.2023.
//

import UIKit

enum BookingModel {
    static let title = "Бронирование"
    static let starLabelText = "  ★ 5 Превосходно  "
    static let buttonTitle = "Оплатить 198 036 ₽"
    static let hotelName = "Steigenberger Makadi"
    static let hotelAdress = "Madinat Makadi, Safaga Road, Makadi Bay, Египет"
    static let hotelPriceBeginning = "от "
    static let priceString = "134 673 Р"
    static let hotelPriceEnd = " за тур с перелетом"
    static let aboutHotelString = "Об отеле"
    static let hotelDescription = "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!"
    static let bookingDescriptionArray: [(title: String, subtitle: String)] = [
    ("Вылет из", "Санкт-Петербург"),
    ("Страна, город", "Египет, Хургада"),
    ("Даты", "19.09.2023 – 27.09.2023"),
    ("Кол-во ночей", "7 ночей"),
    ("Отель", "Steigenberger Makadi"),
    ("Номер", "Стандартный с видом на бассейн или сад"),
    ("Питание", "Все включено")
    ]
    
    static let imageCornerRadius: CGFloat = 16
    static let viewCornerRadius: CGFloat = 12
    static let buttonCornerRadius: CGFloat = 15
    static let bottomViewHeight: CGFloat = 88
    
    static let backgroundColor = UIColor(named: "BackgroundColor")
    static let buttonBackground = UIColor(named: "ButtonColor")
    static let orangeLabelBackgroundColor = UIColor(named: "OrangeLabelBackground")
    static let orangeLabelTextColor = UIColor(named: "OrangeLabelColor")
    static let tableViewBackgroundColor = UIColor(named: "TableViewBackground")
    
    static let standardFont16 = UIFont.systemFont(ofSize: 16, weight: .semibold)
    static let standardFont22 = UIFont.systemFont(ofSize: 22, weight: .semibold)
    static let standardFont30 = UIFont.systemFont(ofSize: 30)
}

