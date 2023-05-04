//
//  Weather.swift
//  List
//
//  Created by Tu Le C. [2] VN.Danang on 27/04/2023.
//

import Foundation

struct Weather: Identifiable {
    
    enum WeatherStatus {
        case sun
        case rain
        case cloud
    }
    
    var id = UUID()
    var city: String
    var country: String
    var temperature: Int
    var status: WeatherStatus
    
    func getStatusString() -> String {
        switch status {
        case .sun:
            return "sun"
        case .rain:
            return "rain"
        case .cloud:
            return "cloud"
        }
    }
    
    static func dummyData() -> [Weather] {
        return [
            Weather(city: "Đà Nẵng", country: "Việt Nam", temperature: 30, status: .sun),
            Weather(city: "Tam Kỳ", country: "Việt Nam", temperature: 28, status: .cloud),
            Weather(city: "Hà Nội", country: "Việt Nam", temperature: 33, status: .rain),
            Weather(city: "Hồ Chí Minh", country: "Việt Nam", temperature: 27, status: .sun),
            Weather(city: "Nha Trang", country: "Việt Nam", temperature: 20, status: .cloud),
            Weather(city: "Vũng Tàu", country: "Việt Nam", temperature: 30, status: .cloud),
            Weather(city: "Hải Phòng", country: "Việt Nam", temperature: 31, status: .sun)
        ]
    }
}
