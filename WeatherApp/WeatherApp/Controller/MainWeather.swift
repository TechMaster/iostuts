//
//  MainWeather.swift
//  WeatherApp
//
//  Created by Lucio on 5/21/19.
//  Copyright © 2019 Lucio. All rights reserved.
//

import UIKit

class MainWeather: UIViewController {

    @IBOutlet weak var weathercitiesCollectionView: UICollectionView!

    @IBOutlet weak var pagerTracking: UIPageControl!

    var weatherCities = [Weather("New York", currentDegree: 32, background: #imageLiteral(resourceName: "Background-3"), currentWeatherType: .sun),
                         Weather("San Francisco", currentDegree: 28, background: #imageLiteral(resourceName: "Background-2"), currentWeatherType: .rain),
                         Weather("Los Angeles", currentDegree: 36, background: #imageLiteral(resourceName: "Background-1"), currentWeatherType: .storm)]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configCollectionViewLayout()
        configCollectionViewDatasource()
    }

    fileprivate func configPager() {
        pagerTracking.currentPage = 0
        pagerTracking.numberOfPages = weatherCities.count
    }

    fileprivate func configCollectionViewDatasource() {
        weathercitiesCollectionView.register(UINib(nibName: "CityWeatherCell", bundle: nil), forCellWithReuseIdentifier: "CityWeatherCell")
        weathercitiesCollectionView.dataSource = self
        weathercitiesCollectionView.delegate = self
    }

    fileprivate func configCollectionViewLayout() {
        weathercitiesCollectionView.isPagingEnabled = true

        guard let weatherCitiesLayout = weathercitiesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }

        weatherCitiesLayout.itemSize = self.view.bounds.size
        weatherCitiesLayout.minimumInteritemSpacing = 0
        weatherCitiesLayout.minimumLineSpacing = 0
        weatherCitiesLayout.scrollDirection = .horizontal
    }

    @IBAction func onConvertDegree(_ sender: UIButton) {
        guard let currentDisplayWeather = weathercitiesCollectionView.visibleCells.first as? CityWeatherCell, let currentCityWeatherIndex = weathercitiesCollectionView.indexPath(for: currentDisplayWeather) else {
            return
        }

        let cityWeather = weatherCities[currentCityWeatherIndex.item]
        cityWeather.changeDegreeWeatherType()
        weathercitiesCollectionView.reloadItems(at: [currentCityWeatherIndex])
    }

}

extension MainWeather: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherCities.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let weatherCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityWeatherCell", for: indexPath) as? CityWeatherCell else { return UICollectionViewCell() }

        weatherCell.configWeather(weatherCities[indexPath.item])

        return weatherCell
    }

}

extension MainWeather: UICollectionViewDelegate {

}

extension MainWeather: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.view.bounds.size
    }
}

extension MainWeather {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width / 2

        pagerTracking.currentPage = Int(offSet + horizontalCenter) / Int(width)    
    }

}
