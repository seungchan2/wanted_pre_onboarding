//
//  DetailCollectionViewCell.swift
//  wanted_Weather
//
//  Created by 김승찬 on 2022/06/19.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell, ViewPresentable {
    
    let nameLabel = UILabel()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.boldSystemFont(ofSize: 25)
        
        return label
    }()
    
    override init(frame: CGRect) {
       super.init(frame: frame)
       setupView()
       setupConstraints()
     }

     required init?(coder: NSCoder) {
       fatalError("CollectionViewCell ERROR")
     }
    
    func setupView() {
        contentView.makeRounded(radius: 10)
        contentView.dropShadow()
        contentView.backgroundColor = .white
        
        [nameLabel, subtitleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            subtitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            subtitleLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 8)
        ])
    }
    
    func updateCell(weather: [Weathers], indexPath: IndexPath) {
        weather.forEach { 
            switch indexPath.item {
            case 0 :
                nameLabel.text = "체감 온도"
                subtitleLabel.text = "\($0.main.feels_like)°C"
            case 1 :
                nameLabel.text = "습도"
                subtitleLabel.text = "\($0.main.humidity)%"
            case 2:
                nameLabel.text = "압력"
                subtitleLabel.text = "\($0.main.pressure)hpa"
            case 3:
                nameLabel.text = "바람"
                subtitleLabel.text = "\($0.wind.speed) m/s "
            default:
                nameLabel.text = ""
                subtitleLabel.text = ""
            }
        }
    }
}
