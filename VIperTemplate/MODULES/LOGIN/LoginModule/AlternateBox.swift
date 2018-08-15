//
//  AlternateBox.swift
//  VIperTemplate
//
//  Created by Arturo Ortiz on 7/11/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import UIKit

class AlternateBox: UIView {

    let titleLabel = UILabel()
    let loginStack = UIStackView()
    let fieldMail = UITextField()
    let fieldPass = UITextField()
    let buttonLogin = UIButton()
    let bottomStack = UIStackView()
    let buttonRegistro = UIButton()
    let buttonOlvide = UIButton()
    
    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupLayout()
    }
    
    required init() {
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    // MARK: Build View hierarchy
    func addSubviews(){
        // addSubviews
        self.backgroundColor = Colors.backgroundColor
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Iniciar\nSesión"
        titleLabel.numberOfLines = 0
        titleLabel.backgroundColor = Colors.ButtonColors.red
        titleLabel.textColor = Colors.appPrimaryColor
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        self.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:-10).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        loginStack.translatesAutoresizingMaskIntoConstraints = false;
        loginStack.axis = .horizontal;
        loginStack.distribution = .fillEqually;
        loginStack.alignment = .fill;
        loginStack.spacing = 10;
        self.addSubview(loginStack)
        loginStack.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:10).isActive = true
        loginStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:-10).isActive = true
        loginStack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        loginStack.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -40).isActive = true
        
        fieldMail.translatesAutoresizingMaskIntoConstraints = false
//        fieldMail.layer.borderColor = UIColor.black.cgColor
//        fieldMail.layer.borderWidth = 2
        fieldMail.textAlignment = .center
        fieldMail.backgroundColor = Colors.appPrimaryColor
        fieldMail.keyboardType = .emailAddress
        fieldMail.placeholder = "mail"
        loginStack.addArrangedSubview(fieldMail)
        
        fieldPass.translatesAutoresizingMaskIntoConstraints = false
//        fieldPass.layer.borderColor = UIColor.black.cgColor
//        fieldPass.layer.borderWidth = 2
        fieldPass.textAlignment = .center
        fieldPass.backgroundColor = Colors.appPrimaryColor
        fieldPass.isSecureTextEntry = true
        fieldPass.placeholder = "password"
        loginStack.addArrangedSubview(fieldPass)
        
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        buttonLogin.setTitle("Iniciar Sesión", for: .normal)
        buttonLogin.backgroundColor = Colors.ButtonColors.red
        self.addSubview(buttonLogin)
        buttonLogin.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonLogin.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:100).isActive = true
        buttonLogin.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:-100).isActive = true
        buttonLogin.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        buttonLogin.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 30).isActive = true
        //loginStack.addArrangedSubview(buttonLogin)
        
        bottomStack.translatesAutoresizingMaskIntoConstraints = false;
        bottomStack.axis = .vertical;
        bottomStack.distribution = .fillEqually;
        bottomStack.alignment = .fill;
        bottomStack.spacing = 10;
        self.addSubview(bottomStack)
        bottomStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        bottomStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:10).isActive = true
        bottomStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:-10).isActive = true
        bottomStack.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        buttonRegistro.translatesAutoresizingMaskIntoConstraints = false
        buttonRegistro.setTitle("Registrarse", for: .normal)
        buttonRegistro.backgroundColor = Colors.ButtonColors.red
        bottomStack.addArrangedSubview(buttonRegistro)
        
        buttonOlvide.translatesAutoresizingMaskIntoConstraints = false
        buttonOlvide.setTitle("Olvidé mi contraseña", for: .normal)
        buttonOlvide.backgroundColor = Colors.ButtonColors.red
        bottomStack.addArrangedSubview(buttonOlvide)
        
    }
    
    func setupLayout(){
        // Autolayout
    }
    
    override func layoutSubviews() {
        // layoutSubviews
    }

}
