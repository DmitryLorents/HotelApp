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
    
    func getNumberData(completion: @escaping (Result<NumberParsingModel, Error>) -> () ) {
        let urlString = "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195"
        getData(urlString: urlString, parseProtocol: NumberParsingModel.self, completion: completion)
    }
    
    func getBookingData(completion: @escaping (Result<BookingParsingModel, Error>) -> () ) {
        let urlString = "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff"
        getData(urlString: urlString, parseProtocol: BookingParsingModel.self, completion: completion)
    }

}

