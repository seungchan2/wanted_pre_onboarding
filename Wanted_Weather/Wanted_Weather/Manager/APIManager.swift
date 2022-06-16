//
//  APIManager.swift
//  wanted_Weather
//
//  Created by 김승찬 on 2022/06/16.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case noData
    case decodingError
}

class APIManager {
    
    static let shared = APIManager()
    
    let array: [String] = ["jeju", "seoul"]
    
    var city: String = ""
    
    func getWeather(completion: @escaping (Result<Weather, NetworkError>) -> Void) {
            
        for i in 0..<array.count {
            city = array[i]
        }
            // API 호출을 위한 URL
            let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?appid=65f7dabad2ae1cab0ce9cbef2aea7932&units=metric&q=\(city)&lang=kr")
            guard let url = url else {
                return completion(.failure(.badUrl))
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    return completion(.failure(.noData))
                }
                
                // Data 타입으로 받은 리턴을 디코드
                let weatherResponse = try? JSONDecoder().decode(Weather.self, from: data)

                // 성공
                if let weatherResponse = weatherResponse {
                    print(weatherResponse)
                    completion(.success(weatherResponse)) // 성공한 데이터 저장
                } else {
                    completion(.failure(.decodingError))
                }
            }.resume() // 이 dataTask 시작
        }
    }
    
   
