//
//  ViewController.swift
//  Delegate-ImagePicker
//
//  Created by 문다 on 2023/01/06.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var imgView: UIImageView!
    
    @IBAction func pick(_ sender: Any) {
        // create ImagePicker Instance
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary // 이미지 소스로 사진 라이브러리 선택
        picker.allowsEditing = true // 이미지 편집 기능 on
        
        // designate delegate
        picker.delegate = self
        
        // ImagePicker Controller 실행
        self.present(picker, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // image picker에서 이미지를 선택하지 않고 취소했을 때 호출되는 메소드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // image picker 창 닫기
        // 피커 창이 조금 늦게 닫히고 그동안 알림창 구문이 호출되어 알림창이 실행되지 않는 버그를 방지해 completion 핸들러에 알림창 호출 로직을 작성
        // 가독성을 해치지 않기 위해 trailing closure 문법을 사용
        picker.dismiss(animated: false) { () in
            // 알림창 호출
            let alert = UIAlertController(title: "", message: "이미지 선택이 취소되었습니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel))
            self.present(alert, animated: false)
        }
    }
    
    // image picker에서 이미지를 선택했을 때 호출되는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: false) { () in
            // 이미지를 imgView에 표시
            let img = info[.editedImage] as? UIImage
            self.imgView.image = img
        }
    }
}

