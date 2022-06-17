//
//  SearchWeatherUseCase.swift
//  wanted_Weather
//
//  Created by 김승찬 on 2022/06/18.
//

import Foundation

final class GetWeatherUseCase {
    
    let repository: WeatherRepositoryInterface
    
    init(repository: WeatherRepositoryInterface) {
        self.repository = repository
    }
        
    func getCityWeather(query: String, completion: @escaping (Result<Weathers, NetworkError>) -> Void) {
        repository.getCityWeather(query: query, completion: completion)
     }
}
