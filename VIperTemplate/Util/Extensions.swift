//
//  Extensions.swift
//  ajuste
//
//  Created by Arturo Ortiz on 6/28/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(title:String, message:String) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Aceptar", style: .default, handler: nil))
        alert.modalTransitionStyle = .crossDissolve
        self.present(alert, animated: true, completion: nil)
    }


}

extension UITabBar {
    func customizeTabs(){
        //self.appearance().setBackgroundImage(UIImage.init(named: "snake.png"), for: UIBarPosition.top, barMetrics: .default)
        //self.appearance().shadowImage = UIImage.init(named: "snake.png")
        self.barTintColor = Colors.appSecondaryColor
        self.tintColor = Colors.appPrimaryColor
        self.isTranslucent = false
        self.clipsToBounds = false
        //self.titleTextAttributes = [NSAttributedStringKey.foregroundColor:Colors.appPrimaryColor]
        //self.titleTextAttributes = [NSAttributedStringKey.font:UIFont.init(name: "", size: 20)]
    }
    
    var shadow: Bool {
        get {return false}
        set {
            if newValue {
                self.layer.shadowColor = UIColor.black.cgColor
                self.layer.shadowOffset = CGSize.zero
                self.layer.shadowRadius = 4.0
                self.layer.shadowOpacity = 1.0
                self.layer.masksToBounds = false
            }
        }
    }


}


extension UINavigationBar {
    
    func customizeNavigation(){
        //self.appearance().setBackgroundImage(UIImage.init(named: "snake.png"), for: UIBarPosition.top, barMetrics: .default)
        //self.appearance().shadowImage = UIImage.init(named: "snake.png")
        self.barTintColor = Colors.appSecondaryColor
        self.tintColor = Colors.appPrimaryColor
        self.isTranslucent = false
        self.clipsToBounds = false
        self.titleTextAttributes = [NSAttributedStringKey.foregroundColor:Colors.appPrimaryColor]
        //self.titleTextAttributes = [NSAttributedStringKey.font:UIFont.init(name: "", size: 20)]
    }
    
    var shadow: Bool {
        get {return false}
        set {
            if newValue {
                self.layer.shadowColor = UIColor.black.cgColor
                self.layer.shadowOffset = CGSize.zero
                self.layer.shadowRadius = 4.0
                self.layer.shadowOpacity = 1.0
                self.layer.masksToBounds = false
            }
        }
    }
    
}

extension UserDefaults{
    
    //MARK: Check Login
    func setLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        //synchronize()
    }
    
    func isLoggedIn()-> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    
    //MARK: Save User Data
    func setUserID(value: Int){
        set(value, forKey: UserDefaultsKeys.userID.rawValue)
        //synchronize()
    }
    
    //MARK: Retrieve User Data
    func getUserID() -> Int{
        return integer(forKey: UserDefaultsKeys.userID.rawValue)
    }
}


extension UIView{
    
    func horizontalGradientWith(colorsArray:[CGColor], rect:CGRect, cornerRadius: CGFloat) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = colorsArray
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = rect
        gradient.cornerRadius = cornerRadius
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func verticalGradientWith(colorsArray:[CGColor], rect:CGRect, cornerRadius: CGFloat) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = colorsArray
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = rect
        gradient.cornerRadius = cornerRadius
        
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func animateGradientWith(colors:[CGColor], duration:CFTimeInterval, autoReverses: Bool, repeatCount: Float) {
        let colorChangeAnimation = CABasicAnimation(keyPath: "colors")
        colorChangeAnimation.duration = duration
        colorChangeAnimation.toValue = colors
        colorChangeAnimation.fillMode = kCAFillModeForwards
        colorChangeAnimation.isRemovedOnCompletion = false
        colorChangeAnimation.autoreverses = autoReverses
        colorChangeAnimation.repeatCount = repeatCount
        let sublayers = self.layer.sublayers
        if let onlyLayer = sublayers?.first{
            onlyLayer.add(colorChangeAnimation, forKey: "colorChange")
        }
    }
    
}


extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: thickness)
            break
        case UIRectEdge.bottom:
            border.frame = CGRect(x: 0, y: self.frame.height - thickness, width: self.frame.width, height: thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: self.frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect(x: self.frame.width - thickness, y: 0, width: thickness, height: self.frame.height)
            break
        default:
            break
        }
        

        border.backgroundColor = color.cgColor;
        
        self.insertSublayer(border, at: 0)
    }
    
}

extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        }
    }
}

extension UIButton{
    func underlineText() {
        let textColor = self.titleColor(for: .normal)

        let yourAttributes : [NSAttributedStringKey: Any] = [
            NSAttributedStringKey.foregroundColor : textColor,
            NSAttributedStringKey.underlineStyle : NSUnderlineStyle.styleSingle.rawValue]
        //.styleDouble.rawValue, .styleThick.rawValue, .styleNone.rawValue
        let text = self.title(for: .normal) ?? ""
        let attributeString = NSMutableAttributedString(string:text,
                                                    attributes: yourAttributes)
        self.setAttributedTitle(attributeString, for: .normal)
    }
}

