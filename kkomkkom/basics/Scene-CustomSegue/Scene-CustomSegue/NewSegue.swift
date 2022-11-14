//
//  NewSegue.swift
//  Scene-CustomSegue
//
//  Created by 문다 on 2022/11/14.
//

import UIKit

class NewSegue: UIStoryboardSegue {
    override func perform() {
        // segue's source VC
        let srcUVC = self.source
        
        // segue's destination VC
        let destUVC = self.destination
        
        // change view from fromView to toView
        UIView.transition(from: srcUVC.view, to: destUVC.view, duration: 2, options: .transitionCurlDown)
    }
}
