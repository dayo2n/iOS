//
//  ViewController.swift
//  Scene-Trans02
//
//  Created by 문다 on 2022/11/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveByNavi(_ sender: Any) {
        // 두번째 VC 인스턴스를 가져온다
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else { return }
        
        // 화면을 전환한다
        self.navigationController?.pushViewController(uvc, animated: true)
    }
    
    // navigation vc가 추가된 상태에서 Present()를 사용해 화면전환하면 두번째 VC에 네비게이션 바가 추가될까?
    @IBAction func movePresent(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else { return }
        
        self.present(uvc, animated: true)
    }
}

