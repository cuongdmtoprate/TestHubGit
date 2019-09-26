//
//  Custom.swift
//  CustomAnyThink
//
//  Created by ManhCuong on 9/23/19.
//  Copyright © 2019 encodejsc. All rights reserved.
//

import Foundation
import UIKit

// Custom MVButton
class MVButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderColor: CGColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) {
        didSet {
            self.layer.borderColor = borderColor
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
        }
    }
    
// Custom MVUIImageView
class MVUIImageView : UIImageView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderColor: CGColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) {
        didSet {
            self.layer.borderColor = borderColor
        }
    }
    @IBInspectable var borderWidth : CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
}
// Custom MVView
class MVView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderColor: CGColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) {
        didSet {
            self.layer.borderColor = borderColor
        }
    }
    @IBInspectable var borderWidth : CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
}
// Custom MVTextField
class  MVTextField: UITextField {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderColor: CGColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) {
        didSet {
            self.layer.borderColor = borderColor
        }
    }
    @IBInspectable var borderWidth : CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
}
// add bottom line SegmentControl
extension UIImage{
    
    class func getColoredRectImageWith(color: CGColor, andSize size: CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let graphicsContext = UIGraphicsGetCurrentContext()
        graphicsContext?.setFillColor(color)
        let rectangle = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        graphicsContext?.fill(rectangle)
        let rectangleImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return rectangleImage!
    }
}

extension UISegmentedControl{
    func removeBorder(){
        let backgroundImage = UIImage.getColoredRectImageWith(color: UIColor.white.cgColor, andSize: self.bounds.size)
        self.setBackgroundImage(backgroundImage, for: .normal, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .selected, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .highlighted, barMetrics: .default)
        
        let deviderImage = UIImage.getColoredRectImageWith(color: UIColor.white.cgColor, andSize: CGSize(width: 1.0, height: self.bounds.size.height))
        self.setDividerImage(deviderImage, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 67/255, green: 129/255, blue: 244/255, alpha: 1.0)], for: .selected)
    }
    
    func addUnderlineForSelectedSegment(){
        removeBorder()
//        add line background self.bounds.size.width / CGFloat(self.numberOfSegments)
        let bottomlineWidth: CGFloat = self.frame.width
        let bottomlineHight: CGFloat = 3.0
        let bottomlineXPosition = CGFloat(selectedSegmentIndex * Int(bottomlineWidth))
        let bottomlineYPosition = self.bounds.size.height - 1.0
        let bottomlineFrame = CGRect(x: bottomlineXPosition, y: bottomlineYPosition, width: bottomlineWidth, height: bottomlineHight)
        let bottomline = UIView(frame: bottomlineFrame)
        bottomline.backgroundColor = #colorLiteral(red: 0.9058823529, green: 0.9058823529, blue: 0.9058823529, alpha: 1)
//        bottomline.tag = 1
        bottomline.layer.cornerRadius = 6
        self.addSubview(bottomline)
        
//        add line green
        let underlineWidth: CGFloat = self.bounds.size.width / CGFloat(self.numberOfSegments)
        let underlineHeight: CGFloat = 3.0
        let underlineXPosition = CGFloat(selectedSegmentIndex * Int(underlineWidth))
        let underLineYPosition = self.bounds.size.height - 1.0
        let underlineFrame = CGRect(x: underlineXPosition, y: underLineYPosition, width: underlineWidth, height: underlineHeight)
        let underline = UIView(frame: underlineFrame)
        underline.backgroundColor = #colorLiteral(red: 0, green: 0.7347181439, blue: 0.7580738664, alpha: 1)
        underline.tag = 1
        underline.layer.cornerRadius = 6
        self.addSubview(underline)
        let font: [AnyHashable : Any] = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]
        self.setTitleTextAttributes(font as? [NSAttributedString.Key : Any], for: .normal)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.init(red: 0, green: 0.7347181439, blue: 0.7580738664, alpha: 1)], for: .selected)
        self.tintColor = #colorLiteral(red: 0.3411764706, green: 0.4235294118, blue: 0.5411764706, alpha: 1)
    }
    
    func changeUnderlinePosition(){
        guard let underline = self.viewWithTag(1) else {return}
        let underlineFinalXPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(selectedSegmentIndex)
        UIView.animate(withDuration: 0.1, animations: {
            underline.frame.origin.x = underlineFinalXPosition
        })
    }
}

class MVSegment: UISegmentedControl {
    @IBInspectable var addUnderline: Bool = true {
        didSet {
            self.addUnderlineForSelectedSegment()
    }
}

}

//class MVNavigationBarController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let color = #colorLiteral(red: 0, green: 0.7347181439, blue: 0.7580738664, alpha: 1)
//        self.navigationController?.navigationBar.barTintColor = color
//
////        let image = UIImage(named: "logo")
////        let imageView = UIImageView(image: image)
////        imageView.contentMode = .scaleAspectFit
////        navigationItem.titleView = imageView
//    }
//
////    private func imageView(imageName: String) -> UIImageView {
////        let logo = UIImage(named: imageName)
////        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
////        logoImageView.contentMode = .scaleAspectFit
////        logoImageView.image = logo
////        logoImageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
////        logoImageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
////        return logoImageView
////    }
//
////    func barImageView(imageName: String) -> UIBarButtonItem {
////        return UIBarButtonItem(customView: imageView(imageName: imageName))
////    }
//
//    func barButton(imageName: String, selector: Selector) -> UIBarButtonItem {
//        let button = UIButton(type: .custom)
//        button.setImage(UIImage(named: imageName), for: .normal)
//        button.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
//        button.widthAnchor.constraint(equalToConstant: 35).isActive = true
//        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
//        button.addTarget(self, action: selector, for: .touchUpInside)
//        return UIBarButtonItem(customView: button)
//    }
//
//}

// Custom NavigationBar

extension UIViewController {
    func setButtonBarLeft() -> UIBarButtonItem {
        let button: UIButton = UIButton(type: UIButton.ButtonType.custom)
        //set image for button
        button.setImage(UIImage(named: "back"), for: UIControl.State.normal)
        //add function for button
        button.addTarget(self, action: #selector(selectBackButtonOnNavigationBar)
            , for: .touchUpInside)
        //set frame
        
        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        self.navigationItem.leftBarButtonItem = barButton
        return barButton
    }
    @objc func selectBackButtonOnNavigationBar() {
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.popViewController(animated: true)
    }
    func setTitleNavigationBar (text: String) {
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0.7347181439, blue: 0.7580738664, alpha: 1)
//        self.navigationController?.view.backgroundColor =  #colorLiteral(red: 0, green: 0.7347181439, blue: 0.7580738664, alpha: 1)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.title = text
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)]
        
    }
}

// Custom ViewOval

class CustomOvalView: UIView {
    @IBInspectable var cornerRadius: Bool = true {
        didSet {
            self.layer.cornerRadius = 275
        }
    }
}

// multiLanguage
extension UIViewController {
    func setTextMultilaguage(text: String) -> String {
        let value: String
        value = NSLocalizedString(text, comment: "")
        return value
    }
}

// close keyboard
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
