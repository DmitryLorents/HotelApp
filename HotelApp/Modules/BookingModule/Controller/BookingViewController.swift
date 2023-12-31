//
//  HotelViewController.swift
//  HotelApp
//
//  Created by Dmitry on 20.12.2023.
//

import UIKit

class BookingViewController: UIViewController {
    
    //MARK: - Parameters
    private  let bookingView = BookingView()
    private let networkManager = NetworkManager.shared
    private var bookingData: BookingParsingModel? {
        didSet {
            bookingView.setupData(model: bookingData)
        }
    }
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //set title
        title = BookingModel.title
        fetchData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bookingView.layoutSubviews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        title = ""
    }
    
    //MARK: - Methods
    
    private func fetchData() {
        networkManager.getBookingData { result in
            switch result {
            case .failure(let error): print(error.localizedDescription)
            case.success(let bookingData):
                DispatchQueue.main.async{
                    print("Booking data downloaded:", bookingData)
                    self.bookingData = bookingData
                }
            }
        }
    }
    
    private func setupViews() {
        view = bookingView
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(navigationAction))
        bookingView.setupView(buttonAction: tapGestureRecognizer, delegate: self, dataSource: self)
    }
    
    @objc private func navigationAction() {
        navigationController?.pushViewController(OrderViewController(), animated: true)
    }
}
//MARK: - UITableViewDelegate
extension BookingViewController: UITableViewDelegate {
    
}
//MARK: - UITableViewDataSource
extension BookingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0: guard let cell = tableView.dequeueReusableCell(withIdentifier: HotelDescriptionCell.reuseID, for: indexPath) as? HotelDescriptionCell else {return .init()}
            cell.setCellData(model: bookingData)
            return cell
        case 1: guard let cell = tableView.dequeueReusableCell(withIdentifier: BookingDescriptionCell.reuseID, for: indexPath) as? BookingDescriptionCell else {return .init()}
            cell.setCellData(model: bookingData)
            return cell
        case 2: guard let cell = tableView.dequeueReusableCell(withIdentifier: BuyerInformationCell.reuseID, for: indexPath) as? BuyerInformationCell else {return .init()}
            return cell
        case 3: guard let cell = tableView.dequeueReusableCell(withIdentifier: TouristInformationCell.reuseID, for: indexPath) as? TouristInformationCell else {return .init()}
            return cell
        case 4: guard let cell = tableView.dequeueReusableCell(withIdentifier: AddTouristCell.reuseID, for: indexPath) as? AddTouristCell else {return .init()}
            return cell
        case 5: guard let cell = tableView.dequeueReusableCell(withIdentifier: PaymentInfoCell.reuseID, for: indexPath) as? PaymentInfoCell else {return .init()}
            cell.setCellData(model: bookingData)
            return cell
        default : guard let cell = tableView.dequeueReusableCell(withIdentifier: HotelDescriptionCell.reuseID, for: indexPath) as? HotelDescriptionCell else {return .init()}
            return cell
        }
    }
    
    
}
