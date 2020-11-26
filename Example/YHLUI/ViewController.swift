//
//  ViewController.swift
//  YHLUI
//
//  Created by 272789124@qq.com on 10/30/2020.
//  Copyright (c) 2020 272789124@qq.com. All rights reserved.
//

import UIKit
import YHLCore
import RxSwift
class ViewController: UIViewController, TTTTextFieldDelegate {
    @IBOutlet weak var txt: TTTTelTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.txt.cdelegate = self
        // Do any additional setup after loading the view.
    }


    @IBAction func btnClick(_ sender: Any) {
        YHLNavigator.shared.push(URLUI.animation.CAShapLayer)
    }
}


@objc protocol TTTTextFieldDelegate {
    @objc optional func gw_textFieldDidBeginEditing(textField: UITextField)
    @objc optional func gw_textFieldDidEndEditing(textField: UITextField)
    @objc optional func gw_textFieldShouldReturn(_ textField: UITextField) -> Bool
    @objc optional func gw_textField(textField: UITextField,range: NSRange, string: String) -> Bool
}

extension TTTTextFieldDelegate {
    func gw_textFieldDidEndEditing(textField: UITextField){
        
    }
}

class TTTTelTextField: UITextField, UITextFieldDelegate {
    var isFormat = true
    weak var cdelegate: TTTTextFieldDelegate?
    var textRange: UITextRange?
    var inputType = 0
    var i: Int = 0
    var gw_text: String? {
        return self.text?.replacingOccurrences(of: " ", with: "")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup() {
//        self.keyboardType = .numberPad
        self.delegate = self
//        NotificationCenter.default.addObserver(self, selector: #selector(self.textFieldChange(not:)), name: NSNotification.Name.UITextFieldTextDidChange, object: self)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func setFormat(v:Bool) {
        self.isFormat=v
        if v == true {
//            NotificationCenter.default.addObserver(self, selector: #selector(self.textFieldChange(not:)), name: NSNotification.Name.UITextFieldTextDidChange, object: self)
        } else {
            NotificationCenter.default.removeObserver(self)
        }
    }
    
    @objc func textFieldChange(not:NSNotification) {
        let t = text ?? ""
        if t.count > i {
            if (t.count == 3 || t.count == 8 ) {//输入
                var str = t
                str.append(" ")
                self.text = str
            }
            if t.count >= 13 {//输入完成
                self.text = text?.gw_substring(start: 0, length: 13)
            }
            i = text?.count ?? 0
            
        } else if t.count < i {//删除
            if t.count == 3 || t.count == 8 {
                text = t.gw_substring(start: 0, length: t.count-1)
            }
            i = text?.count ?? 0
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         _ = self.cdelegate?.gw_textFieldShouldReturn?(textField)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.cdelegate?.gw_textFieldDidEndEditing?(textField: textField)
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        self.cdelegate?.gw_textFieldDidBeginEditing?(textField: textField)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        _ = self.cdelegate?.gw_textField?(textField: self, range: range, string: string)

        if (self.isFormat) {
            //回车
            if (range.length > 0) {
                inputType = 1
            } else {
                inputType = 0
            }
            
            if (textField.text?.appending(string).count)! > 13 {
                return false
            }
            if ((range.location-range.length)>12&&range.location>0) {
                return false
            }
        } else {
            if (textField.text?.appending(string).count)! > 11 {
                return false
            }
            if ((range.location-range.length)>11&&range.location>0) {
                return false
            }
        }
        
        return true
    }
}

extension TTTTelTextField {
    /// 是否是手机号码
    func isPhone() -> Bool {
        if self.gw_text?.count != 11 {
            return false
        }
        
        if !(self.gw_text?.hasPrefix("1"))! {
            return false
        }
        
        if (self.gw_text?.hasPrefix("11"))! {
            return false
        }
        
        return true
    }
}
