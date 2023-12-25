

import UIKit

class OrderView: UIView {
    
    //MARK: - Parameters
    
    private let contentView = UIView()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: OrderModel.imageName))
        return view
    }()
    private lazy var orderStatusLabel: UILabel = .makeHotelNameLabel(title: OrderModel.orderStatusText)
    private lazy var orderConfirmationLabel: UILabel = .makeGrayTextLabel(text: OrderModel.getRandomOrderText(orderNumber: Int.random(in: 100_000...200_000)))    
    private lazy var topView: UIView = makeWhiteView()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 20
        view.alignment = .center
        return view
    }()
    
    //bottomView
    private lazy var bottomView: UIView = makeWhiteView()
    
    private var doneButton: UIButton = .makeBlueButton(title: OrderModel.buttonTitle)
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    func setupView(buttonAction: UITapGestureRecognizer) {
        doneButton.addGestureRecognizer(buttonAction)
    }
    func setRandomOrderNumber() {
        orderConfirmationLabel.text = OrderModel.getRandomOrderText(orderNumber: Int.random(in: 100_000...200_000))
    }
    
    private func setupViews() {
        backgroundColor = .systemBackground
        contentView.backgroundColor = OrderModel.backgroundColor
        addSubview(contentView)
        contentView.addSubviews(topView, bottomView)
        topView.addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(orderStatusLabel)
        stackView.addArrangedSubview(orderConfirmationLabel)
        bottomView.addSubview(doneButton)
    }
    
}
//MARK: - Set constraints
extension OrderView {
    private func setupConstraints() {
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        //bottomView
        bottomView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(OrderModel.bottomViewHeight)
        }
        
        doneButton.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 12, left: 16, bottom: 28, right: 16))
        }
        
        //topView
        topView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(bottomView.snp.top).inset(-4)
        }
        
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(23)
            make.centerY.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.height.width.equalTo(94)
        }
    }
}
