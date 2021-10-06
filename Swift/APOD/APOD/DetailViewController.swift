//
//  DetailViewController.swift
//  APOD
//
//  Created by 문다 on 2021/09/18.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var astronomyImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextField!
    var apod: APOD? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print(apod)
        
        guard let apod = self.apod else { return }
        self.title = apod.title
        titleLabel.text = apod.title
        dateLabel.text = apod.date
        descriptionTextView.text = apod.description
        astronomyImageView.contentMode = .scaleAspectFill
        APIService.fetchData(url: apod.url) { data in
            self.astronomyImageView.image = UIImage(data: data)
        }
    }

}
