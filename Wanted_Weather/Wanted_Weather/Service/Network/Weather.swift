//
//  Weather.swift
//  Wanted_Weather
//
//  Created by 김승찬 on 2022/06/12.
//

import Foundation

// MARK: - Weather
struct Weather: Decodable {
       let weather: [WeatherModel]
       let main: Main
       let name: String
   }

   struct Main: Decodable {
       let temp: Double
       let humidity: Double
   }

   struct WeatherModel: Decodable {
       let id: Int
       let main: String
       let description: String
       let icon: String
   }
