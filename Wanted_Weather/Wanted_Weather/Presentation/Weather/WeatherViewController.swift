//
//  WeatherViewController.swift
//  Wanted_Weather
//
//  Created by 김승찬 on 2022/06/11.
//

import UIKit

final class WeatherViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        APIManager.shared.getWeather  { result in
            switch result {
            case .success(let weatherResponse):
                print(weatherResponse)
            case .failure(_ ):
                print("error")
            }
        }
    }
}
