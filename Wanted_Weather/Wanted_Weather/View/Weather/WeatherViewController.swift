//
//  WeatherViewController.swift
//  wanted_Weather
//
//  Created by 김승찬 on 2022/06/16.
//

import UIKit

class WeatherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        APIManager.shared.getWeather { _ in
            print("1")
        }
        view.backgroundColor = .white
    }
 

}
