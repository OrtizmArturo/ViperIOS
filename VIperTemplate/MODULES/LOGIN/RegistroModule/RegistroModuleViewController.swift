//
//  RegistroModuleViewController.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/5/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation
import UIKit

class RegistroModuleViewController: UIViewController {

    // MARK: Properties

    var presenter: RegistroModulePresentation?

    // MARK: Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "Registro"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.shadow = true

        let backImage = UIImage.init(named: "back.png")
        let barButton = UIBarButtonItem.init(image: backImage,
                                             style: .plain,
                                             target: self,
                                             action: #selector(goBack))
        self.navigationItem.leftBarButtonItem = barButton

    }
    
    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension RegistroModuleViewController: RegistroModuleView {
    // TODO: implement view output methods
}
