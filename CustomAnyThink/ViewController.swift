//
//  ViewController.swift
//  CustomAnyThink
//
//  Created by ManhCuong on 9/23/19.
//  Copyright © 2019 encodejsc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    let underLineS = NSUnderlineStyle.single.rawValue
    
    @IBOutlet weak var bltRegisterNow: MVButton!
    @IBOutlet weak var lblNoAccount: UILabel!
    @IBOutlet weak var bltLogin: MVButton!
    @IBOutlet weak var tfEnterPassword: MVTextField!
    @IBOutlet weak var tfEnterPhoneNumber: MVTextField!
    @IBOutlet weak var bltForgotPassword: UIButton!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.setButtonBarLeft()
        self.setTitleNavigationBar(text: self.setTextMultilaguage(text: "bltLogin"))
        self.lblPhoneNumber.text = self.setTextMultilaguage(text: "lbl_phoneNumber")
        self.tfEnterPhoneNumber.placeholder = self.setTextMultilaguage(text: "tf_Enter_mobile_number")
        self.lblPassword.text = self.setTextMultilaguage(text: "lbl_password/otp_code")
        self.tfEnterPassword.placeholder = self.setTextMultilaguage(text: "tf_Enter_password/otp_code")
//        self.bltForgotPassword.setTitle(self.setTextMultilaguage(text: "blt_Forgot_password"), for: .normal)
        self.bltLogin.setTitle(self.setTextMultilaguage(text: "bltLogin"), for: .normal)
        self.lblNoAccount.text = self.setTextMultilaguage(text: "lbl_no_account")
//        self.bltRegisterNow.setTitle(self.setTextMultilaguage(text: "blt_Register_now"), for: .normal)
        self.segmentControl.setTitle(self.setTextMultilaguage(text: "tag1_segment_mobile_subscription"), forSegmentAt: 0)
        self.segmentControl.setTitle(setTextMultilaguage(text: "tag2_segment_fixed_account"), forSegmentAt: 1)
        self.bltRegisterNow.setAttributedTitle(NSAttributedString(string: self.setTextMultilaguage(text: "blt_Register_now"), attributes:
            [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
            NSAttributedString.Key.underlineColor: #colorLiteral(red: 0, green: 0.7347181439, blue: 0.7580738664, alpha: 1),
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0.7347181439, blue: 0.7580738664, alpha: 1)]), for: .normal)
        self.bltForgotPassword.setAttributedTitle(NSAttributedString(string: self.setTextMultilaguage(text: "blt_Forgot_password"), attributes:
            [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue ,
             NSAttributedString.Key.underlineColor: #colorLiteral(red: 0, green: 0.7347181439, blue: 0.7580738664, alpha: 1),
             NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0.7347181439, blue: 0.7580738664, alpha: 1)]), for: .normal)
    
    
    }
    
    @IBAction func onSegmentControl(_ sender: UISegmentedControl) {
                self.segmentControl.changeUnderlinePosition()
    }
    
    @IBAction func onLogin(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HomePrePayViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
