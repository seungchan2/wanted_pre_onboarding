//
//  WeatherTableViewCell.swift
//  wanted_Weather
//
//  Created by 김승찬 on 2022/06/18.
//

import UIKit

class WeatherTableViewCell: UITableViewCell, ViewPresentable {
    
    let weatherImageView: UIImageView = {
        let weatherImageView = UIImageView()
        
        return weatherImageView
        
    }()
    
    
    let cityLabel: UILabel = {
        let cityLabel = UILabel()
        
        cityLabel.text = "도시명"
        
        return cityLabel
    }()
    
    let tempLabel: UILabel = {
        let tempLabel = UILabel()
        
        tempLabel.text = "온도"
        
        return tempLabel
    }()
    
    let humidityLabel: UILabel = {
        let humidityLabel = UILabel()
        
        humidityLabel.text = "습도"
        
        return humidityLabel
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
            weatherImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            weatherImageView.heightAnchor.constraint(equalTo: weatherImageView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            cityLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            cityLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            tempLabel.topAnchor.constraint(equalTo: self.cityLabel.bottomAnchor, constant: 8),
            tempLabel.trailingAnchor.constraint(equalTo: self.humidityLabel.leadingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            humidityLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            humidityLabel.topAnchor.constraint(equalTo: self.cityLabel.bottomAnchor, constant: 8)
        ])
    }
    
    func updateCell(weather: Weathers) {
        
        cityLabel.text = weather.name
        
     
        
    }
}

