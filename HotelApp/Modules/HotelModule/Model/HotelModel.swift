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
    static let starLabelText = "  ★ 3 Ну такое...  "
    static let buttonTitle = "К выбору номера"
    static let hotelName = "Hotel name"//"Steigenberger Makadi"
    static let hotelAdress = "Adress button"//"Madinat Makadi, Safaga Road, Makadi Bay, Египет"
    static let hotelPriceBeginning = "от "
    static let priceString = "XXXXXXXX"//"134 673 Р"
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
    static let standardFont30 = UIFont.systemFont(ofSize: 30, weight: .semibold)
    
    static let imageArray = ["https://lh3.googleusercontent.com/p/AF1QipPeuNj7JH_tMP8YnMsgQO50UZj1Xt1QC3NssI1C=w287-h192-n-k-no-v1-rj", "https://lh3.googleusercontent.com/p/AF1QipOP-_YFak-eoenZ-SgLR0lVlBPTEE949BE64gyy=w287-h192-n-k-no-v1-rj", "https://lh3.googleusercontent.com/p/AF1QipN_NLwge8MvVjDhTaO5lFu4GuoUyLKWOYlhhZFK=w287-h192-n-k-no-v1-rj"]
}
