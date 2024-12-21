//
//  ViewController.swift
//  HSongPopUpAssistantDemo
//
//  Created by Wanglei on 2024/4/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
    }
    
    let titles = [["成功提示", "失败提示", "警告提示"], ["成功提示", "失败提示", "警告提示"], ["自定义弹窗中", "自定义弹窗底", "自定义弹窗顶"]]
    
    func setUI() {
        self.view.backgroundColor = .white
        
        let space: CGFloat = 10
        let btn_w = (UIConfigure.Width - CGFloat(space) * 4) / 3.0
        let btn_h: CGFloat = 50
        
        for i in 1...3 {
            for j in 1...3 {
                let btn = UIButton()
                btn.frame = CGRect(x: CGFloat(j) * space + btn_w * CGFloat(j - 1), y: 100 + CGFloat(i) * space + CGFloat(i - 1) * btn_h, width: btn_w, height: btn_h)
                btn.tag = i * 10 + j
                btn.backgroundColor = .black
                btn.layer.cornerRadius = 10
                
                let btnName = titles[i - 1][j - 1]
                btn.setTitle(btnName, for: .normal)
                btn.addTarget(self, action: #selector(btnAction(sender:)), for: .touchUpInside)
                self.view.addSubview(btn)
            }
        }
    }
    
    @objc func btnAction(sender: UIButton) {
        switch sender.tag {
        case 11:
            PopUpAssistant.shared.showToast(.success, mainTitle: "成功啦")
        case 12:
            PopUpAssistant.shared.showToast(.fail, mainTitle: "成功之母")
        case 13:
            PopUpAssistant.shared.showToast(.warn, mainTitle: "这是一个警告")
        case 21:
            PopUpAssistant.shared.showToast(.success, mainTitle: "提交成功", subTitle: "提交是真的成功了")
        case 22:
            PopUpAssistant.shared.showToast(.fail, mainTitle: "提交失败", subTitle: "这是也就是失败了，如果没有失败，那一定是成功了")
        case 23:
            PopUpAssistant.shared.showToast(.warn, mainTitle: "系统提示", subTitle: "提示你一定要给我个star哦")
        case 31:
            let centerView = CustomCenterView(frame: CGRect(x: 0, y: 0, width: 300, height: 230))
            centerView.layer.cornerRadius = 15
            PopUpAssistant.shared.showCustomView(centerView, position: .center, useCover: true)
        case 32:
            let centerView = CustomCenterView(frame: CGRect(x: 0, y: 0, width: 300, height: 230))
            centerView.layer.cornerRadius = 15
            PopUpAssistant.shared.showCustomView(centerView, position: .bottom, useCover: true)
        case 33:
            let centerView = CustomCenterView(frame: CGRect(x: 0, y: 0, width: 300, height: 230))
            centerView.layer.cornerRadius = 15
            PopUpAssistant.shared.showCustomView(centerView, position: .top, useCover: true)
        default:
            break
        }
    }
    
}

