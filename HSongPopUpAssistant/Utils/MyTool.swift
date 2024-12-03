//
//  MyTool.swift
//  HSongPopUpAssistant
//
//  Created by 王雷好帅哦 on 2024/12/3.
//

import Foundation

extension UIView {
    func setX(_ x: CGFloat) {
        var frame = self.frame
        frame.origin.x = x
        self.frame = frame
    }
    func setY(_ y: CGFloat) {
        var frame = self.frame
        frame.origin.y = y
        self.frame = frame
    }
}
