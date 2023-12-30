

import UIKit
import SnapKit

final class HotelView: UIView {
    
    //MARK: - Parameters
    
    private let networkManager = NetworkManager.shared
    
    private var peculiarities: [String]? {
        didSet {
            optionsCollectionView.reloadData()
        }
    }
    
    private var imageArray: [String]? {
        didSet {
            print("Images",imageArray?.count, imageArray)
            topCollectionView.images = imageArray
        }
    }
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private let contentView = UIView()
    
    private lazy var firstView: UIView = makeWhiteView()
    
    private lazy var topCollectionView = Carousel(imageURLs: HotelModel.imageArray)
    private let starLabel: UILabel = .makeStarLabel()
    private let hotelNameLabel: UILabel = .makeBigCellLabel(title: HotelModel.hotelName)
    private let hotelAdressButton: UIButton = .makehotelAdressButton()
    
    private let priceLabel: UILabel = .makePriceLabel(title: HotelModel.hotelPriceBeginning + HotelModel.priceString, subtitle: HotelModel.hotelPriceEnd)
    
    //secondView
    
    private lazy var secondView: UIView = makeWhiteView()
    private let aboutHotelLabel: UILabel = {
        let label = UILabel()
        label.text = HotelModel.aboutHotelString
        label.font = HotelModel.standardFont22
        return label
    }()
    private lazy var optionsCollectionView: UICollectionView = .createChipsCollectionView()
    private let hotelDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = HotelModel.hotelDescription
        label.font = HotelModel.standardFont16
        label.numberOfLines = 0
        return label
    }()
    private lazy var buttonsTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.backgroundColor = .clear
        table.rowHeight = UITableView.automaticDimension
        
        table.delegate = self
        table.dataSource = self
        table.register(ButtonsTableViewCell.self, forCellReuseIdentifier: ButtonsTableViewCell.reuseID)
        return table
    }()
    
    //thirdView
    private lazy var thirdView: UIView = makeWhiteView()
    
    private var numberChoosingButton: UIButton = .makeBlueButton(title: HotelModel.buttonTitle)
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Set scrollView content size
    override func layoutSubviews() {
        super.layoutSubviews()
        updateTableViewConstraints()
        updateCollectionViewConstraints()
        scrollView.contentSize = contentView.bounds.size
       // scrollView.contentSize.height += 170
    }
    
    //MARK: - Methods
    
    public func transferDelegates(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        optionsCollectionView.dataSource = dataSource
        optionsCollectionView.delegate = delegate
    }
    
    public func setupView(model: HotelParsingModel?, buttonAction: UITapGestureRecognizer) {
        numberChoosingButton.addGestureRecognizer(buttonAction)
        guard let model else {return}
        starLabel.text = "  ★ \(model.rating) \(model.ratingName)  "
        hotelNameLabel.text = model.name
        hotelAdressButton.setTitle(model.adress, for: .normal)
        setPriceLabelText(model: model)
        hotelDescriptionLabel.text = model.aboutTheHotel.description
        topCollectionView.images = model.imageUrls
    }
    
    public func reloadCollectionView() {
        optionsCollectionView.reloadData()
        //updateCollectionViewConstraints()
        layoutSubviews()
    }
    
    private func setPriceLabelText(model: HotelParsingModel) {
                //beginning
                let beginningAttributes: [NSAttributedString.Key: Any] = [.font: HotelModel.standardFont30]
                let beginningAttributeContainer = AttributeContainer(beginningAttributes)
            let title = HotelModel.hotelPriceBeginning + String(model.minimalPrice)
                let beginningAttString = AttributedString((title),attributes: beginningAttributeContainer)
                
                //end
                let endAttributes: [NSAttributedString.Key: Any] = [
                    .font: HotelModel.standardFont16,
                    .foregroundColor: UIColor.gray
                ]
                let endAttContainer = AttributeContainer(endAttributes)
        let subtitle = " " + model.priceForIt.lowercased()
                let endAttString = AttributedString(subtitle, attributes: endAttContainer)
                let fullAttText = beginningAttString + endAttString
                priceLabel.attributedText = NSAttributedString(fullAttText)
    }
    
    private func updateCollectionViewConstraints() {
        let actualHeight = optionsCollectionView.collectionViewLayout.collectionViewContentSize.height + 1
        //update collectionView's height
        optionsCollectionView.snp.remakeConstraints { make in
            optionsCollectionView.snp.makeConstraints { make in
                make.leading.trailing.equalTo(topCollectionView)
                make.height.equalTo(actualHeight)
                make.top.equalTo(aboutHotelLabel.snp.bottom).inset(-16)
            }
        }
    }
    
    private func updateTableViewConstraints() {
        let actualHeight = buttonsTableView.contentSize.height
        buttonsTableView.snp.removeConstraints()
        buttonsTableView.snp.remakeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(hotelDescriptionLabel.snp.bottom).inset(20)
            make.height.equalTo(actualHeight)
            make.bottom.equalToSuperview().inset(-12)
        }
    }
    
    private func setupViews() {
        backgroundColor = .systemBackground
        contentView.backgroundColor = HotelModel.backgroundColor
        addSubviews(scrollView, thirdView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(firstView, secondView)
        firstView.addSubviews(topCollectionView, starLabel,hotelNameLabel, hotelAdressButton, priceLabel)
        secondView.addSubviews(aboutHotelLabel, optionsCollectionView, hotelDescriptionLabel, buttonsTableView)
        thirdView.addSubview(numberChoosingButton)
        
    }
}
//MARK: - Set constraints
extension HotelView {
    private func setupConstraints() {
        
        scrollView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(HotelModel.bottomViewHeight)
        }
        contentView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self)
        }
        firstView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
        }
        
        topCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(16)
            make.height.equalTo(topCollectionView.snp.width).multipliedBy(257.0/343.0)
        }
        
        starLabel.snp.makeConstraints { make in
            make.top.equalTo(topCollectionView.snp.bottom).inset(-16)
            make.leading.equalTo(topCollectionView)
            make.height.equalTo(29)
        }
        
        hotelNameLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(topCollectionView)
            make.top.equalTo(starLabel.snp.bottom).inset(-8)
        }
        hotelAdressButton.snp.makeConstraints { make in
            make.leading.equalTo(topCollectionView)
            make.height.equalTo(17)
            make.top.equalTo(hotelNameLabel.snp.bottom).inset(-8)
        }
        priceLabel.snp.makeConstraints { make in
            make.leading.equalTo(topCollectionView)
            make.top.equalTo(hotelAdressButton.snp.bottom).inset(-16)
            make.bottom.equalTo(firstView).inset(16)
        }
        
        //second view
        secondView.snp.makeConstraints { make in
            make.top.equalTo(firstView.snp.bottom).inset(-8)
            make.leading.trailing.equalTo(firstView)
            make.bottom.equalTo(contentView).inset(8)
        }
        
        aboutHotelLabel.snp.makeConstraints { make in
            make.leading.equalTo(topCollectionView)
            make.top.equalToSuperview().inset(16)
        }
        optionsCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(topCollectionView)
            make.height.greaterThanOrEqualTo(90)
            make.top.equalTo(aboutHotelLabel.snp.bottom).inset(-16)
        }
        hotelDescriptionLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(topCollectionView)
            make.top.equalTo(optionsCollectionView.snp.bottom).inset(-12)
        }
        updateTableViewConstraints()
        
        
        
        //bottomView
        thirdView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(scrollView.snp.bottom)
        }
        
        numberChoosingButton.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 12, left: 16, bottom: 28, right: 16))
        }
        
    }
}
//MARK: - UITableViewDelegate
extension HotelView: UITableViewDelegate {
    
}
//MARK: - UITableViewDataSource
extension HotelView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        HotelModel.tableTitlesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ButtonsTableViewCell.reuseID, for: indexPath) as? ButtonsTableViewCell else {return .init()}
        let model = HotelModel.tableTitlesArray[indexPath.row]
        cell.setCell(with: model)
        return cell
    }
    
    
}
