//
//  Weather.swift
//  WeatherApp
//
//  Created by Lucio on 5/21/19.
//  Copyright © 2019 Lucio. All rights reserved.
//

import Foundation
import UIKit

enum CurrentWeatherType {
    case rain
    case sun
    case storm
    case cloud

    var weatherIcon: UIImage {
        switch self {
        case .rain:
            return #imageLiteral(resourceName: "Rain")
        case .sun:
            return #imageLiteral(resourceName: "Clear sky")
        case .storm:
            return #imageLiteral(resourceName: "Thunderstorms")
        case .cloud:
            return #imageLiteral(resourceName: "Few clouds")
        }
    }

    var description: String {
        switch self {
        case .rain:
            return "Trời mưa, các bạn nhớ mang áo mưa khi ra đường nhé"
        case .sun:
            return "Hôm nay là 1 ngày trời nắng đẹp, hãy bắt đầu ngày mới theo cách tuyệt vời nhất nhé"
        case .storm:
            return "Giông bão, mọi người hạn chế ra đường và nhớ di chuyển thật cẩn thận nhé"
        case .cloud:
            return "Trời nhiều mây, không mưa, tầm nhìn xa 10km 😁 😁 😁 😁 😁"
        }
    }
}

enum CurrentWeatherDegree {
    case c, f
}

class Weather {

    var cityName: String
    var currentWeatherType: CurrentWeatherType = .sun
    var currentDegree: Float = 0.0
    var currentWeatherDegree: CurrentWeatherDegree = .c
    var background: UIImage

    var fDegree: Float {
        return currentDegree * 9 / 5 + 32
    }

    init(_ cityName: String, currentDegree: Float, background: UIImage, currentWeatherType: CurrentWeatherType) {
        self.cityName = cityName
        self.currentDegree = currentDegree
        self.background = background
        self.currentWeatherType = currentWeatherType
    }

    func changeDegreeWeatherType() {
        if currentWeatherDegree == .c {
            currentWeatherDegree = .f
        } else {
            currentWeatherDegree = .c
        }
    }

}
