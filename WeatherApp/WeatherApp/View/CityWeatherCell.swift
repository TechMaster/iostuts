//
//  CityWeatherCell.swift
//  WeatherApp
//
//  Created by Lucio on 5/21/19.
//  Copyright © 2019 Lucio. All rights reserved.
//

import UIKit

class CityWeatherCell: UICollectionViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var weatherBackgrounImageView: UIImageView!
    @IBOutlet weak var currentDegreeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        descriptionLabel.lineBreakMode = .byWordWrapping
    }

    func configWeather(_ weather: Weather) {
        cityNameLabel.text = weather.cityName
        weatherIconImageView.image = weather.currentWeatherType.weatherIcon
        weatherBackgrounImageView.image = weather.background
        currentDegreeLabel.text = weather.currentWeatherDegree == .c ? "\(weather.currentDegree)° C" : "\(weather.fDegree)° F"
        descriptionLabel.text = weather.currentWeatherType.description
    }
}
