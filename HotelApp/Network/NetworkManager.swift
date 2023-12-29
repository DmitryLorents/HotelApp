//
//  NetworkManager.swift
//  HotelApp
//
//  Created by Dmitry on 20.12.2023.
//

import UIKit

enum ParsingErrors: Error {
    case decodingProblem
    
}

final class  NetworkManager {
    //MARK: - Singletone
    static let shared = NetworkManager()
    private init() {}
    
    //MARK: - Parameters
    private(set) var urlString: String!
    private let decoder = JSONDecoder()
    
    //MARK: - Methods
    private func getData <T: Codable> (urlString: String, parseProtocol: T.Type, completion: @escaping (Result<T, Error>) -> () ) {
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            
            guard let self else { return }
            guard let downloadedData = data, error == nil else {
                completion(.failure(error!))
                return}
            
            
            guard let parsedData = try? self.decoder.decode(parseProtocol, from: downloadedData) else {
                
                completion(.failure(ParsingErrors.decodingProblem))
                return}
            completion(.success(parsedData))
        }.resume()
    }
    
    func getHotelData(completion: @escaping (Result<HotelParsingModel, Error>) -> () ) {
        let urlString = "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473"
        getData(urlString: urlString, parseProtocol: HotelParsingModel.self, completion: completion)
    }
    
    func imageFromURL(_ URLString: String) -> UIImage? {
        var image: UIImage?
        //If imageurl's imagename has space then this line going to work for this
        let imageServerUrl = URLString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        if let url = URL(string: imageServerUrl) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, _, error) in
                
                if error != nil {
                    DispatchQueue.main.async {
                       image = UIImage(systemName: "photo")
                    }
                    return
                }
                DispatchQueue.main.async {
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                            image = downloadedImage
                        }
                    }
                }
            }).resume()
        }
        return image
    }
}
