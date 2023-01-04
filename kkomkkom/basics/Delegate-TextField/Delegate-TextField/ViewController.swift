//
//  ViewController.swift
//  Delegate-TextField
//
//  Created by 문다 on 2023/01/04.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var tf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 택스트 필드 속성 설정
        tf.placeholder = "값을 입력하세요."
        tf.keyboardType = .alphabet
        tf.keyboardAppearance = .dark
        tf.returnKeyType = .join
        tf.enablesReturnKeyAutomatically = true
        
        // 스타일 설정
        // 테두리 스타일 - 직선
        tf.borderStyle = .line
        // 배경 색상
        tf.backgroundColor = UIColor(white: 0.87, alpha: 1.0)
        // 수직 방향으로 텍스트가 가운데 정렬되도록
        tf.contentVerticalAlignment = .center
        // 수평 방향으로 텍스트가 가운데 정렬되도록
        tf.contentHorizontalAlignment = .center
        // 테두리 색상을 회색으로
        tf.layer.borderColor = UIColor.darkGray.cgColor
        // 테두리 두께 설정 (단위: pt)
        tf.layer.borderWidth = 2.0
        
        // 텍스트필드를 최초 응답자로 지정
        tf.becomeFirstResponder()
        
        // 델리게이트 지정
        tf.delegate = self
    }
    
    @IBAction func input(_ sender: Any) {
        // 텍스트필드를 최초 응답자로 지정
        tf.becomeFirstResponder()
    }
    
    @IBAction func confirm(_ sender: Any) {
        // 텍스트필드를 최초 응답자 객체에서 해제
        tf.resignFirstResponder()
    }
    
    // 편집을 시작할 때
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("텍스트필드의 편집이 시작됩니다.")
        return true
        // false를 리턴하면 편집되지 않음.
    }
    
    // 편집이 시작된 후
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("텍스트필드의 편집이 시작되었습니다.")
    }
    
    // 내용이 삭제될 때
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("contents will removed")
        return true // false를 리턴하면 삭제되지 않음
    }
    
    // 내용이 변경될 때
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print("텍스트필드의 내용이 \(string)으로 변경됩니다.")
//        return true
        
        // 숫자는 입력할 수 없도록 차단
//        return Int(string) == nil ? true : false
        
        // 숫자 입력 차단 + 입력 길이 10으로 제한
        if let _ = Int(string) {
            return false
        } else {
            // 현재 텍스트필드의 길이 + 더해질 문자열 길이의 합이 10을 넘으면 반영 X
            if (textField.text?.count)! + string.count > 10 {
                return false
            } else {
                return true
            }
        }
    }
    
    // 리턴키가 눌렸을 때
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("pressed return key")
        return true
    }
    
    // 편집이 종료될 떼
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("will end editing")
        return true
    }
    
    // 편집이 종료되었을 때
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("did end editing")
    }
}

