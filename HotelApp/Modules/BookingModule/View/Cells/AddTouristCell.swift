//
//  AddTouristCell.swift
//  HotelApp
//
//  Created by Dmitry on 27.12.2023.
//

import UIKit

class AddTouristCell: UITableViewCell {
    
    //MARK: - Parameters
    static let reuseID = String(describing: AddTouristCell.self)
    
    private lazy var backgroundCellView: UIView = makeWhiteView()
    private let addTouristLabel: UILabel = .makeBigCellLabel(title: BookingModel.addTouristString)
    private lazy var squareButton: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: BookingModel.plusImageName))
        view.isUserInteractionEnabled = true
        view.layer.cornerRadius = BookingModel.smallButtonCornerRadius
        view.tintColor = BookingModel.buttonBackground
        return view
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
    
    //MARK: - Methods
    
    private func setupViews() {
        backgroundColor = .clear
        contentView.addSubview(backgroundCellView)
        backgroundCellView.addSubviews(addTouristLabel, squareButton)
    }
}
//MARK: - Set constraints
extension AddTouristCell {
    private func setupConstraints() {
        
        backgroundCellView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0))
        }
        
        addTouristLabel.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(16)
        }
        
        squareButton.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview().inset(13)
            make.width.equalTo(squareButton.snp.height)
            make.centerY.equalTo(addTouristLabel)
        }
    }
    
    
    
}
