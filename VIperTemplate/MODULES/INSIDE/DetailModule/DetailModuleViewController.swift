//
//  DetailModuleViewController.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/5/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation
import UIKit

class DetailModuleViewController: UIViewController {

    // MARK: Properties

    var presenter: DetailModulePresentation?

    // MARK: Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "INSIDE DETAIL"
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .gray
        self.navigationController?.navigationBar.shadow = true
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("POP", for: .normal)
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

extension DetailModuleViewController: DetailModuleView {
    // TODO: implement view output methods
}
