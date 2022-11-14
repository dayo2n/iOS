//
//  SecondViewController.swift
//  Scene-Trans02
//
//  Created by 문다 on 2022/11/14.
//

import UIKit

class SecondViewController: UIViewController {
    
    /* 화면 전환 방식이 navigation, present의 두가지 방식으로 구현되어 있는데,
     * 이 둘의 화면 전환 방식이 다르기 때문에 되돌아가는 방식도 다르다.
     * 따라서 navigation vc를 통해 화면시에는 navigation back item을 누르거나,
     * 필요에 따라서는 popViewController(_:animated:) 메소드를 호출하여 코드를 작성할 수 있다.
     * present 메소드를 호출하여 전환한 경우는 아래 back()처럼 dismiss()를 호출하여 되돌아갈 수 있다.
     */
    
    @IBAction func back(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
