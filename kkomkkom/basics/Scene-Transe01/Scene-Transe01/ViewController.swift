//
//  ViewController.swift
//  Scene-Transe01
//
//  Created by 문다 on 2022/11/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveNext(_ sender: Any) {
        // 이동할 VC 객체를 Storyboard ID 정보를 이용해 참조
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else { return }
        
        // 화면 전환할 때의 애니메이션 타입
        uvc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        
        // 인자값으로 VC 인스턴스를 넣고 present() 호출
        self.present(uvc, animated: true)
    }
}

