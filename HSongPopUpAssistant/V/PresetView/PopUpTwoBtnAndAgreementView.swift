//
//  PopUpTwoBtnAndAgreementView.swift
//  MyViewFactory
//
//  Created by Wanglei on 2023/10/16.
//

import UIKit

/// 弹窗 (两个按钮+协议）
class PopUpTwoBtnAndAgreementView: UIView {
        
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
    
    var agmCircle = UIButton()
        .hiImgNormal(imgName: "app_nochose")
        .hiImgSelected(imgName: "app_chose_theme")
    var agmLab = UILabel()
        .size12
        .colorThree
        .canManyLines

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
    var agreements = [PopUpAgreementModel]() {
        didSet {
            
            self.getAboutAgreementSize()
            
        }
    }
    var agmRanges: [NSRange] = [NSRange]()
    
    /* 内部参数(从接口获取的数据以及其他内部数据) */
    var agmCircle_left: CGFloat = UIConfigure.SizeScale * 15
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
            make.left.equalTo(UIConfigure.SizeScale * 10)
            make.right.equalTo(UIConfigure.SizeScale * -10)
            make.height.equalTo(self.content_h)
        }
        contLab.textColor = UIColor("666666")
//        contLab.font = UIConfigure.Font14
        contLab.isEditable = false
        contLab.textAlignment = .center
        contLab.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        contLab.numberOfLines = 3
        
        self.addSubview(agmCircle)
        agmCircle.snp.makeConstraints { (make) in
            make.left.equalTo(self.agmCircle_left)
            make.top.equalTo(contLab.snp.bottom).offset(UIConfigure.SizeScale * 20)
            make.size.equalTo(UIConfigure.SizeScale * 14)
        }
        agmCircle.addTarget(self, action: #selector(agmCircleTouchAction(sender:)), for: .touchUpInside)
        
        self.addSubview(agmLab)
        agmLab.snp.makeConstraints { (make) in
            make.left.equalTo(agmCircle.snp.right).offset(UIConfigure.SizeScale * 5)
            make.top.equalTo(agmCircle)
            make.right.equalTo(UIConfigure.SizeScale * -15)
        }
        agmLab.lineBreakMode = .byCharWrapping
        
        self.addSubview(leftBtn)
        leftBtn.snp.makeConstraints { (make) in
            make.left.equalTo(UIConfigure.SizeScale * 20)
            make.bottom.equalTo(UIConfigure.SizeScale * -20)
            make.right.equalTo(self.snp.centerX).offset(UIConfigure.SizeScale * -5)
            make.top.equalTo(agmLab.snp.bottom).offset(UIConfigure.SizeScale * 20)
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
    
    func getAboutAgreementSize() {
        let thisWidth = UIConfigure.Width - UIConfigure.SizeScale * 80
        print("thisSize: w - \(thisWidth)")
        
        var agmStr = "已阅读并同意"
        for (i, agreement) in agreements.enumerated() {
            if i == agreements.count - 1 {
                agmStr += "\(agreement.agreementTitle)"
            } else {
                agmStr += "\(agreement.agreementTitle)、"
            }
        }
        let agmStr_w = agmStr.attrWidth(withFontSize: UIConfigure.SizeScale * 12, andFontWeight: .regular)
        let base_w = thisWidth - UIConfigure.SizeScale * 30 - UIConfigure.SizeScale * 14 - UIConfigure.SizeScale * 5
        
        if agmStr_w > base_w {
            // 放不开
            self.agmCircle_left = UIConfigure.SizeScale * 15
        } else {
            // 能放开
            let sum_w = agmStr_w + UIConfigure.SizeScale * 19
            self.agmCircle_left = (thisWidth - sum_w) / 2.0
        }
        agmCircle.snp.remakeConstraints { (make) in
            make.left.equalTo(self.agmCircle_left)
            make.top.equalTo(contLab.snp.bottom).offset(UIConfigure.SizeScale * 20)
            make.size.equalTo(UIConfigure.SizeScale * 14)
        }
        self.handleAttributeString(mainString: agmStr, keywords: self.agreements.map { $0.agreementTitle })
    }
    
    @objc func agmCircleTouchAction(sender: UIButton) {
        sender.isSelected = !sender.isSelected
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
        if !self.agmCircle.isSelected {
//            MyAlertView.sharedInstance.show(.blackViewAndClickDisappear, contentType: .warning, message: ["请阅读并同意相关协议"])
            return
        }
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
    
    func handleAttributeString(mainString: String, keywords: [String]) {
        let attributedString = NSMutableAttributedString(attributedString: mainString, color: UIColor("333333"), font: UIFont.systemFont(ofSize: UIConfigure.SizeScale * 12)) ?? NSMutableAttributedString(string: mainString)
        for keyword in keywords {
            if let range = mainString.range(of: keyword) {
                let nsRange = NSRange(range, in: mainString)
                
                self.agmRanges.append(nsRange)
                // 设置关键字的颜色，这里为红色
                let colorAttributes: [NSAttributedString.Key: Any] = [
                    .foregroundColor: UIConfigure.OwnerServiceColor
                ]
                attributedString.addAttributes(colorAttributes, range: nsRange)
            }
        }
        self.agmLab.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.labClickAction(tap:))))
        self.agmLab.isUserInteractionEnabled = true
        self.agmLab.attributedText = attributedString
    }
    
    @objc func labClickAction(tap: UITapGestureRecognizer) {
//        var inRange = false
        for (i, curRange) in self.agmRanges.enumerated() {
            if tap.didTapAttributedTextInLabel(label: self.agmLab, inRange: curRange) {
                print(self.agreements[i].agreementPath)
                self.enterHFive(agreementMode: self.agreements[i])
//                inRange = true
            }
        }
//        if !inRange {
//            self.agmCircle.isSelected = !self.agmCircle.isSelected
//        }
    }
    
    func hiddenAndShow(isShow: Bool) {
        if !isShow {
            self.isHidden = true
            self.coverView.isHidden = true
        } else {
            self.isHidden = false
            self.coverView.isHidden = false
        }
    }
    

    func enterHFive(agreementMode: PopUpAgreementModel) {
        self.hiddenAndShow(isShow: false)
//        let con = HTMLLoadViewController()
//        con.htmlTyle = .WKWebView
//        con.url = agreementMode.agreementPath
//        con.hidesBottomBarWhenPushed = true
//        con.backBlock = { [weak self] in
//            guard let `self` = self else { return }
//            self.hiddenAndShow(isShow: true)
//        }
//        con.navTitle = agreementMode.agreementTitle
////        con.btnClick_evar = "首页_精选_banner"
////        con.H5Type_var = "banner"
////        con.sourceName_var = "首页_精选"
//        getCurrentCon()?.navigationController?.pushViewController(con, animated: true)
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

