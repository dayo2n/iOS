//
//  SignupViewController.swift
//  ViewSystem
//
//  Created by 문다 on 2021/09/15.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var birthDatePicker: UIDatePicker!
    
    //segue를 할때 호출되는 함수. 데이터를 전달해주는 시점이 될 것!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 세그웨의 목적지를 레드뷰컨트롤러 타입으로 캐스팅 :: 원래 이렇게하면 안돼 이유는 알아서 공부해보기 ,,,,
        let redViewController = segue.destination as! RedViewController
        // 유저객체를 생성하면서 데이터 전달해주기
        redViewController.user = User(name: nameTextField.text!, gender: User.Gender(rawValue: genderSegmentedControl.selectedSegmentIndex)!, birthDay: birthDatePicker.date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}
