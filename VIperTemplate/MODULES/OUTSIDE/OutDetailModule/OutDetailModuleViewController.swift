//
//  OutDetailModuleViewController.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/5/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation
import UIKit

class OutDetailModuleViewController: UIViewController {

    // MARK: Properties

    var presenter: OutDetailModulePresentation?

    // MARK: Lifecycle

    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "OUTSIDE DETAIL"
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
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("POP", for: .normal)
        button.backgroundColor = Colors.ButtonColors.red
        button.addTarget(self, action: #selector(popNavigation), for: .touchUpInside)
        self.view.addSubview(button)
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
    }
    
    @objc func popNavigation() {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        self.presenter?.popNavigation()
    }

    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension OutDetailModuleViewController: OutDetailModuleView {
    // TODO: implement view output methods
}
