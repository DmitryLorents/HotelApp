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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bookingView.layoutSubviews()
    }

//MARK: - Methods
    
    private func setupViews() {
        view = bookingView
        title = BookingModel.title
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(navigationAction))
        bookingView.setupView(model: nil, buttonAction: tapGestureRecognizer)
    }
    
    @objc private func navigationAction() {
        navigationController?.pushViewController(OrderViewController(), animated: true)
    }
}
