//
//  NumberTableViewCell.swift
//  HotelApp
//
//  Created by Dmitry on 23.12.2023.
//

import UIKit

class NumberTableViewCell: UITableViewCell {
    //MARK: - Parameters
    static let reuseID = String(describing: NumberTableViewCell.self)
    
    private let cellBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = NumberModel.viewCornerRadius
        return view
        
    }()
    private lazy var topCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = .gray
        view.layer.cornerRadius = HotelModel.imageCornerRadius
        view.clipsToBounds = true
        return view
    }()
    private let descriptionLabel: UILabel = {
       let label = UILabel()
        label.text = NumberModel.numberDescriptionString
        label.font = HotelModel.standardFont22
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var optionsCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = .gray
        return view
    }()
    
    private var aboutNumberButton : UIButton = .makeBlueButton(title: NumberModel.buttonTitle)
    
    private lazy var numberChoosingButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = HotelModel.buttonBackground
        button.isUserInteractionEnabled = true
        let attributes : [NSAttributedString.Key: Any] = [
            .font: HotelModel.standardFont16,
            .foregroundColor: UIColor.white
        ]
        let attributedTitle = NSAttributedString(string: HotelModel.buttonTitle, attributes: attributes)
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.layer.cornerRadius = HotelModel.buttonCornerRadius
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
//MARK: - Init
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setViews()
        setConstraints()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Methods
    
    private func setViews() {
        //TODO - Change to background
        contentView.backgroundColor = .yellow
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.addSubviews(topCollectionView, descriptionLabel, optionsCollectionView)
    }
    
    private func setConstraints() {
        
        cellBackgroundView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(4)
            make.leading.trailing.equalToSuperview()
            
        }
        topCollectionView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview().inset(16)
            make.height.equalTo(topCollectionView.snp.width).multipliedBy(257.0 / 343.0)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(topCollectionView)
            make.top.equalTo(topCollectionView.snp.bottom).inset(-8)
        }
        optionsCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(topCollectionView)
            make.height.equalTo(29)
            make.top.equalTo(descriptionLabel.snp.bottom).inset(-8)
        }
    }

}
