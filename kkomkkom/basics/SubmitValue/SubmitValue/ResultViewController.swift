//
//  ResultViewController.swift
//  SubmitValue
//
//  Created by 문다 on 2022/12/05.
//

import UIKit

class ResultViewController: UIViewController {
    // 화면에 값을 표시하는데 사용될 레이블
    @IBOutlet var resultEmail: UILabel! // 이메일
    @IBOutlet var resultUpdate: UILabel! // 자동갱신 여부
    @IBOutlet var resultInterval: UILabel! // 갱신주기
    
    var paramEmail: String = "" // email 값을 받을 변수
    var paramUpdate: Bool = false
    var paramInterval: Double = 0.0
    
    override func viewDidLoad() {
        self.resultEmail.text = self.paramEmail
        self.resultUpdate.text = (self.paramUpdate ? "자동 갱신" : "자동 갱신하지 않음")
        self.resultInterval.text = "\(Int(self.paramInterval))분마다 갱신"
    }
    
    @IBAction func onBack(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
