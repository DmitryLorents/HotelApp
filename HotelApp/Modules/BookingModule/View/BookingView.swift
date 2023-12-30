//
//  HotelView.swift
//  HotelApp
//
//  Created by Dmitry on 20.12.2023.
//

import UIKit

class BookingView: UIView {

    //MARK: - Parameters
    
    private var bookingData: BookingParsingModel? {
        didSet {
            guard let bookingData else {return}
            tableView.reloadData()
            setPaymentButtonTitle(price: bookingData.fullPrice)
        }
    }
    
    private lazy var tableView: UITableView = {
       let table = UITableView()
        table.separatorStyle = .none
        table.backgroundColor = BookingModel.backgroundColor
        table.allowsSelection = false
        table.showsVerticalScrollIndicator = false
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 120
        table.register(HotelDescriptionCell.self, forCellReuseIdentifier: HotelDescriptionCell.reuseID)
        table.register(BookingDescriptionCell.self, forCellReuseIdentifier: BookingDescriptionCell.reuseID)
        table.register(BuyerInformationCell.self, forCellReuseIdentifier: BuyerInformationCell.reuseID)
        table.register(TouristInformationCell.self, forCellReuseIdentifier: TouristInformationCell.reuseID)
        table.register(AddTouristCell.self, forCellReuseIdentifier: AddTouristCell.reuseID)
        table.register(PaymentInfoCell.self, forCellReuseIdentifier: PaymentInfoCell.reuseID)
        return table
    }()
    
    
    private let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private var paymentButton: UIButton = .makeBlueButton(title: BookingModel.buttonTitle)
    
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
    
   public func setupView(buttonAction: UITapGestureRecognizer, delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        paymentButton.addGestureRecognizer(buttonAction)
        tableView.dataSource = dataSource
        tableView.delegate = delegate
    }
    
   public func setupData(model: BookingParsingModel?) {
        self.bookingData = model
    }
   public func reloadTable() {
        tableView.reloadData()
    }
    
    private func setupViews() {
        backgroundColor = .systemBackground
        addSubviews(tableView, bottomView)
        bottomView.addSubview(paymentButton)
    }
    
    private func setPaymentButtonTitle(price: Int) {
        let attributes : [NSAttributedString.Key: Any] = [
            .font: HotelModel.standardFont16,
            .foregroundColor: UIColor.white
        ]
        let fullPrice = String(price)
        let attributedTitle = NSAttributedString(string: fullPrice , attributes: attributes)
        paymentButton.setAttributedTitle(attributedTitle, for: .normal)
    }
}
//MARK: - Set constraints
extension BookingView {
    private func setupConstraints() {
        
        //bottomView
        bottomView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(BookingModel.bottomViewHeight)
        }
        paymentButton.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 12, left: 16, bottom: 28, right: 16))
        }
        //tableView
        tableView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(bottomView.snp.top)
        }
        
    }

}
