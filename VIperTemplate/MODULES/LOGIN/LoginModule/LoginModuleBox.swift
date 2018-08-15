//
//  LoginBox.swift
//  VIperTemplate
//
//  Created by Arturo Ortiz on 7/9/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import UIKit

class LoginModuleBox: UIView {
    
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
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Iniciar Sesión"
        titleLabel.backgroundColor = Colors.ButtonColors.blue
        titleLabel.textColor = Colors.appPrimaryColor
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        self.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:-10).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loginStack.translatesAutoresizingMaskIntoConstraints = false;
        loginStack.axis = .vertical;
        loginStack.distribution = .fillEqually;
        loginStack.alignment = .fill;
        loginStack.spacing = 10;
        self.addSubview(loginStack)
        loginStack.heightAnchor.constraint(equalToConstant: 170).isActive = true
        loginStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:10).isActive = true
        loginStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:-10).isActive = true
        loginStack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        loginStack.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -40).isActive = true
        
        fieldMail.translatesAutoresizingMaskIntoConstraints = false
        fieldMail.layer.borderColor = UIColor.black.cgColor
        fieldMail.layer.borderWidth = 2
        fieldMail.textAlignment = .center
        fieldMail.keyboardType = .emailAddress
        fieldMail.placeholder = "mail"
        loginStack.addArrangedSubview(fieldMail)
        
        fieldPass.translatesAutoresizingMaskIntoConstraints = false
        fieldPass.layer.borderColor = UIColor.black.cgColor
        fieldPass.layer.borderWidth = 2
        fieldPass.textAlignment = .center
        fieldPass.isSecureTextEntry = true
        fieldPass.placeholder = "password"
        loginStack.addArrangedSubview(fieldPass)
        
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        buttonLogin.setTitle("Iniciar Sesión", for: .normal)
        buttonLogin.backgroundColor = Colors.ButtonColors.blue
        loginStack.addArrangedSubview(buttonLogin)
        
        bottomStack.translatesAutoresizingMaskIntoConstraints = false;
        bottomStack.axis = .horizontal;
        bottomStack.distribution = .fillEqually;
        bottomStack.alignment = .fill;
        bottomStack.spacing = 10;
        self.addSubview(bottomStack)
        bottomStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        bottomStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:10).isActive = true
        bottomStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:-10).isActive = true
        bottomStack.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        buttonRegistro.translatesAutoresizingMaskIntoConstraints = false
        buttonRegistro.setTitle("Registrarse", for: .normal)
        buttonRegistro.backgroundColor = Colors.ButtonColors.blue
        bottomStack.addArrangedSubview(buttonRegistro)
        
        buttonOlvide.translatesAutoresizingMaskIntoConstraints = false
        buttonOlvide.setTitle("Olvidé mi contraseña", for: .normal)
        buttonOlvide.backgroundColor = Colors.ButtonColors.blue
        bottomStack.addArrangedSubview(buttonOlvide)

    }
    
    func setupLayout(){
        // Autolayout
    }
    
    override func layoutSubviews() {
        // layoutSubviews
    }

}
