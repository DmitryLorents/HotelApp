//
//  HotelViewController.swift
//  HotelApp
//
//  Created by Dmitry on 20.12.2023.
//

import UIKit

final class HotelViewController: UIViewController {
    
    //MARK: - Parameters
   private let hotelView = HotelView()
    private let networkManager = NetworkManager.shared
    private var hotelData: HotelParsingModel? {
        didSet {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(navigationAction))
            hotelView.setupView(model: hotelData, buttonAction: tapGestureRecognizer)
            hotelView.reloadCollectionView()
            hotelView.layoutSubviews()
        }
    }
    
//MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = HotelModel.title
        fetchData()
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
    
    private func fetchData() {
        print(#function)
        networkManager.getHotelData { results in
            switch results {
            case.failure(let error): print(error.localizedDescription)
            case.success(let hotelData): 
                DispatchQueue.main.async{
                    self.hotelData = hotelData
                }
            }
        }
    }
    
    private func setupViews() {
        view = hotelView
        hotelView.transferDelegates(delegate: self, dataSource: self)
        //set navigation action
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(navigationAction))
//        hotelView.setupView(model: nil, buttonAction: tapGestureRecognizer)
    }
    
    @objc private func navigationAction() {
        navigationController?.pushViewController(NumberViewController(), animated: true)
    }
}

extension HotelViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let string = HotelModel.optionsStringArray[indexPath.item]
//        let font = HotelModel.standardFont16
//        let fontAttribute = [NSAttributedString.Key.font: font]
//        let size = string.size(withAttributes: fontAttribute)
//        let extraSpace: CGFloat = 10
//        let width = size.width + extraSpace
//        let height = size.height + 20.0
//        return CGSize(width: width, height: height)
//        
//    }
}

extension HotelViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        hotelData?.aboutTheHotel.peculiarities.count ?? 0//HotelModel.optionsStringArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChipsViewCell.reuseID, for: indexPath) as? ChipsViewCell else {return .init()}
        let peculiarities = hotelData?.aboutTheHotel.peculiarities[indexPath.item] ?? "no data"
        cell.setTitle(title: peculiarities)//HotelModel.optionsStringArray[indexPath.item])
        return cell
    }
    
    
}
