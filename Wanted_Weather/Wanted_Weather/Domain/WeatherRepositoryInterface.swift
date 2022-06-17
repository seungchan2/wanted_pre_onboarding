//
//  WeatherRepositoryInterface.swift
//  wanted_Weather
//
//  Created by 김승찬 on 2022/06/18.
//

import Foundation

protocol WeatherRepositoryInterface {
    func getCityWeather(query: String, completion: @escaping (Result<Weathers, NetworkError>) -> Void)
}
