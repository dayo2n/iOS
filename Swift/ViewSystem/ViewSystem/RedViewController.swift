//
//  RedViewController.swift
//  ViewSystem
//
//  Created by 문다 on 2021/09/15.
//

import UIKit

class RedViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    var user: User? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let user = user else { return }
        nameLabel.text = user.name
        idLabel.text = String(describing: user.id)
        genderLabel.text = user.gender.description
        birthdayLabel.text = String(describing: user.birthDay)
    }

}
