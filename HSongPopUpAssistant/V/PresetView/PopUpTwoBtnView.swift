//
//  CountdownAlertView.swift
//  eHighSpeed
//
//  Created by Wanglei on 2023/9/1.
//  Copyright © 2023 SDGS. All rights reserved.
//

import UIKit

/// 倒计时弹窗
class PopUpTwoBtnView: UIView {
        
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

    var leftBtn = UIButton()
        .size13
        .titleColorCustomForNormal(UIColor("333333"))
        .spBgColorNormal(UIColor("dddddd"))
        .hiCorner(cornerNum: UIConfigure.SizeScale * 20)
    
    var rightBtn = UIButton()
        .size13
        .titleColorCustomForNormal(.white)
        .bgColorTheme
        .hiCorner(cornerNum: UIConfigure.SizeScale * 20)

    //-----Block-----
    var closeBlock: (() -> Void)?
    var operationBlock: ((_ isEnter: Bool, _ btnType: String) -> Void)?
    //-----Data-----
    /* 外部参数(从外部传入的数据) */
    
    /* 内部参数(从接口获取的数据以及其他内部数据) */
    var content_h: CGFloat = UIConfigure.SizeScale * 80
    
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
            make.height.equalTo(UIConfigure.SizeScale * 80)
        }
        contLab.textColor = UIColor("666666")
//        contLab.font = UIConfigure.Font14
        contLab.isEditable = false
        contLab.textAlignment = .center
        contLab.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        contLab.numberOfLines = 3
        
        self.addSubview(leftBtn)
        leftBtn.snp.makeConstraints { (make) in
            make.left.equalTo(UIConfigure.SizeScale * 20)
            make.bottom.equalTo(UIConfigure.SizeScale * -20)
            make.right.equalTo(self.snp.centerX).offset(UIConfigure.SizeScale * -5)
            make.top.equalTo(contLab.snp.bottom).offset(UIConfigure.SizeScale * 20)
            make.height.equalTo(UIConfigure.SizeScale * 40)
        }
        leftBtn.addTarget(self, action: #selector(leftAction), for: .touchUpInside)
        
        self.addSubview(rightBtn)
        rightBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.centerX).offset(UIConfigure.SizeScale * 5)
            make.centerY.height.equalTo(leftBtn)
            make.right.equalTo(UIConfigure.SizeScale * -20)
        }
        rightBtn.addTarget(self, action: #selector(rightAction), for: .touchUpInside)
        
    }
    
    /// 点右上角直接关闭
    @objc func closeAction() {
        if let block = self.operationBlock {
            block(false, "close")
        }
    }
    
    @objc func leftAction() {
        print(#function)
        if let block = self.operationBlock {
            block(false, "normal")
        }
    }
    
    @objc func rightAction() {
        print(#function)
        if let block = self.operationBlock {
            block(true, "normal")
        }
    }
    
    /// 提示弹窗
    func alert(title: String, content: String, leftBtnName: String, rightBtnName: String, leftOperation: @escaping (_ btnType: String) -> Void, rightOperation: @escaping () -> Void) {
        coverView.backgroundColor = UIColor(white: 0, alpha: 0.3)
        UIApplication.shared.keyWindow?.addSubview(coverView)
        coverView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
                
        self.titLab.text = title
        self.contLab.text = content
        self.leftBtn.setTitle(leftBtnName, for: .normal)
        self.rightBtn.setTitle(rightBtnName, for: .normal)
        
        self.content_h = content.attrHeight(withFontSize: UIConfigure.SizeScale * 14, andFontWeight: .regular, andWidth: UIConfigure.Width - UIConfigure.SizeScale * 80 - UIConfigure.SizeScale * 30)
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
        
        self.operationBlock = { isEnter, btnType in
            if isEnter {
                rightOperation()
            } else {
                leftOperation(btnType)
            }
            self.removeFromSuperview()
            self.coverView.removeFromSuperview()
        }
        self.closeBlock = {
            self.removeFromSuperview()
            self.coverView.removeFromSuperview()
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

