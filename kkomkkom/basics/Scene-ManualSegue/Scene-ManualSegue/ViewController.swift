//
//  ViewController.swift
//  Scene-ManualSegue
//
//  Created by 문다 on 2022/11/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func wind(_ sender: Any) {
        // 세그웨이 실행
        self.performSegue(withIdentifier: "ManualWind", sender: self)
    }
    
}

