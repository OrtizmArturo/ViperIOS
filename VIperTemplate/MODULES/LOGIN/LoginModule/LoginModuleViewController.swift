//
//  LoginModuleViewController.swift
//  ajuste
//
//  Created by Arturo Ortiz on 7/4/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation
import UIKit

class LoginModuleViewController: UIViewController {

    // MARK: Properties

    var presenter: LoginModulePresentation?
    
    //let viewBox = LoginModuleBox()
    //let viewBox = AlternateBox()
    //let viewBox = CoolBox()
    let viewBox = DifferentBox()

    // MARK: Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "TAB1"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.shadow = true
        
        viewBox.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(viewBox)
        viewBox.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        viewBox.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        viewBox.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        viewBox.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true

        viewBox.fieldMail.delegate = self
        viewBox.fieldPass.delegate = self
        viewBox.buttonLogin.addTarget(self, action: #selector(login), for: .touchUpInside)
        viewBox.buttonRegistro.addTarget(self, action: #selector(registro), for: .touchUpInside)
        viewBox.buttonOlvide.addTarget(self, action: #selector(olvidePass), for: .touchUpInside)
        
    }
    

}


extension LoginModuleViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension LoginModuleViewController: LoginModuleView {
    // TODO: implement view output methods
    @objc func login() {
        UIView.animate(withDuration: 0.2, animations: {
            self.viewBox.buttonLogin.transform = CGAffineTransform.identity.scaledBy(x: 1.3, y: 1.3)
        }, completion: { restult in
            UIView.animate(withDuration: 0.2, animations: {
                self.viewBox.buttonLogin.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
            }, completion: { result in
                self.presenter?.login()
            })
        })
    }
    
    @objc func registro() {
        UIView.animate(withDuration: 0.2, animations: {
            self.viewBox.buttonRegistro.transform = CGAffineTransform.identity.scaledBy(x: 1.3, y: 1.3)
        }, completion: { restult in
            UIView.animate(withDuration: 0.2, animations: {
                self.viewBox.buttonRegistro.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
            }, completion: { result in
                self.presenter?.registro()
            })
        })
    }
    
    @objc func olvidePass() {
        UIView.animate(withDuration: 0.2, animations: {
            self.viewBox.buttonOlvide.transform = CGAffineTransform.identity.scaledBy(x: 1.3, y: 1.3)
        }, completion: { restult in
            UIView.animate(withDuration: 0.2, animations: {
                self.viewBox.buttonOlvide.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
            }, completion: { result in
                self.presenter?.olvidePass()
            })
        })
    }

}
