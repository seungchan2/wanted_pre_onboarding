//
//  WeatherTableViewCell.swift
//  wanted_Weather
//
//  Created by 김승찬 on 2022/06/18.
//

import UIKit

class WeatherTableViewCell: UITableViewCell, ViewPresentable {
    
    let weatherImageView = UIImageView()
    
    
    let cityLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.boldSystemFont(ofSize: 25)
        
        return label
    }()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()
    
    let humidityLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupView() {
        [weatherImageView, cityLabel, tempLabel , humidityLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            weatherImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            weatherImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            weatherImageView.widthAnchor.constraint(equalToConstant: 100),
            weatherImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            cityLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            cityLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            tempLabel.topAnchor.constraint(equalTo: self.cityLabel.bottomAnchor, constant: 8),
            tempLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            humidityLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            humidityLabel.topAnchor.constraint(equalTo: self.tempLabel.bottomAnchor, constant: 8)
        ])
    }
    
    func updateCell(weather: Weathers) {
        cityLabel.text = weather.name
        tempLabel.text = "현재 온도 : \(weather.main.temp)°C"
        humidityLabel.text = "습도: \(weather.main.humidity)%"
        
        if let imageURL = weather.weather.first?.icon {
            weatherImageView.getImageFromURL(imageURL)
          }
    }
}
