//
//  ChipsViewCell.swift
//  HotelApp
//
//  Created by Dmitry on 27.12.2023.
//

import UIKit

class ChipsViewCell: UICollectionViewCell {
    //MARK: - Parameters
    static let reuseID = String(describing: ChipsViewCell.self)
    
    private lazy var backgroundCellView: UIView = {
        let view = UIView()
        view.backgroundColor = HotelModel.tableViewBackgroundColor
        view.layer.cornerRadius = HotelModel.chipsCornerRadius
        return view
    }()
    private let titleLabel: UILabel = .makeCellTitleLabel()
    

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
    
    public func setTitle(title: String) {
        titleLabel.text = title
    }

    private func setupViews() {
        backgroundColor = .clear
        contentView.addSubview(backgroundCellView)
        backgroundCellView.addSubview(titleLabel)
    }
}
//MARK: - Set constraints
extension ChipsViewCell {
    private func setupConstraints() {
        
        backgroundCellView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5))
        }
    }
}
