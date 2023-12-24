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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = HotelModel.title
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        hotelView.layoutSubviews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        title = ""
    }

//MARK: - Methods
    
    private func setupViews() {
        view = hotelView
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(navigationAction))
        hotelView.setupView(model: nil, buttonAction: tapGestureRecognizer)
    }
    
    @objc private func navigationAction() {
        print(#function)
        navigationController?.pushViewController(NumberViewController(), animated: true)
    }
}
