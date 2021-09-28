//
//  NewsDetailController.swift
//  PracticeTable
//
//  Created by 문다 on 2021/09/29.
//

import UIKit

class NewsDetailController: UIViewController {
    
    @IBOutlet weak var ImageMain: UIImageView!
    @IBOutlet weak var LabelMain: UILabel!
    
    var imageUrl: String?
    var desc: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let img = imageUrl{
            // image를 가져오는 방법은 Data{
            
            if let data = try? Data(contentsOf: URL(string: img)!){
                //Main Thread에서 과정을 진행해주기 위해 :: 동기적으로
                DispatchQueue.main.async {
                    self.ImageMain.image = UIImage(data: data)
                }
            }
        }
        if let d = desc{
            self.LabelMain.text = d
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
