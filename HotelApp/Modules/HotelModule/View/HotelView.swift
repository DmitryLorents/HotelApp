

import UIKit
import SnapKit

class HotelView: UIView {

    //MARK: - Parameters
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .yellow//HotelModel.backgroundColor
        return view
    }()
    
    private let contentView = UIView()
    
    private let firstView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = HotelModel.viewCornerRadius
        return view
    }()
    
    private lazy var topCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = .gray
        view.layer.cornerRadius = HotelModel.imageCornerRadius
        view.clipsToBounds = true
        return view
    }()
    private let starLabel: UILabel = {
        let label = UILabel()
        label.text = HotelModel.starLabelText
        label.backgroundColor = HotelModel.orangeLabelBackgroundColor
        label.textColor = HotelModel.orangeLabelTextColor
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        return label
    }()
    private let secondView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = HotelModel.viewCornerRadius
        return view
    }()
    private let thirdView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var numberChoosingButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = HotelModel.buttonBackground
        let attributes : [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16),
            .foregroundColor: UIColor.white
        ]
        let attributedTitle = NSAttributedString(string: HotelModel.buttonTitle, attributes: attributes)
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.layer.cornerRadius = HotelModel.buttonCornerRadius
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print(#function)
        scrollView.contentSize = CGSize(width: 400, height: 1500)//
        print(contentView.bounds.size)
    }
    
    //MARK: - Methods
    private func setupViews() {
        //backgroundColor = HotelModel.backgroundColor
        addSubview(scrollView)
        contentView.backgroundColor = .blue
        scrollView.addSubview(contentView)
        contentView.addSubview(firstView)
        firstView.addSubview(topCollectionView)
        firstView.addSubview(starLabel)
        contentView.addSubview(secondView)
        addSubview(thirdView)
        thirdView.addSubview(numberChoosingButton)
    }
    
    private func setupConstraints() {
        
        scrollView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(HotelModel.bottomViewHeight)
        }
        contentView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self)
            make.height.equalTo(800)
        }
        firstView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            //TODO - delete later
            make.height.equalTo(530)
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
        
        secondView.snp.makeConstraints { make in
            make.top.equalTo(firstView.snp.bottom).inset(-8)
            make.leading.trailing.height.equalTo(firstView)
            make.bottom.equalTo(contentView).inset(8)
        }
        
        thirdView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(scrollView.snp.bottom)
        }
        
        numberChoosingButton.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 12, left: 16, bottom: 28, right: 16))
        }
        
    }
}
