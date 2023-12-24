//
//  HotelDescriptionCell.swift
//  HotelApp
//
//  Created by Dmitry on 24.12.2023.
//

import UIKit

class HotelDescriptionCell: UITableViewCell {
    //MARK: - Parameters
    static let reuseID = String(describing: HotelDescriptionCell.self)
    
    private lazy var firstView: UIView = makeWhiteView()
    private lazy var verticalStack: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .leading
        return stack
    }()
    private let starLabel: UILabel = .makeStarLabel()
    private let hotelNameLabel: UILabel = .makeHotelNameLabel()
    private let hotelAdressButton: UIButton = .makehotelAdressButton()
    
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
//    func setupView(model: HotelParsingModel?, buttonAction: UITapGestureRecognizer) {
//        
//        numberChoosingButton.addGestureRecognizer(buttonAction)
//    }
    
    private func setupViews() {
        backgroundColor = .clear
        contentView.addSubview(firstView)
        firstView.addSubview(verticalStack)
        verticalStack.addArrangedSubview(starLabel)
        verticalStack.addArrangedSubview(hotelNameLabel)
        verticalStack.addArrangedSubview(hotelAdressButton)
    }
}
//MARK: - Set constraints
extension HotelDescriptionCell {
    private func setupConstraints() {
        
        firstView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0))
        }
        
        verticalStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
    }
}
