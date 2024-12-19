//
//  CountdownAlertView.swift
//  eHighSpeed
//
//  Created by Wanglei on 2023/9/1.
//  Copyright © 2023 SDGS. All rights reserved.
//

import UIKit

/// 倒计时弹窗
class CountdownAlertView: UIView {
        
    //MARK: - 声明区
    //-----UI-----
    var coverView = UIView()
    var titLab = UILabel()
        .size15
        .colorThree
        .weightMedium
        .hiText(text: "提示")
    var closeBtn = UIButton()
        .hiImgNormal(imgName: "app_close")
    var contLab = UITextView()
//        .size14
//        .colorSix
////        .canManyLines
//        .textCenter
    var countdownBtn = UIButton()
        .size13
        .titleColorCustomForNormal(.white)
        .bgColorTheme
        .hiCorner(cornerNum: UIConfigure.SizeScale * 20)

    var timer: Timer?
    //-----Block-----
    var enterBlock: ((_ isAuto: Bool) -> Void)?
    var closeBlock: (() -> Void)?
    //-----Data-----
    /* 外部参数(从外部传入的数据) */
    var countdownTime = 0 {
        didSet {
            countdownBtn.setTitle("\(countdownBtnName)\(countdownTime)s", for: .normal)
            if self.timer == nil {
                self.timer = Timer(timeInterval: 1, target: self, selector: #selector(self.startCountdown), userInfo: nil, repeats: true)
                RunLoop.main.add(self.timer!, forMode: .common)
            }
        }
    }
    var countdownBtnName = "正在跳转"
    /* 内部参数(从接口获取的数据以及其他内部数据) */
    var content_h = UIConfigure.SizeScale * 80
    //MARK: - 逻辑区
    func setUI() {
        
        self.backgroundColor = .white
        self.cornerRadiu = UIConfigure.SizeScale * 8
        
        self.addSubview(titLab)
        titLab.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(UIConfigure.SizeScale * 20)
        }
        
        self.addSubview(closeBtn)
        closeBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(titLab)
            make.right.equalTo(UIConfigure.SizeScale * -20)
            make.size.equalTo(UIConfigure.SizeScale * 30)
        }
        closeBtn.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        
        self.addSubview(contLab)
        contLab.snp.makeConstraints { (make) in
            make.top.equalTo(titLab.snp.bottom).offset(UIConfigure.SizeScale * 15)
            make.left.equalTo(UIConfigure.SizeScale * 15)
            make.right.equalTo(UIConfigure.SizeScale * -15)
            make.height.equalTo(self.content_h)
        }
        contLab.textColor = UIColor("666666")
//        contLab.font = UIConfigure.Font14
        contLab.isEditable = false
        contLab.textAlignment = .center
        contLab.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        self.addSubview(countdownBtn)
        countdownBtn.snp.makeConstraints { (make) in
            make.left.equalTo(UIConfigure.SizeScale * 20)
            make.bottom.right.equalTo(UIConfigure.SizeScale * -20)
            make.top.equalTo(contLab.snp.bottom).offset(UIConfigure.SizeScale * 20)
            make.height.equalTo(UIConfigure.SizeScale * 40)
        }
        countdownBtn.addTarget(self, action: #selector(clickCountdownBtn), for: .touchUpInside)
        
    }
    
    /// 点右上角直接关闭
    @objc func closeAction() {
        self.timer?.invalidate()
        self.timer = nil
        if let block = self.closeBlock {
            block()
        }
    }
    
    /// 点击自动跳转按钮，直接跳转
    @objc func clickCountdownBtn() {
        self.timer?.invalidate()
        self.timer = nil
        if let block = self.enterBlock {
            block(false)
        }
    }
    
    /// 开始计时
    @objc func startCountdown() {
        self.countdownBtn.setTitle("\(countdownBtnName)\(countdownTime)s", for: .normal)
        if countdownTime == 0 {
            self.timer?.invalidate()
            self.timer = nil
            if let block = self.enterBlock {
                block(true)
            }
        } else {
            countdownTime -= 1
        }
    }
    
    /// 提示弹窗
    func alert(withTitle title: String, andTipContent tipContent: String, andAutoBtnName autoBtnName: String, andTime time: Int, enterAction: @escaping (_ isAuto: Bool) -> Void, closeAction: @escaping () -> Void) {
        coverView.backgroundColor = UIColor(white: 0, alpha: 0.3)
        UIApplication.shared.keyWindow?.addSubview(coverView)
        coverView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
        
        self.titLab.text = title
        self.contLab.text = tipContent
        self.countdownBtnName = autoBtnName
        self.countdownTime = time
        
//        self.content_h = tipContent.attrHeight(withFontSize: UIConfigure.SizeScale * 14, andFontWeight: .regular, andWidth: UIConfigure.Width - UIConfigure.SizeScale * 80 - UIConfigure.SizeScale * 30)
        if self.content_h > UIConfigure.SizeScale * 80 {
            self.content_h = UIConfigure.SizeScale * 80
        }
//        print("content_h = \(self.content_h)")
        
        self.contLab.snp.remakeConstraints { (make) in
            make.top.equalTo(self.titLab.snp.bottom).offset(UIConfigure.SizeScale * 15)
            make.left.equalTo(UIConfigure.SizeScale * 10)
            make.right.equalTo(UIConfigure.SizeScale * -10)
            make.height.equalTo(self.content_h)
        }
        
        self.enterBlock = { isAuto in
            enterAction(isAuto)
            self.removeFromSuperview()
            self.coverView.removeFromSuperview()
        }
        self.closeBlock = {
            self.removeFromSuperview()
            self.coverView.removeFromSuperview()
            closeAction()
        }
        UIApplication.shared.keyWindow?.addSubview(self)
        self.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.left.equalTo(UIConfigure.SizeScale * 40)
            make.right.equalTo(UIConfigure.SizeScale * -40)
        }
    }
    
    //MARK: - 跳转区
    
    //MARK: - 生命区
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

