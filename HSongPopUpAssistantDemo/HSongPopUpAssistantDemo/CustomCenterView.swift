//
//  CustomCenterView.swift
//  HSongPopUpAssistantDemo
//
//  Created by wanglei on 2024/12/20.
//

import UIKit

///CustomCenterView
class CustomCenterView: PopUpBaseView {
    
    //MARK: - 声明区
    //-----UI-----
    var titLab = UILabel()
    //-----Block-----
    
    //-----Data-----
    /* 外部参数(从外部传入的数据) */
    
    /* 内部参数(从接口获取的数据以及其他内部数据) */
    
    //MARK: - 逻辑区
    func setUI() {
        self.backgroundColor = .yellow
        titLab.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        titLab.textColor = .black
        self.addSubview(titLab)
        titLab.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        titLab.text = "这是一个自定义弹窗"
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

