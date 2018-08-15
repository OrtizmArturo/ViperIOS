//
//  Tab3ModuleViewController.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/5/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation
import UIKit

class Tab3ModuleViewController: UIViewController {

    // MARK: Properties

    var presenter: Tab3ModulePresentation?

    // MARK: Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "TAB 3"
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
        
        let item2 = UIBarButtonItem.init(barButtonSystemItem: .camera, target: self, action: #selector(openCamera))
        self.navigationItem.rightBarButtonItem = item2
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cerrar Sesión", for: .normal)
        button.backgroundColor = Colors.ButtonColors.green
        button.addTarget(self, action: #selector(logout), for: .touchUpInside)
        self.view.addSubview(button)
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true


    }
    
    @objc func logout() {
        self.presenter?.logout()
    }

    @objc func openCamera() {
        self.presenter?.openCamera()
    }

}

extension Tab3ModuleViewController: Tab3ModuleView {
    // TODO: implement view output methods
}
