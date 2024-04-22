//
//  PopUpConfigure.swift
//  MyViewFactory
//
//  Created by Wanglei on 2024/3/26.
//

import UIKit

public struct PopUpConfigure {
    
    /// 主背景色
    var mainBgColor = UIColor.white
    
    /// 主标题颜色
    var mainTitColor = UIColor("333333")
    
    /// 副标题颜色
    var subTitColor = UIColor("666666")
    
    /// 主图标
    var mainIconName = "app_success_circle"
    
    /// 主标题
    var mainTitle = "加载成功"
    
    /// 副标题
    var subTitle = "副标题这里是"
    
    /// 弹窗类型
    var toastType = PopUpToastType.success
    
}
