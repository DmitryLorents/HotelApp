//
//  HotelView.swift
//  HotelApp
//
//  Created by Dmitry on 20.12.2023.
//

import UIKit

class HotelView: UIView {

    //MARK: - Parameters
    
    private let firstView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = HotelModel.viewCornerRadius
        return view
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
    
    //MARK: - Methods
    private func setupViews() {
        backgroundColor = HotelModel.backgroundColor
        addSubview(firstView)
    }
    
    private func setupConstraints() {
        
    }
}
