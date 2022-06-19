//
//  WeatherRepository.swift
//  wanted_Weather
//
//  Created by 김승찬 on 2022/06/18.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case noData
    case decodingError
}

class WeatherRepository: WeatherRepositoryInterface {
    
    static let shared = WeatherRepository()
    
    private let apiKey: String = Bundle.main.apiKey
    
    func getCityWeather(query: String, completion: @escaping (Result<Weathers, NetworkError>) -> Void) {
    
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?appid=\(apiKey)&units=metric&q=\(query)&lang=kr") else { return }
        
        let session = URLSession(configuration: .default)
              session.dataTask(with: url) { data, response, error in
                  guard let data = data, error == nil else { return }
                  let decoder = JSONDecoder()
                  
                  guard let weatherResponse = try? decoder.decode(Weathers.self, from: data)
                   else { return }
                  completion(.success(weatherResponse))
              }.resume()
    }
}
