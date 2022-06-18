//
//  WeatherViewController.swift
//  wanted_Weather
//
//  Created by 김승찬 on 2022/06/16.
//

import UIKit

class WeatherViewController: BaseViewController {
    
    private let weatherView = WeatherView()
    
    var viewModel = WeatherViewModel(useCase: GetWeatherUseCase(repository: WeatherRepository()))
    
    override func loadView() {
        self.view = weatherView
    }
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setViewConfig() {
        weatherView.tableView.dataSource = self
        weatherView.tableView.delegate = self
    }
    
    override func bind() {
        viewModel.weatherInfo.bind { [weak self] _ in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.weatherView.tableView.reloadData()
            }
        }

        self.viewModel.getCityWeather()
    }
}

extension WeatherViewController {
    private func pushDetailView(item: Weathers) {
          let viewController = WeatherDetailViewController()

        viewController.viewModel.weatherInfo(at: item)
        
          navigationController?.pushViewController(viewController, animated: true)
      }
}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.weatherInfo.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as? WeatherTableViewCell else { return UITableViewCell() }
        
        cell.updateCell(weather: viewModel.weatherInfo.value[indexPath.row])
     
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        pushDetailView(item: viewModel.weatherInfo.value[indexPath.row])
    }
}
