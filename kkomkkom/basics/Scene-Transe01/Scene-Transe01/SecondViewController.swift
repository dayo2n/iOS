//
//  SecondViewController.swift
//  Scene-Transe01
//
//  Created by 문다 on 2022/11/14.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBAction func back(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
