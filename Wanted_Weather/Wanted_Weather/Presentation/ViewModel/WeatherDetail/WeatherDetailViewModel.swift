//
//  WeatherDetailViewModel.swift
//  wanted_Weather
//
//  Created by 김승찬 on 2022/06/16.
//

import Foundation

final class WeatherDetailViewModel {
   
        
    var weatherDetail: Observable<[Weathers]> = Observable([])
    
    func weatherInfo(at index: Weathers) {
        weatherDetail.value += [index]
    }
}

