//
//  TouristInformationCell.swift
//  HotelApp
//
//  Created by Dmitry on 24.12.2023.
//

import UIKit

class TouristInformationCell: UITableViewCell {
    //MARK: - Parameters
    static let reuseID = String(describing: TouristInformationCell.self)
    
    private lazy var backgroundCellView: UIView = makeWhiteView()
    private lazy var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .fill
        stack.distribution = .equalCentering
        return stack
    }()
    private let touristNumberLabel: UILabel = .makeBigCellLabel(title: BookingModel.touristNumbersArray[0])
    private lazy var phoneNumberGrayView = makeGrayView()
    private lazy var phoneNumberPlaceholder: UILabel = .makePlaceholderLabel(title: BookingModel.phoneNumberString)
    private lazy var phoneNumberTF: UITextField = .makeCustomTF(placeholder: "placeholder")
    private lazy var emailGrayView = makeGrayView()
    private lazy var emailPlaceholder: UILabel = .makePlaceholderLabel(title: BookingModel.emailString)
    private lazy var emailTF: UITextField = .makeCustomTF(placeholder: "placeholder")
    private lazy var dateOfBirthView = makeGrayViewWithTextfieldAnd(placeholder: BookingModel.dateOFBirthPlaceholder)
    private lazy var citizenshipView = makeGrayViewWithTextfieldAnd(placeholder: BookingModel.citizenshipPlaceholder)
    private lazy var passportNumberView = makeGrayViewWithTextfieldAnd(placeholder: BookingModel.passportNumberPlaceholder)
    private lazy var passportExpirationDateView = makeGrayViewWithTextfieldAnd(placeholder: BookingModel.passportExpirationDatePlaceholder)
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    private func setupViews() {
        backgroundColor = .clear
        contentView.addSubview(backgroundCellView)
        backgroundCellView.addSubviews(touristNumberLabel, verticalStack)
        verticalStack.addArrangedSubviews(phoneNumberGrayView, emailGrayView, dateOfBirthView, citizenshipView, passportNumberView, passportExpirationDateView)
        phoneNumberGrayView.addViewInside(label: phoneNumberPlaceholder, textField: phoneNumberTF)
        emailGrayView.addViewInside(label: emailPlaceholder, textField: emailTF)
    }
}
//MARK: - Set constraints
extension TouristInformationCell {
    private func setupConstraints() {
        
        backgroundCellView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0))
        }
        
        touristNumberLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(16)
        }
        
        verticalStack.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(16)
            make.top.equalTo(touristNumberLabel.snp.bottom).inset(-16)
        }
    }
    
    
}
