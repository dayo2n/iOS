//
//  ViewController.swift
//  SubmitValue-Back
//
//  Created by 문다 on 2022/12/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var resultInterval: UILabel!
    @IBOutlet var resultUpdate: UILabel!
    @IBOutlet var resultEmail: UILabel!
    
    var paramEmail: String?
    var paramUpdate: Bool?
    var paramInterval: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        if let email = paramEmail { resultEmail.text = email }
//        if let update = paramUpdate { resultUpdate.text = update ? "자동 갱신" : "자동 갱신하지 않음" }
//        if let interval = paramInterval { resultInterval.text = "\(Int(interval))분마다" }
        
        
        
        // get AppDelegate instance
        let ad = UIApplication.shared.delegate as? AppDelegate

        if let email = ad?.paramEmail { resultEmail.text = email }
        if let update = ad?.paramUpdate { resultUpdate.text = update ? "자동 갱신" : "자동 갱신하지 않음" }
        if let interval = ad?.paramInterval { resultInterval.text = "\(Int(interval))분마다"}
        
        
        
    }

}

