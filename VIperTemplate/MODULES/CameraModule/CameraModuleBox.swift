//
//  CameraModuleBox.swift
//  VIperTemplate
//
//  Created by Arturo Ortiz on 7/12/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import UIKit

class CameraModuleBox: UIView {

    let cameraView = UIView()
    let marco = UIView()
    let viewmid = UIView()

    let thumbOriginal = UIImageView()
    let thumb = UIImageView()
    let btnTakePhoto = UIButton()
    let btngetText = UIButton()
    let mileage = UITextField()

    let blur1 = UIView()
    let blur2 = UIView()
    let blur3 = UIView()
    let blur4 = UIView()

    let brightSlider = UISlider()
    let conSlider = UISlider()

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
        self.backgroundColor = Colors.appPrimaryColor
        
        cameraView.translatesAutoresizingMaskIntoConstraints = false
        cameraView.backgroundColor = Colors.backgroundColor
        self.addSubview(cameraView)
        cameraView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        cameraView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        cameraView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        cameraView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        let topGroup = UIStackView()
        topGroup.translatesAutoresizingMaskIntoConstraints = false;
        topGroup.axis = .vertical;
        topGroup.distribution = .fill;
        topGroup.alignment = .fill;
        topGroup.spacing = 10;
        self.addSubview(topGroup)
        topGroup.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        topGroup.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        topGroup.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        topGroup.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive = true

        mileage.translatesAutoresizingMaskIntoConstraints = false
        mileage.backgroundColor = Colors.appPrimaryColor
        mileage.textAlignment = .center
        mileage.keyboardType = .numberPad
        mileage.placeholder = "KM"
        mileage.font = UIFont.systemFont(ofSize: 20)
        mileage.layer.shadowColor = UIColor.black.cgColor
        mileage.layer.shadowOffset = CGSize.init(width: -1, height: 1)
        mileage.layer.shadowRadius = 4.0
        mileage.layer.shadowOpacity = 1.0
        mileage.layer.masksToBounds = false
        topGroup.addArrangedSubview(mileage)
        mileage.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        mileage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
//        mileage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
//        mileage.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true

        viewmid.translatesAutoresizingMaskIntoConstraints = false;
        viewmid.backgroundColor = .clear
        topGroup.addArrangedSubview(viewmid)
        viewmid.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        marco.translatesAutoresizingMaskIntoConstraints = false
        marco.backgroundColor = Colors.clear
        marco.layer.borderColor = UIColor.white.cgColor
        marco.layer.borderWidth = 4
        viewmid.addSubview(marco)
        marco.widthAnchor.constraint(equalToConstant: 250).isActive = true
        marco.heightAnchor.constraint(equalToConstant: 70).isActive = true
        marco.centerXAnchor.constraint(equalTo: viewmid.centerXAnchor, constant: 0).isActive = true
        marco.centerYAnchor.constraint(equalTo: viewmid.centerYAnchor, constant: 0).isActive = true

        let viewP = UIView()
        viewP.translatesAutoresizingMaskIntoConstraints = false;
        viewP.backgroundColor = .clear
        topGroup.addArrangedSubview(viewP)
        viewP.heightAnchor.constraint(equalToConstant: 90).isActive = true

        thumbOriginal.translatesAutoresizingMaskIntoConstraints = false
        thumbOriginal.backgroundColor = .blue
        thumbOriginal.contentMode = .scaleAspectFit
        thumbOriginal.layer.borderColor = UIColor.white.cgColor
        thumbOriginal.layer.borderWidth = 4
        viewP.addSubview(thumbOriginal)
        thumbOriginal.widthAnchor.constraint(equalToConstant: 250).isActive = true
        thumbOriginal.heightAnchor.constraint(equalToConstant: 70).isActive = true
        thumbOriginal.centerXAnchor.constraint(equalTo: viewP.centerXAnchor, constant: 0).isActive = true
        thumbOriginal.centerYAnchor.constraint(equalTo: viewP.centerYAnchor, constant: 0).isActive = true

