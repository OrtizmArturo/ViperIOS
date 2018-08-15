//
//  DifferentBox.swift
//  VIperTemplate
//
//  Created by Arturo Ortiz on 7/12/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import UIKit

class DifferentBox: UIView {

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
        self.backgroundColor = Colors.differentBackgroundColor
        
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
        titleLabel.font = UIFont.boldSystemFont(ofSize: 12)
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
        loginStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:50).isActive = true
        loginStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:-50).isActive = true
        loginStack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        loginStack.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -40).isActive = true
        
        fieldMail.translatesAutoresizingMaskIntoConstraints = false
        //fieldMail.layer.borderColor = UIColor.black.cgColor
        //fieldMail.layer.borderWidth = 2
        fieldMail.textColor = Colors.appPrimaryColor
        fieldMail.autocapitalizationType = .none
        fieldMail.textAlignment = .center
        fieldMail.keyboardType = .emailAddress
        fieldMail.placeholder = "mail"
        fieldMail.placeHolderColor = Colors.placeholderColor
        loginStack.addArrangedSubview(fieldMail)
        
        fieldPass.translatesAutoresizingMaskIntoConstraints = false
//        fieldPass.layer.borderColor = UIColor.black.cgColor
//        fieldPass.layer.borderWidth = 2
        //fieldPass.placeHolderColor = Colors.appPrimaryColor
        fieldPass.textColor = Colors.appPrimaryColor
        fieldPass.autocapitalizationType = .none
        fieldPass.textAlignment = .center
        fieldPass.isSecureTextEntry = true
        fieldPass.placeholder = "password"
        fieldPass.placeHolderColor = Colors.placeholderColor
        loginStack.addArrangedSubview(fieldPass)
        
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        buttonLogin.setTitle("Iniciar Sesión", for: .normal)
        buttonLogin.backgroundColor = Colors.ButtonColors.loginBlack
        loginStack.addArrangedSubview(buttonLogin)
        
        bottomStack.translatesAutoresizingMaskIntoConstraints = false;
        bottomStack.axis = .vertical;
        bottomStack.distribution = .fillEqually;
        bottomStack.alignment = .fill;
        bottomStack.spacing = 10;
        self.addSubview(bottomStack)
        bottomStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        bottomStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:10).isActive = true
        bottomStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:-10).isActive = true
        bottomStack.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        buttonOlvide.translatesAutoresizingMaskIntoConstraints = false
        buttonOlvide.setTitle("Olvidé mi contraseña", for: .normal)
        buttonOlvide.backgroundColor = Colors.clear
        buttonOlvide.underlineText()
        bottomStack.addArrangedSubview(buttonOlvide)

        buttonRegistro.translatesAutoresizingMaskIntoConstraints = false
        buttonRegistro.setTitle("Registrarse", for: .normal)
        buttonRegistro.backgroundColor = Colors.clear
        buttonRegistro.underlineText()
        bottomStack.addArrangedSubview(buttonRegistro)
        
        
//        let labelString = "Underline Label"
//        let textColor: UIColor = .blue
//        let underLineColor: UIColor = .red
//        let underLineStyle = NSUnderlineStyle.styleSingle.rawValue
//
//        let labelAtributes:[NSAttributedStringKey : Any]  = [
//            NSAttributedStringKey.foregroundColor: textColor,
//            NSAttributedStringKey.underlineStyle: underLineStyle,
//            NSAttributedStringKey.underlineColor: underLineColor
//        ]
//
//        let underlineAttributedString = NSAttributedString(string: labelString,
//                                                           attributes: labelAtributes)
//
//        buttonRegistro.titleLabel?.attributedText = underlineAttributedString

    }
    
    func setupLayout(){
        // Autolayout
    }
    
    override func layoutSubviews() {
        // layoutSubviews
        fieldMail.layer.addBorder(edge: .bottom, color: UIColor.white, thickness: 1)
        fieldPass.layer.addBorder(edge: .bottom, color: UIColor.white, thickness: 1)

        let colors1 = [UIColor.lightGray.cgColor, Colors.differentBackgroundColor.cgColor]
        let colors2 = [Colors.differentBackgroundColor.cgColor, UIColor.lightGray.cgColor]
        self.verticalGradientWith(colorsArray: colors1, rect: self.bounds, cornerRadius: 0)
        self.animateGradientWith(colors: colors2, duration: 5.0, autoReverses: true, repeatCount: .infinity)
    }

}
