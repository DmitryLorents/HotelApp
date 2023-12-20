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

//MARK: - Methods
    
    private func setupViews() {
        view = hotelView
        hotelView.backgroundColor = .cyan
        title = HotelModel.title
    }
}
