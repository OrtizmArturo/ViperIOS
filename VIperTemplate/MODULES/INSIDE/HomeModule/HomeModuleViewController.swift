//
//  HomeModuleViewController.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/5/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation
import UIKit

class HomeModuleViewController: UIViewController {

    // MARK: Properties

    var presenter: HomeModulePresentation?

    // MARK: Lifecycle

    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "INSIDE"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGray
        self.navigationController?.navigationBar.shadow = true
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("INSIDE", for: .normal)
        button.backgroundColor = Colors.ButtonColors.green
        button.addTarget(self, action: #selector(startNavigation), for: .touchUpInside)
        self.view.addSubview(button)
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true

    }
    
    @objc func startNavigation() {
        self.presenter?.startNavigation()
    }

}

extension HomeModuleViewController: HomeModuleView {
    // TODO: implement view output methods
}
