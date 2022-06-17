//
//  WeatherView.swift
//  wanted_Weather
//
//  Created by 김승찬 on 2022/06/16.
//

import UIKit

class WeatherView: UIView, ViewPresentable {
   
    lazy var weatherLabel: UILabel = {
        lazy var weatherLabel = UILabel()
        
        return weatherLabel
    }()
    
    lazy var collectionView: UICollectionView = {
        lazy var collectionView = UICollectionView()
        
        return collectionView
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
        
    }
    
    func setupConstraints() {
        
    }
}
