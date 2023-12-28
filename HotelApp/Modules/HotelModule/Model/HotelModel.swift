//
//  HotelModel.swift
//  HotelApp
//
//  Created by Dmitry on 20.12.2023.
//

import UIKit

enum HotelModel {
    static let cellID = "cell"
    static let title = "Отель"
    static let starLabelText = "  ★ 5 Превосходно  "
    static let buttonTitle = "К выбору номера"
    static let hotelName = "Steigenberger Makadi"
    static let hotelAdress = "Madinat Makadi, Safaga Road, Makadi Bay, Египет"
    static let hotelPriceBeginning = "от "
    static let priceString = "134 673 Р"
    static let hotelPriceEnd = " за тур с перелетом"
    static let aboutHotelString = "Об отеле"
    static let hotelDescription = "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!"
    static let optionsStringArray = ["3-я линия", "Платный Wi-Fi в фойе", "30 км до аэропорта", "1 км до пляжа"]
    static let tableTitlesArray: [(title: String, subtitle: String, imageName: String)] =
    [("Удобства", "Самое необходимое", "1"),
     ("Что включено", "Самое необходимое", "2"),
     ("Что не включено", "Самое необходимое", "3")]
    
    static let imageCornerRadius: CGFloat = 16
    static let viewCornerRadius: CGFloat = 12
    static let buttonCornerRadius: CGFloat = 15
    static let bottomViewHeight: CGFloat = 88
    static let chipsCornerRadius: CGFloat = 5
    
    static let backgroundColor = UIColor(named: "BackgroundColor")
    static let buttonBackground = UIColor(named: "ButtonColor")
    static let orangeLabelBackgroundColor = UIColor(named: "OrangeLabelBackground")
    static let orangeLabelTextColor = UIColor(named: "OrangeLabelColor")
    static let tableViewBackgroundColor = UIColor(named: "TableViewBackground")
    
    static let standardFont16 = UIFont.systemFont(ofSize: 16, weight: .semibold)
    static let standardFont22 = UIFont.systemFont(ofSize: 22, weight: .semibold)
    static let standardFont30 = UIFont.systemFont(ofSize: 30)
    
    static let imageArray = [UIImage(named: "image20")!, UIImage(named: "image21")!]
}
