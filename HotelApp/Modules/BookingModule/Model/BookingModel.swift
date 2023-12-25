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
    static let bayerInformationString = "Информация о покупателе"
    static let hotelAdress = "Madinat Makadi, Safaga Road, Makadi Bay, Египет"
    static let phoneNumberString = "Номер телефона"
    static let emailString = "Почта"
    static let warningText = "Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту"
    static let dateOFBirthPlaceholder = "Дата рождения"
    static let citizenshipPlaceholder = "Гражданство"
    static let passportNumberPlaceholder = "Номер загранпаспорта"
    static let passportExpirationDatePlaceholder = "Срок действия загранпаспорта"
    static let touristNumbersArray = ["Первый турист", "Второй турист", "Третий турист", "Четвертый турист"]
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
    static let grayViewCornenRadius: CGFloat = 10
    static let buttonCornerRadius: CGFloat = 15
    static let bottomViewHeight: CGFloat = 88
    
    static let backgroundColor = UIColor(named: "BackgroundColor")
    static let buttonBackground = UIColor(named: "ButtonColor")
    static let orangeLabelBackgroundColor = UIColor(named: "OrangeLabelBackground")
    static let orangeLabelTextColor = UIColor(named: "OrangeLabelColor")
    static let tableViewBackgroundColor = UIColor(named: "TableViewBackground")
    
    static let standardFont12 = UIFont.systemFont(ofSize: 12, weight: .semibold)
    static let standardFont16 = UIFont.systemFont(ofSize: 16, weight: .semibold)
    static let standardFont22 = UIFont.systemFont(ofSize: 22, weight: .semibold)
    static let standardFont30 = UIFont.systemFont(ofSize: 30)
}

