//
//  WeatherViewModel.swift
//  wanted_Weather
//
//  Created by 김승찬 on 2022/06/16.
//

import Foundation

protocol WeatherViewModelProtocol {
    func getCityWeather()
}

final class WeatherViewModel: WeatherViewModelProtocol {
    
    private let cities = ["gongju", "gwangju", "gumi", "gunsan", "daegu", "daejeon", "mokpo", "busan", "seosan", "seoul", "sokcho", "suwon", "suncheon", "ulsan", "iksan", "jeonju", "jeju", "cheonan", "cheongju", "chuncheon"]
    
    let useCase: GetWeatherUseCase
    
    var weatherInfo: Observable<[Weathers]> = Observable([])
    
    
    init(useCase: GetWeatherUseCase) {
        self.useCase = useCase
    }
    
    func getCityWeather() {
        for city in cities {
            useCase.getCityWeather(query: city) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let data):
                    print("성공")
                    self.weatherInfo.value += [data]
                case .failure(_):
                    print("실패")
                }
            }
        }
    }
}

