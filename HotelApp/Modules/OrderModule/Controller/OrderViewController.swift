//
//  HotelViewController.swift
//  HotelApp
//
//  Created by Dmitry on 20.12.2023.
//

import UIKit

class OrderViewController: UIViewController {

    //MARK: - Parameters
    let orderView = OrderView()
    
//MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

//MARK: - Methods
    
    private func setupViews() {
        view = orderView
        title = OrderModel.title
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(navigationAction))
        orderView.setupView(buttonAction: tapGestureRecognizer)
    }
    
    @objc private func navigationAction() {
        navigationController?.popToRootViewController(animated: true)
    }
}