        let viewN = UIView()
        viewN.translatesAutoresizingMaskIntoConstraints = false;
        viewN.backgroundColor = .clear
        topGroup.addArrangedSubview(viewN)
        viewN.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        thumb.translatesAutoresizingMaskIntoConstraints = false
        thumb.backgroundColor = .blue
        thumb.contentMode = .scaleAspectFit
        thumb.layer.borderColor = UIColor.white.cgColor
        thumb.layer.borderWidth = 4
        viewN.addSubview(thumb)
        thumb.widthAnchor.constraint(equalToConstant: 250).isActive = true
        thumb.heightAnchor.constraint(equalToConstant: 70).isActive = true
        thumb.centerXAnchor.constraint(equalTo: viewN.centerXAnchor, constant: 0).isActive = true
        thumb.centerYAnchor.constraint(equalTo: viewN.centerYAnchor, constant: 0).isActive = true

        let viewE = UIView()
        viewE.translatesAutoresizingMaskIntoConstraints = false;
        topGroup.addArrangedSubview(viewE)

//        thumb.widthAnchor.constraint(equalToConstant: 300).isActive = true
//        thumb.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        thumb.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
//        thumb.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -30).isActive = true

       
//        blur1.translatesAutoresizingMaskIntoConstraints = false
//        blur1.backgroundColor = Colors.blurColor
//        self.addSubview(blur1)
//        blur1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
//        blur1.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
//        blur1.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
//        blur1.bottomAnchor.constraint(equalTo: marco.topAnchor, constant: 0).isActive = true
//
//        blur2.translatesAutoresizingMaskIntoConstraints = false
//        blur2.backgroundColor = Colors.blurColor
//        self.addSubview(blur2)
//        blur2.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
//        blur2.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
//        blur2.topAnchor.constraint(equalTo: marco.bottomAnchor, constant: 0).isActive = true
//        blur2.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
//
//        blur3.translatesAutoresizingMaskIntoConstraints = false
//        blur3.backgroundColor = Colors.blurColor
//        self.addSubview(blur3)
//        blur3.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
//        blur3.widthAnchor.constraint(equalToConstant: 60).isActive = true
//        blur3.topAnchor.constraint(equalTo: blur1.bottomAnchor, constant: 0).isActive = true
//        blur3.bottomAnchor.constraint(equalTo: blur2.topAnchor, constant: 0).isActive = true
//
//        blur4.translatesAutoresizingMaskIntoConstraints = false
//        blur4.backgroundColor = Colors.blurColor
//        self.addSubview(blur4)
//        blur4.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
//        blur4.widthAnchor.constraint(equalToConstant:60).isActive = true
//        blur4.topAnchor.constraint(equalTo: blur1.bottomAnchor, constant: 0).isActive = true
//        blur4.bottomAnchor.constraint(equalTo: blur2.topAnchor, constant: 0).isActive = true

        
//        thumb.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
//        thumb.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true

        btnTakePhoto.translatesAutoresizingMaskIntoConstraints = false
        btnTakePhoto.backgroundColor = .red
        btnTakePhoto.setTitle("P", for: .normal)
        self.addSubview(btnTakePhoto)
        btnTakePhoto.widthAnchor.constraint(equalToConstant: 50).isActive = true
        btnTakePhoto.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btnTakePhoto.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        btnTakePhoto.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true

        btngetText.translatesAutoresizingMaskIntoConstraints = false
        btngetText.backgroundColor = .red
        btngetText.setTitle("T", for: .normal)
        self.addSubview(btngetText)
        btngetText.widthAnchor.constraint(equalToConstant: 50).isActive = true
        btngetText.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btngetText.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 80).isActive = true
        btngetText.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true


//        brightSlider.translatesAutoresizingMaskIntoConstraints = false
//        brightSlider.minimumValue = -1.0
//        brightSlider.maximumValue = 1.0
//        brightSlider.value = 0
//        self.addSubview(brightSlider)
//        brightSlider.widthAnchor.constraint(equalToConstant: 300).isActive = true
//        brightSlider.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        brightSlider.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
//        brightSlider.topAnchor.constraint(equalTo: thumb.bottomAnchor, constant: 30).isActive = true
//
//        conSlider.translatesAutoresizingMaskIntoConstraints = false
//        conSlider.minimumValue = -2.0
//        conSlider.maximumValue = 2.0
//        conSlider.value = 0
//        self.addSubview(conSlider)
//        conSlider.widthAnchor.constraint(equalToConstant: 300).isActive = true
//        conSlider.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        conSlider.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
//        conSlider.topAnchor.constraint(equalTo: brightSlider.bottomAnchor, constant: 30).isActive = true

        
    }
    
    func setupLayout(){
        // Autolayout
    }
    
//    override func layoutSubviews() {
//        // layoutSubviews
//    }

}
