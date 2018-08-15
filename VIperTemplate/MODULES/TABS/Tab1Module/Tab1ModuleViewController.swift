//
//  Tab1ModuleViewController.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/5/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation
import UIKit

class Tab1ModuleViewController: UIViewController {

    // MARK: Properties

    var presenter: Tab1ModulePresentation?

    // MARK: Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "TAB 1"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Colors.backgroundColor
        self.navigationController?.navigationBar.shadow = true
        
        let leftImage = UIImageView()
        leftImage.image = UIImage(named: "sIcon")
        leftImage.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        leftImage.contentMode = .scaleAspectFit
        let item = UIBarButtonItem.init(customView: leftImage)
        self.navigationItem.leftBarButtonItem = item
        
        let item2 = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = item2

        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Navigate INSIDE", for: .normal)
        button.backgroundColor = Colors.ButtonColors.green
        button.addTarget(self, action: #selector(navigate), for: .touchUpInside)
        self.view.addSubview(button)
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true

    }
    
    @objc func navigate() {
        self.presenter?.navigate()
    }
    
}

extension Tab1ModuleViewController: Tab1ModuleView {
    // TODO: implement view output methods
}
