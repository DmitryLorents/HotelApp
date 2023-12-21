//
//  HotelViewController.swift
//  HotelApp
//
//  Created by Dmitry on 20.12.2023.
//

import UIKit

class HotelViewController: UIViewController {
    
    //MARK: - Parameters
    let hotelView = HotelView()
    
//MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        hotelView.layoutSubviews()
    }

//MARK: - Methods
    
    private func setupViews() {
        view = hotelView
        title = HotelModel.title
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(navigationAction))
        hotelView.setupView(model: nil, buttonAction: tapGestureRecognizer)
    }
    
    @objc private func navigationAction() {
        print(#function)
        navigationController?.pushViewController(NumberViewController(), animated: true)
    }
}
