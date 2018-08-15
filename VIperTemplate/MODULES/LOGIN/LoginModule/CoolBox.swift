//
//  CoolBox.swift
//  VIperTemplate
//
//  Created by Arturo Ortiz on 7/11/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import UIKit

class CoolBox: UIView {

    let iconImage = UIImageView()
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
        self.backgroundColor = Colors.coolBackgroundColor
        
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        iconImage.image = UIImage.init(named: "snake.png")
        self.addSubview(iconImage)
        iconImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        iconImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        iconImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        iconImage.widthAnchor.constraint(equalToConstant: 100).isActive = true

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Iniciar Sesión"
        titleLabel.backgroundColor = Colors.clear
        titleLabel.textColor = Colors.appPrimaryColor
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        self.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 150).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:-10).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
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
//        fieldMail.layer.borderColor = UIColor.black.cgColor
//        fieldMail.layer.borderWidth = 2
        fieldMail.layer.cornerRadius = 25
        fieldMail.backgroundColor = Colors.appPrimaryColor
        fieldMail.textAlignment = .center
        fieldMail.keyboardType = .emailAddress
        fieldMail.placeholder = "mail"
        loginStack.addArrangedSubview(fieldMail)
        
        fieldPass.translatesAutoresizingMaskIntoConstraints = false
//        fieldPass.layer.borderColor = UIColor.black.cgColor
//        fieldPass.layer.borderWidth = 2
        fieldPass.layer.cornerRadius = 25
        fieldPass.backgroundColor = Colors.appPrimaryColor
        fieldPass.textAlignment = .center
        fieldPass.isSecureTextEntry = true
        fieldPass.placeholder = "password"
        loginStack.addArrangedSubview(fieldPass)
        

        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        buttonLogin.layer.cornerRadius = 25
        buttonLogin.setTitle("Iniciar Sesión", for: .normal)
        buttonLogin.setTitleColor(Colors.coolBackgroundColor, for: .normal)
        buttonLogin.backgroundColor = Colors.clear
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
        buttonRegistro.backgroundColor = Colors.clear
        //buttonRegistro.backgroundColor = Colors.ButtonColors.blue
        bottomStack.addArrangedSubview(buttonRegistro)
        
        buttonOlvide.translatesAutoresizingMaskIntoConstraints = false
        buttonOlvide.setTitle("Olvidé mi contraseña", for: .normal)
        buttonOlvide.backgroundColor = Colors.clear
        //buttonOlvide.backgroundColor = Colors.ButtonColors.blue
        bottomStack.addArrangedSubview(buttonOlvide)
        
    }
    
    func setupLayout(){
        // Autolayout
    }
    
    override func layoutSubviews() {
        // layoutSubviews
        
        let colors1 = [Colors.ButtonColors.leftSanke.cgColor, Colors.ButtonColors.rightSnake.cgColor]
        let bounds = buttonLogin.bounds
        buttonLogin.horizontalGradientWith(colorsArray: colors1, rect: bounds, cornerRadius: 25)
//        let colors2 = [Colors.ButtonColors.red.cgColor, Colors.ButtonColors.blue.cgColor]
//        self.buttonLogin.animateGradientWith(colors: colors2, duration: 2.0)
        
    }

}
