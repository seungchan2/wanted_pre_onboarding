//
//  WeatherDetailViewController.swift
//  wanted_Weather
//
//  Created by 김승찬 on 2022/06/16.
//

import UIKit

final class WeatherDetailViewController: BaseViewController {
    
    var viewModel = WeatherDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func bind() {
        viewModel.weatherDetail.bind { value in
            DispatchQueue.main.async {
                value.forEach {
                    $0.weather.forEach {
                        print($0.icon)
                        print($0.main)
                        print($0.id)
                        print($0.description)
                    }
                }
                
                value.forEach {
                    print($0.main.feels_like)
                    print($0.main.humidity)
                    print($0.main.feels_like)
                    print($0.main.pressure)
                    print($0.main.temp)
                    print($0.main.temp_max)
                    print($0.main.temp_min)
                }
                
                value.forEach {
                    print($0.name)
                    print($0.wind)
                }
            }
        }
    }
}


