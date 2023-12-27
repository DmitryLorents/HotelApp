

import UIKit
import SnapKit

final class HotelView: UIView {
    
    //MARK: - Parameters
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private let contentView = UIView()
    
    private lazy var firstView: UIView = makeWhiteView()
    
    private lazy var topCollectionView = Carousel(images: HotelModel.imageArray)
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
    private lazy var optionsCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = .gray
        return view
    }()
    private let hotelDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = HotelModel.hotelDescription
        label.font = HotelModel.standardFont16
        label.numberOfLines = 0
        return label
    }()
    private lazy var buttonsTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.backgroundColor = .brown//HotelModel.tableViewBackgroundColor
        table.rowHeight = 184 / 3
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
        scrollView.contentSize = contentView.bounds.size
        //print("self.contentScaleFactor", self.contentScaleFactor )
        
    }
    
    //MARK: - Methods
    
    func setupView(model: HotelParsingModel?, buttonAction: UITapGestureRecognizer) {
        
        numberChoosingButton.addGestureRecognizer(buttonAction)
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
            make.leading.equalTo(topCollectionView)
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
            //make.height.equalTo(500)
        }
        
        aboutHotelLabel.snp.makeConstraints { make in
            make.leading.equalTo(topCollectionView)
            make.top.equalToSuperview().inset(16)
        }
        optionsCollectionView.snp.makeConstraints { make in
            make.leading.trailing.height.equalTo(topCollectionView)
            make.top.equalTo(aboutHotelLabel.snp.bottom).inset(-16)
        }
        hotelDescriptionLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(topCollectionView)
            make.top.equalTo(optionsCollectionView.snp.bottom).inset(-12)
        }
        buttonsTableView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(topCollectionView)
            make.top.equalTo(hotelDescriptionLabel.snp.bottom).inset(-16)
            make.height.equalTo(184)
            make.bottom.equalToSuperview().inset(16)
        }
        
        
        
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
