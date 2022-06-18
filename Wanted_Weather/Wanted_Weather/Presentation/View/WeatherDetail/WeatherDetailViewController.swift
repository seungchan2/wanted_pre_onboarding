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

        print(viewModel.weatherDetail.value)
        
    }
    

}
