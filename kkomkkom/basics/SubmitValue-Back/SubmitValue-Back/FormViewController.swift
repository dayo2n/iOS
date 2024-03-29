//
//  FormViewController.swift
//  SubmitValue-Back
//
//  Created by 문다 on 2022/12/05.
//

import UIKit

class FormViewController: UIViewController {
    @IBOutlet var email: UITextField!
    @IBOutlet var isUpdate: UISwitch!
    @IBOutlet var interval: UIStepper!
    
    @IBAction func onSubmit(_ sender: Any) {
        // presentingViewController 속성을 통해 이전 화면 객체를 읽어온 다음, ViewController 타입으로 캐스팅
//        let prevVC = self.presentingViewController
//        guard let vc = prevVC as? ViewController else { return }
//
//        // 값을 전달
//        vc.paramEmail = self.email.text
//        vc.paramUpdate = self.isUpdate.isOn
//        vc.paramInterval = self.interval.value
        
        
        
//        // get AppDelegate instance
//        let ad = UIApplication.shared.delegate as? AppDelegate
//        
//        // store values
//        ad?.paramEmail = self.email.text
//        ad?.paramUpdate = self.isUpdate.isOn
//        ad?.paramInterval = self.interval.value
//        
//        // 이전 화면으로 복귀
//        self.presentingViewController?.dismiss(animated: true)
        
        
        
        // get UserDefault instance
        let ud = UserDefaults.standard
        
        // store values
        ud.set(self.email.text, forKey: "email")
        ud.set(self.isUpdate.isOn, forKey: "isUpdate")
        ud.set(self.interval.value, forKey: "interval")
        
        // back to previous view
        self.presentingViewController?.dismiss(animated: true)
    }
}
