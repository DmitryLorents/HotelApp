//
//  ButtonsTableViewCell.swift
//  HotelApp
//
//  Created by Dmitry on 28.12.2023.
//

import UIKit

class ButtonsTableViewCell: UITableViewCell {

    //MARK: - Parameters
    static let reuseID = String(describing: ButtonsTableViewCell.self)
    
    private var titleLabel = UILabel.makeCellsubtitleLabel()
    private var subtitleLabel = UILabel.makeCellTitleLabel()
    private var leftImageView = UIImageView()
    private var rightImageView = UIImageView()
   
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }
    
    //MARK: - Methods
    
    public func setCell(with model: (title: String, subtitle: String, imageName: String)) {
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        leftImageView.image = UIImage(named: model.imageName)
    }
   
    private func setupViews() {
        //backgroundColor = .cyan//.clear
        contentView.backgroundColor = HotelModel.tableViewBackgroundColor
        rightImageView.image = UIImage(systemName: "chevron.right")
        rightImageView.tintColor = .black
        rightImageView.contentMode = .center
        contentView.addSubviews(titleLabel, subtitleLabel, leftImageView, rightImageView)
    }
}
//MARK: - Set constraints
extension ButtonsTableViewCell {
    private func setupConstraints() {
        
        leftImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(15)
            make.height.width.equalTo(24)
        }
        
        rightImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(24)
            make.height.width.equalTo(12)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(leftImageView.snp.trailing).inset(-7)
            make.top.equalToSuperview().inset(15)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).inset(-2)
            make.bottom.equalToSuperview().inset(15)
        }
    }


}
