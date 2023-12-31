//
//  BookingParsingModel.swift
//  HotelApp
//
//  Created by Dmitry on 30.12.2023.
//

import Foundation

// MARK: - BookingParsingModel
struct BookingParsingModel: Codable {
    let id: Int
    let hotelName, hotelAdress: String
    let horating: Int
    let ratingName, departure, arrivalCountry, tourDateStart: String
    let tourDateStop: String
    let numberOfNights: Int
    let room, nutrition: String
    let tourPrice, fuelCharge, serviceCharge: Int
    var fullPrice: Int { tourPrice + fuelCharge + serviceCharge}
    
    func getTextBy(index: Int) -> String{
        switch index {
        case 0: return String(tourPrice)
        case 1: return String(fuelCharge)
        case 2: return String(serviceCharge)
        case 3: return String(fullPrice)
        default: return "Invalid index"
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case hotelName = "hotel_name"
        case hotelAdress = "hotel_adress"
        case horating
        case ratingName = "rating_name"
        case departure
        case arrivalCountry = "arrival_country"
        case tourDateStart = "tour_date_start"
        case tourDateStop = "tour_date_stop"
        case numberOfNights = "number_of_nights"
        case room, nutrition
        case tourPrice = "tour_price"
        case fuelCharge = "fuel_charge"
        case serviceCharge = "service_charge"
    }
}

//{
//  "id": 1,
//  "hotel_name": "Лучший пятизвездочный отель в Хургаде, Египет",
//  "hotel_adress": "Madinat Makadi, Safaga Road, Makadi Bay, Египет",
//  "horating": 5,
//  "rating_name": "Превосходно",
//  "departure": "Москва",
//  "arrival_country": "Египет, Хургада",
//  "tour_date_start": "19.09.2023",
//  "tour_date_stop": "27.09.2023",
//  "number_of_nights": 7,
//  "room": "Люкс номер с видом на море",
//  "nutrition": "Все включено",
//  "tour_price": 289400,
//  "fuel_charge": 9300,
//  "service_charge": 2150
//}
