//
//  PopUpCustomView.swift
//  MyViewFactory
//
//  Created by Wanglei on 2023/10/26.
//

import UIKit

class PopUpCustomView: UIView, PopUpAssistantDelegate {

    func didClosePopView() {
        self.closeSelf()
    }
    
    func nextStep() {
        print("aaaa")
    }
    
    
    //MARK: - 声明区
    //-----UI-----
    var coverView = UIView()
    var customView = PopUpBaseView()
    var tapGes: UITapGestureRecognizer?
    //-----Block-----
    var closeBlock: (() -> Void)?
    //-----Data-----
    /* 外部参数(从外部传入的数据) */
    var position = PopUpAlertPosition.center
    var isFrame = Bool()
    var view_w = CGFloat()
    var view_h = CGFloat()
    var topPadding = UIConfigure.KStatusBarHeight + UIConfigure.SizeScale * 10
    /* 内部参数(从接口获取的数据以及其他内部数据) */
    
    //MARK: - 逻辑区
    /// 提示弹窗
    func alert(customView: PopUpBaseView, position: PopUpAlertPosition, useCover: Bool = true) {
        self.customView = customView
        customView.popDelegate = self
        // 1.将弹出位置保存一下
        self.position = position
        // 2.是否由frame弹出
        self.isFrame = customView.width > 0
        // 3.遮罩
        if useCover {
            coverView.backgroundColor = UIColor(white: 0, alpha: 0.3)
            coverView.addTarget(self, action: #selector(removeSelf))
            UIApplication.shared.keyWindow?.addSubview(coverView)
            coverView.snp.makeConstraints { (make) in
                make.left.top.right.bottom.equalToSuperview()
            }
        } else {
            self.layer.shadowOffset = CGSize(width: 0, height: 0)
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOpacity = 0.3
            self.layer.shadowRadius = 20
            self.layer.cornerRadius = UIConfigure.SizeScale * 10
            
            self.tapGes = UITapGestureRecognizer(target: self, action: #selector(removeSelf))
            UIApplication.shared.keyWindow?.addGestureRecognizer(self.tapGes!)
            
        }
        self.addSubview(customView)
        
        
        switch position {
        case .center:
            self.popFromCenter(customView: customView)
        case .bottom:
            self.popFromBottom(customView: customView)
        case .top:
            self.popFromTop(customView: customView)
        }
        
    }
    
    @objc func removeSelf() {
        self.closeSelf()
        if self.tapGes != nil {
            UIApplication.shared.keyWindow?.removeGestureRecognizer(self.tapGes!)
        }
    }
    
    func closeSelf() {
        switch self.position {
        case .center:
            self.coverView.removeFromSuperview()
            self.removeFromSuperview()
        case .bottom:
            UIView.animate(withDuration: 0.3) {
                self.mj_y = UIConfigure.Height
            } completion: { isSuccess in
                self.coverView.removeFromSuperview()
                self.removeFromSuperview()
            }
        case .top:
            UIView.animate(withDuration: 0.3) {
                self.mj_y = -self.view_h
            } completion: { isSuccess in
                self.coverView.removeFromSuperview()
                self.removeFromSuperview()
            }
        }
    }
    
    func popFromBottom(customView: PopUpBaseView) {
        customView.hiddenAndShowBlock = { isHidden in
            self.hiddenAndShow(isShow: !isHidden)
        }
        // 如果 isFrame 为 true，则使用 frame-based 动画
        if self.isFrame {
            // 计算自定义视图的宽度和高度
            self.view_w = customView.width
            self.view_h = customView.height
            
            // 计算自定义视图的初始 x 位置，使其位于屏幕中央
            let view_x = (UIConfigure.Width - view_w) / 2.0
            
            // 计算自定义视图在底部显示时的最终 y 位置
            let pop_y = UIConfigure.Height - view_h - PopUpAssistant.shared.bottomSpacing
            
            // 将自定义视图添加到关键窗口
            UIApplication.shared.keyWindow?.addSubview(self)
            
            // 设置视图的初始位置，使其位于屏幕底部以外
            self.frame = CGRect(x: view_x, y: UIConfigure.Height, width: view_w, height: view_h)
            
            // 使用 UIView.animate 执行动画，使视图从底部滑入
            UIView.animate(withDuration: 0.3) {
                self.mj_y = pop_y
            }
        } else {
            // 如果 isFrame 为 false，则直接使用 SnapKit 来设置约束
            // 将自定义视图添加到关键窗口
            UIApplication.shared.keyWindow?.addSubview(self)
            
            // 使用 SnapKit 创建约束，使自定义视图填充整个父视图
            customView.snp.makeConstraints { (make) in
                make.left.top.right.bottom.equalToSuperview()
            }
            
            // 使用 SnapKit 创建约束，使视图水平居中且位于底部
            self.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview()
            }
        }
    }

    func popFromCenter(customView: PopUpBaseView) {
        customView.hiddenAndShowBlock = { isHidden in
            self.hiddenAndShow(isShow: !isHidden)
        }
        // 检查是否应使用 frame-based 动画
        if isFrame {
            // 计算自定义视图的宽度和高度
            self.view_w = customView.width
            self.view_h = customView.height
            
            // 计算自定义视图的初始 x 和 y 位置，使其位于屏幕中央
            let view_x = (UIConfigure.Width - view_w) / 2.0
            let view_y = (UIConfigure.Height - view_h) / 2.0
            
            // 将自定义视图添加到关键窗口
            UIApplication.shared.keyWindow?.addSubview(self)
            
            // 设置视图的初始位置，使其位于屏幕中央，但设置为隐藏
            self.frame = CGRect(x: view_x, y: view_y, width: self.view_w, height: self.view_h)
            self.isHidden = true
            
            // 使用 UIView.animate 执行动画，使视图从隐藏状态渐显
            UIView.animate(withDuration: 0.3) {
                self.isHidden = false
            }
        } else {
            // 如果 isFrame 为 false，则直接使用 SnapKit 来设置约束
            // 将自定义视图添加到关键窗口
            UIApplication.shared.keyWindow?.addSubview(self)
            
            // 使用 SnapKit 创建约束，使自定义视图填充整个父视图
            customView.snp.makeConstraints { (make) in
                make.left.top.right.bottom.equalToSuperview()
            }
            
            // 使用 SnapKit 创建约束，使自定义视图位于父视图中央
            self.snp.makeConstraints { (make) in
                make.center.equalToSuperview()
            }
        }
    }
    
    func popFromTop(customView: PopUpBaseView) {
        customView.hiddenAndShowBlock = { isHidden in
            self.hiddenAndShow(isShow: !isHidden)
        }
        // 检查是否应使用 frame-based 动画
        if isFrame {
            // 计算自定义视图的宽度和高度
            self.view_w = customView.width
            self.view_h = customView.height
            
            // 计算自定义视图的初始 x 位置，使其位于屏幕中央
            let view_x = (UIConfigure.Width - view_w) / 2.0
            
            // 计算自定义视图的初始 y 位置，使其位于屏幕顶部之外
            let view_y = -view_h
            
            // 将自定义视图添加到关键窗口
            UIApplication.shared.keyWindow?.addSubview(self)
            
            // 设置视图的初始位置，使其位于屏幕顶部之外
            self.frame = CGRect(x: view_x, y: view_y, width: view_w, height: view_h)
            
            // 设置视图为隐藏状态
            self.isHidden = true
            
            // 使用 UIView.animate 执行动画，使视图从隐藏状态渐显，并从顶部滑入
            UIView.animate(withDuration: 0.3) {
                self.isHidden = false
                self.frame = CGRect(x: view_x, y: UIConfigure.KStatusBarHeight + PopUpAssistant.shared.topSpacing, width: self.view_w, height: self.view_h)
            }
        } else {
            // 如果 isFrame 为 false，则直接使用 SnapKit 来设置约束
            // 将自定义视图添加到关键窗口
            UIApplication.shared.keyWindow?.addSubview(self)
            
            // 使用 SnapKit 创建约束，使自定义视图填充整个父视图
            customView.snp.makeConstraints { (make) in
                make.left.top.right.bottom.equalToSuperview()
            }
            
            // 使用 SnapKit 创建约束，使自定义视图位于父视图顶部
            self.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
            }
        }
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

    //MARK: - 跳转区
    
    //MARK: - 生命区
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

