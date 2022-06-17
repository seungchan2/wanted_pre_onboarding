//
//  WeatherView.swift
//  wanted_Weather
//
//  Created by 김승찬 on 2022/06/16.
//

import UIKit

class WeatherView: UIView, ViewPresentable {
   
    lazy var tableView: UITableView = {
        lazy var tableView = UITableView()
        
        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: "WeatherTableViewCell")
        tableView.separatorInset.left = 15
        tableView.separatorInset.right = 15
        tableView.rowHeight = 120
        
        return tableView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
             tableView.topAnchor.constraint(equalTo: self.topAnchor),
             tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
             tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
             tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
           ])
    }
}
