//
//  PaymentInfoCell.swift
//  HotelApp
//
//  Created by Dmitry on 27.12.2023.
//

import UIKit

class PaymentInfoCell: UITableViewCell {
    //MARK: - Parameters
    static let reuseID = String(describing: PaymentInfoCell.self)

    private lazy var backgroundCellView: UIView = makeWhiteView()
    private lazy var verticalStack: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.alignment = .fill
        stack.distribution = .equalCentering
        return stack
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Methods
    private func fulfillVerticalStackView() {
        for index in 0..<BookingModel.paymentDescriptionArray.count {
            let hStack = UIStackView()
            hStack.axis = .horizontal
            hStack.alignment = .top
            hStack.distribution = .fill
            //set labels
            let titleLabel = UILabel.makeCellTitleLabel()
            titleLabel.text = BookingModel.paymentDescriptionArray[index].title
            let subtitleLabel = UILabel.makeCellsubtitleLabel()
            subtitleLabel.textAlignment = .right
            subtitleLabel.text = BookingModel.paymentDescriptionArray[index].subtitle
            //add views
            hStack.addArrangedSubviews(titleLabel, subtitleLabel)
            verticalStack.addArrangedSubview(hStack)
        }
    }
    
    private func setupViews() {
        fulfillVerticalStackView()
        backgroundColor = .clear
        contentView.addSubview(backgroundCellView)
        backgroundCellView.addSubview(verticalStack)
    }
}
//MARK: - Set constraints
extension PaymentInfoCell {
    private func setupConstraints() {
        
        backgroundCellView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0))
        }
        
        verticalStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
    }
}
