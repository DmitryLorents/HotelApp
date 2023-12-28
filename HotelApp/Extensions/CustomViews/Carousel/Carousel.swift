//
//  Carousel.swift
//  HotelApp
//
//  Created by Dmitry on 27.12.2023.
//

import UIKit

class Carousel: UIView {
//MARK: - Parameters
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: CarouselLayout())
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: HotelModel.cellID)
        return collectionView
    }()
    var images: [UIImage]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    //MARK: - Init
    
    public init(images: [UIImage]?) {
        self.images = images
        super.init(frame: .zero)
        setView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func setView() {
        self.layer.cornerRadius = HotelModel.buttonCornerRadius
        self.clipsToBounds = true
        addSubviews(collectionView)
    }
    
    private func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

extension Carousel: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotelModel.cellID, for: indexPath)
        //insert ImageView
        guard let images else {return .init()}
        let imageView = UIImageView(image: images[indexPath.item])
        imageView.contentMode = .scaleAspectFill
        cell.addSubviews(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        //imageView.frame = cell.frame
        return cell
    }
    
    
}

extension Carousel: UICollectionViewDelegate {
    
}
