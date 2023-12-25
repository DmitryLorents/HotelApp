//
//  HotelViewController.swift
//  HotelApp
//
//  Created by Dmitry on 20.12.2023.
//

import UIKit

class BookingViewController: UIViewController {

    //MARK: - Parameters
    let bookingView = BookingView()
    
//MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //set title
        title = BookingModel.title
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
    
    private func setupViews() {
        view = bookingView
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(navigationAction))
        bookingView.setupView(model: nil, buttonAction: tapGestureRecognizer, delegate: self, dataSource: self)
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
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0: guard let cell = tableView.dequeueReusableCell(withIdentifier: HotelDescriptionCell.reuseID, for: indexPath) as? HotelDescriptionCell else {return .init()}
            return cell
        case 1: guard let cell = tableView.dequeueReusableCell(withIdentifier: BookingDescriptionCell.reuseID, for: indexPath) as? BookingDescriptionCell else {return .init()}
            return cell
        case 2: guard let cell = tableView.dequeueReusableCell(withIdentifier: BuyerInformationCell.reuseID, for: indexPath) as? BuyerInformationCell else {return .init()}
            return cell
        case 3: guard let cell = tableView.dequeueReusableCell(withIdentifier: TouristInformationCell.reuseID, for: indexPath) as? TouristInformationCell else {return .init()}
            return cell
        default : guard let cell = tableView.dequeueReusableCell(withIdentifier: HotelDescriptionCell.reuseID, for: indexPath) as? HotelDescriptionCell else {return .init()}
            return cell
        //default: return .init()
        }
    }
    
    
}
