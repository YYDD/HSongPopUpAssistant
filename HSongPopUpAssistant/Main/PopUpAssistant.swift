//
//  PopUpAssistant.swift
//  MyViewFactory
//
//  Created by Wanglei on 2023/10/16.
//  弹窗助理

import UIKit

class PopUpAssistant: NSObject {
    
    static let shared = PopUpAssistant()
    
    var mainBgColor = UIColor.white
    var topSpacing = UIConfigure.SizeScale * 0
    var bottomSpacing = UIConfigure.SizeScale * 0
    
    /// 自定义弹窗
    /// - Parameters:
    ///   - customView: 自定义视图
    ///   - position: 弹窗位置
    ///   - useCover: 是否使用遮罩
    func showCustomView(_ customView: PopUpBaseView, position: PopUpAlertPosition, useCover: Bool) {
        let cview = PopUpCustomView()
        cview.topPadding = UIConfigure.KStatusBarHeight
        cview.alert(customView: customView, position: position, useCover: useCover)
    }
    
    /// 自定义通知
    func showNoticeCustomView(_ customView: PopUpBaseView, position: PopUpAlertPosition = .center, useCover: Bool = true, showTimeSecond: Double = 3) {
        let cview = PopUpNoticeCustomView()
        cview.topPadding = UIConfigure.KStatusBarHeight
        cview.alert(customView: customView, position: position, useCover: useCover, showTimeSecond: showTimeSecond)
    }
    
    /// 预设toast
    func showToast(_ type: PopUpToastType, mainTitle: String, subTitle: String = "") {
        var toastConfigure = PopUpConfigure()
        toastConfigure.toastType = type
        toastConfigure.mainTitle = mainTitle
        toastConfigure.subTitle = subTitle
        let toastView = PopUpToastView(frame: .zero, configureModel: toastConfigure)
        self.showNoticeCustomView(toastView, useCover: false)
    }
    
    /// 倒计时弹窗
    /// - Parameters:
    ///   - tipContent: 弹窗提示的内容
    ///   - time: 弹窗倒计时的时间
    ///   - enterAction: 倒计时结束或者直接点击按钮触发的事件
    func showCountdownView(withTitle title: String, andTipContent tipContent: String, andAutoBtnName autoBtnName: String, andTime time: Int, enterAction: @escaping (_ isAuto: Bool) -> Void, closeAction: @escaping () -> Void) {
        let countdown = CountdownAlertView()
        countdown.alert(withTitle: title, andTipContent: tipContent, andAutoBtnName: autoBtnName, andTime: time) { isAuto in
            enterAction(isAuto)
        } closeAction: {
            closeAction()
        }
    }
    
    /// 有两个按钮的弹窗
    /// - Parameters:
    ///   - title: 标题
    ///   - content: 内容
    ///   - leftBtnName: 左侧按钮名
    ///   - rightBtnName: 右侧按钮名
    ///   - leftOperation: 左侧操作
    ///   - rightOperation: 右侧操作
    func showTwoBtnView(title: String = "提示", content: String, leftBtnName: String = "取消", rightBtnName: String = "确定", leftOperation: @escaping (_ btnType: String) -> Void, rightOperation: @escaping () -> Void) {
        let popView = PopUpTwoBtnView()
        popView.alert(title: title, content: content, leftBtnName: leftBtnName, rightBtnName: rightBtnName) { btnType in
            // 左侧
            print("点击了左侧按钮")
            leftOperation(btnType)
        } rightOperation: {
            // 右侧
            print("点击了右侧按钮")
            rightOperation()
        }

    }
    
    /// 有两个按钮的弹窗
    /// - Parameters:
    ///   - title: 标题
    ///   - content: 内容
    ///   - leftBtnName: 左侧按钮名
    ///   - rightBtnName: 右侧按钮名
    ///   - leftOperation: 左侧操作
    ///   - rightOperation: 右侧操作
    ///   - agreements: 协议
    func showTwoBtnAndAgreementView(
        title: String = "提示",
        content: String,
        leftBtnName: String = "取消",
        rightBtnName: String = "确定",
        agreements: [PopUpAgreementModel] = [PopUpAgreementModel](),
        leftOperation: @escaping (_ btnType: String) -> Void,
        rightOperation: @escaping () -> Void
    ) {
        if agreements.count > 0 {
            let popView = PopUpTwoBtnAndAgreementView()
            popView.agreements = agreements
            popView.alert(title: title, content: content, leftBtnName: leftBtnName, rightBtnName: rightBtnName) { btnType in
                // 左侧
                print("点击了左侧按钮")
                leftOperation(btnType)
            } rightOperation: {
                // 右侧
                print("点击了右侧按钮")
                rightOperation()
            }
        } else {
            let popView = PopUpTwoBtnView()
            popView.alert(title: title, content: content, leftBtnName: leftBtnName, rightBtnName: rightBtnName) { btnType in
                // 左侧
                print("点击了左侧按钮")
                leftOperation(btnType)
            } rightOperation: {
                // 右侧
                print("点击了右侧按钮")
                rightOperation()
            }
        }

    }
    
}

@objc protocol PopUpAssistantDelegate {
    func didClosePopView()
    func nextStep()
}


struct PopUpAgreementModel {
    var agreementTitle = String()
    var agreementPath = String()
}

public enum PopUpAlertPosition: Int {
    case center = 0
    case bottom
    case top
}
