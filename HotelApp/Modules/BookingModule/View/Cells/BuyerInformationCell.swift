//
//  BuyerInformationCell.swift
//  HotelApp
//
//  Created by Dmitry on 24.12.2023.
//

import UIKit

class BuyerInformationCell: UITableViewCell {
    //MARK: - Parameters
    static let reuseID = String(describing: BuyerInformationCell.self)

    private lazy var backgroundCellView: UIView = makeWhiteView()
    private lazy var verticalStack: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .fill
        stack.distribution = .equalCentering
        return stack
    }()
   private let bayerInformationLabel: UILabel = .makeBigCellLabel(title: BookingModel.bayerInformationString)
   private lazy var phoneNumberGrayView = makeGrayView()
    private lazy var phoneNumberPlaceholder: UILabel = .makePlaceholderLabel(title: BookingModel.phoneNumberString)
    private lazy var phoneNumberTF: UITextField = .makeCustomTF(placeholder: "placeholder")
    private lazy var emailGrayView = makeGrayView()
    private lazy var emailPlaceholder: UILabel = .makePlaceholderLabel(title: BookingModel.emailString)
    private lazy var emailTF: UITextField = .makeCustomTF(placeholder: "placeholder")
    private lazy var waringLabel: UILabel = .makeGrayTextLabel(text: BookingModel.warningText)
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Methods
   
    private func setupViews() {
        backgroundColor = .clear
        contentView.addSubview(backgroundCellView)
        backgroundCellView.addSubviews(bayerInformationLabel, verticalStack)
        verticalStack.addArrangedSubviews(phoneNumberGrayView, emailGrayView, waringLabel)
        phoneNumberGrayView.addViewInside(label: phoneNumberPlaceholder, textField: phoneNumberTF)
        emailGrayView.addViewInside(label: emailPlaceholder, textField: emailTF)
    }
}
//MARK: - Set constraints
extension BuyerInformationCell {
    private func setupConstraints() {
        
        backgroundCellView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0))
        }
        
        bayerInformationLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(16)
        }
        
        verticalStack.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(16)
            make.top.equalTo(bayerInformationLabel.snp.bottom).inset(-16)
        }
    }

}
