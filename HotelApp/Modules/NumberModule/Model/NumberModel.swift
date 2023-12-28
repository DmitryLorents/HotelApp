

import UIKit

enum NumberModel {
    static let title = "Steigenberger Makadi"
    //static let starLabelText = "  ★ 5 Превосходно  "
    static let buttonTitle = "Выбрать номер"
    static let subButtonTitle = "  Подробнее о номере \u{232A}  "
    static let numberPriceBeginning = "186 600 Р"
    static let numberPriceEnd = " за 7 ночей с перелетом"
    static let numberDescriptionString = "Стандартный с видом на бассейн или сад"
    static let optionsStringArray = ["Все включено", "Кондиционер"]
    
    static let imageCornerRadius: CGFloat = 16
    static let viewCornerRadius: CGFloat = 12
    static let buttonCornerRadius: CGFloat = 15
    static let buttonHeight: CGFloat = 48
    
    static let backgroundColor = UIColor(named: "BackgroundColor")
    static let buttonBackground = UIColor(named: "ButtonColor")
    static let aboutNumberBAckgroundColor = UIColor(named: "AboutNumberBackground")
    
    static let standardFont16 = UIFont.systemFont(ofSize: 16, weight: .semibold)
    static let standardFont22 = UIFont.systemFont(ofSize: 22, weight: .semibold)
    static let standardFont30 = UIFont.systemFont(ofSize: 30)
}
