//
//  BaseViewController.swift
//  wanted_Weather
//
//  Created by 김승찬 on 2022/06/16.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setViewConfig()
        bind()
    }
    
    func style() {
        navigationController?.navigationBar.isHidden = false
        view.backgroundColor = .white
    }
    
    func setViewConfig() {}
    
    func bind() {}
}
