//
//  WeatherDetailView.swift
//  wanted_Weather
//
//  Created by 김승찬 on 2022/06/16.
//

import UIKit

class WeatherDetailView: UIView, ViewPresentable {
    
    lazy var weatherImageView = UIImageView()
    
    lazy var tempLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.boldSystemFont(ofSize: 25)
        
        return label
    }()
    
    lazy var separatorView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .gray
        
        return view
    }()
    
    
    lazy var tempMinLabel = UILabel()
    
    lazy var tempMaxLabel = UILabel()
    
    lazy var descriptionLabel = UILabel()
    
    private lazy var tempStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
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
        [weatherImageView, tempLabel, descriptionLabel, tempStackView, separatorView, collectionView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        [tempMaxLabel, tempMinLabel].forEach {
            tempStackView.addArrangedSubview($0)
        }
        
        collectionView.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: "DetailCollectionViewCell")
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        let width = UIScreen.main.bounds.width - spacing * 3
        
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        layout.itemSize = CGSize(width: width / 2, height: width / 2)
        layout.sectionInset = UIEdgeInsets(
            top: spacing,
            left: spacing,
            bottom: spacing,
            right: spacing
        )
        layout.scrollDirection = .vertical
        collectionView.collectionViewLayout = layout
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            weatherImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            weatherImageView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            weatherImageView.widthAnchor.constraint(equalToConstant: 100),
            weatherImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            tempLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            tempLabel.topAnchor.constraint(equalTo: self.weatherImageView.bottomAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: self.tempLabel.bottomAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            tempStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            tempStackView.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: self.tempStackView.bottomAnchor, constant: 10),
            separatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            separatorView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            separatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.separatorView.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
