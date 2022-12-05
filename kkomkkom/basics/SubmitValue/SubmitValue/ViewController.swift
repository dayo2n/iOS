//
//  ViewController.swift
//  SubmitValue
//
//  Created by 문다 on 2022/12/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var email: UITextField! // 이메일 주소를 입력받는 텍스트 필드
    @IBOutlet var isUpdate: UISwitch! // 자동 갱신 여부를 설정하는 스위치
    @IBOutlet var interval: UIStepper! // 갱신 주기를 설정하는 스테퍼
    
    @IBOutlet var isUpdateText: UILabel! // 자동갱신 여부를 표시하는 레이블
    @IBOutlet var intervalText: UILabel! // 갱신 주기를 텍스트로 표시하는 레이블
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // 자동 갱신 여부가 바뀔 때마다 호출되는 메소드
    @IBAction func onSwitch(_ sender: UISwitch) {
        self.isUpdateText.text = sender.isOn ? "갱신함" : "갱신하지 않음"
    }
    
    // 갱신주기가 바뀔 때마다 호출되는 메소드
    @IBAction func onStepper(_ sender: UIStepper) {
        self.intervalText.text = "\(Int(sender.value))분마다"
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        // create instance of VC2
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else { return }
        // code for delivery values
        rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
        
        // 일반 버튼으로 화면 전환
//        self.present(rvc, animated: true)
        
        // 네비게이션 컨트롤러에서 화면 전환
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 목적지 VC instance 참조
        let dst = segue.destination
        
        guard let rvc = dst as? ResultViewController else { return }
        
        // 값 전달
        rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
    }
    
    @IBAction func onPerformSegue(_ sender: Any) {
        self.performSegue(withIdentifier: "ManualSubmit", sender: self)
        // 값을 전달하는 코드는 "세그웨 실행을 위한 준비 메소드 prepare(for:sender:) 부분에 값을 전달해준다"
    }
}

