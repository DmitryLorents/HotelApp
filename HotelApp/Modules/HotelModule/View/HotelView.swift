

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
        button.setTitle(HotelModel.buttonTitle, for: .normal)
        return button
    }()
    
    private lazy var topCollectionView: UICollectionView = {
        let view = UICollectionView()
        view.backgroundColor = .yellow
        return view
        
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
