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
    private lazy var topCollectionView = Carousel(images: HotelModel.imageArray)
    private let descriptionLabel: UILabel = {
       let label = UILabel()
        label.text = NumberModel.numberDescriptionString
        label.font = HotelModel.standardFont22
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var optionsCollectionView: UICollectionView = .createChipsCollectionView()
//    {
//        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
//        view.backgroundColor = .gray
//        return view
//    }()
    
    private lazy var aboutNumberButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = NumberModel.aboutNumberBAckgroundColor?.withAlphaComponent(0.1)
        button.isUserInteractionEnabled = true
        let attributes : [NSAttributedString.Key: Any] = [
            .font: HotelModel.standardFont16,
            .foregroundColor: NumberModel.aboutNumberBAckgroundColor
        ]
        let attributedTitle = NSAttributedString(string: NumberModel.subButtonTitle, attributes: attributes)
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    private var priceLabel: UILabel = .makePriceLabel(title: NumberModel.numberPriceBeginning, subtitle: NumberModel.numberPriceEnd)
    
    private var numberChoosingButton : UIButton = .makeBlueButton(title: NumberModel.buttonTitle)
    
    
    
//MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    func setupView(model: HotelParsingModel?, buttonAction: UITapGestureRecognizer) {
        
        numberChoosingButton.addGestureRecognizer(buttonAction)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateCollectionViewConstraints()
    }
    
    private func setViews() {
        //TODO - Change to background
        contentView.backgroundColor = NumberModel.backgroundColor
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.addSubviews(topCollectionView, descriptionLabel, optionsCollectionView, aboutNumberButton, priceLabel, numberChoosingButton)
        //set collectionView delegates
        optionsCollectionView.dataSource = self
    }
    
    private func updateCollectionViewConstraints() {
        let actualHeight = optionsCollectionView.collectionViewLayout.collectionViewContentSize.height + 1
        optionsCollectionView.snp.removeConstraints()
        optionsCollectionView.snp.remakeConstraints { make in
            make.leading.trailing.equalTo(topCollectionView)
            make.height.equalTo(actualHeight)
            make.top.equalTo(descriptionLabel.snp.bottom).inset(-8)
        }
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
        updateCollectionViewConstraints()
        aboutNumberButton.snp.makeConstraints { make in
            make.leading.equalTo(topCollectionView)
            make.top.equalTo(optionsCollectionView.snp.bottom).inset(-8)
            make.height.equalTo(29)
        }
        priceLabel.snp.makeConstraints { make in
            make.leading.equalTo(topCollectionView)
            make.top.equalTo(aboutNumberButton.snp.bottom).inset(-16)
        }
        numberChoosingButton.snp.makeConstraints { make in
            make.leading.trailing.equalTo(topCollectionView)
            make.height.equalTo(NumberModel.buttonHeight)
            make.bottom.equalToSuperview().inset(16)
        }
    }

}

extension NumberTableViewCell: UpdateLayoutProtocol {
    func updateLayout() {
        self.layoutSubviews()
    }
}

extension NumberTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        NumberModel.optionsStringArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChipsViewCell.reuseID, for: indexPath) as? ChipsViewCell else {return .init()}
        cell.setTitle(title: NumberModel.optionsStringArray[indexPath.item])
        return cell
    }
    
    
}
