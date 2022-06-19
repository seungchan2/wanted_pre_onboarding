//
//  WeatherDetailViewController.swift
//  wanted_Weather
//
//  Created by 김승찬 on 2022/06/16.
//

import UIKit

final class WeatherDetailViewController: BaseViewController {
    
    private let detailView = WeatherDetailView()
    
    var viewModel = WeatherDetailViewModel()
    
    override func loadView() {
        self.view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setViewConfig() {
        detailView.collectionView.delegate = self
        detailView.collectionView.dataSource = self
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
             image: UIImage(systemName: "chevron.backward"),
             style: .plain,
             target: self,
             action: #selector(backButtonClicked)
           )
           navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    override func bind() {
        viewModel.weatherDetail.bind { value in
            DispatchQueue.main.async {
                self.detailView.collectionView.reloadData()
                value.forEach {
                    $0.weather.forEach {
                        self.detailView.weatherImageView.getImageFromURL($0.icon)
                        self.detailView.descriptionLabel.text = $0.description
                    }
                }
                
                value.forEach {
                    self.detailView.tempLabel.text = "\($0.main.temp)°C"
                    self.detailView.tempMinLabel.text = "최소: \($0.main.temp_min)°C"
                    self.detailView.tempMaxLabel.text = "최대: \($0.main.temp_max)°C"
                }
                
                value.forEach {
                    self.title = $0.name
                }
            }
        }
    }
}

extension WeatherDetailViewController {
    @objc func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
}

extension WeatherDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCollectionViewCell", for: indexPath) as? DetailCollectionViewCell else { return UICollectionViewCell() }
        
        cell.updateCell(weather: viewModel.weatherDetail.value, indexPath: indexPath)
        
        return cell
    }
}
