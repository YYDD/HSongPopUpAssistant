//
//  PopUp.swift
//  PopUpAssistant
//
//  Created by Wanglei on 2024/4/2.
//

import UIKit
@_exported import SwiftyGif
@_exported import SnapKit
@_exported import MJRefresh
@_exported import MJExtension

public class PopUp: NSObject {
    
    public static let shared = PopUp()
    
    /// 预设toast
    public func showToast(mainTitle: String, subTitle: String = "") {
        var toastConfigure = PopUpConfigure()
        toastConfigure.toastType = .success
        toastConfigure.mainTitle = mainTitle
        toastConfigure.subTitle = subTitle
        let toastView = PopUpToastView(frame: .zero, configureModel: toastConfigure)
        PopUpAssistant.shared.showNoticeCustomView(toastView, useCover: false)
    }
    
    public func showCountDown() {
        PopUpAssistant.shared.showCountdownView(withTitle: "提示", andTipContent: "哈哈哈哈", andAutoBtnName: "你好", andTime: 30) { isAuto in
            //
        } closeAction: {
            //
        }

    }
    
}
