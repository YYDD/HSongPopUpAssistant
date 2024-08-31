//
//  PopUpBaseView.swift
//  MyViewFactory
//
//  Created by Wanglei on 2023/10/27.
//

import UIKit

///PopUpBaseView
open class PopUpBaseView: UIView {
    
    //MARK: - 声明区
    //-----UI-----
    
    //-----Block-----
    var closeBlock: (() -> Void)?
    var nextBlock: (() -> Void)?
    var hiddenAndShowBlock: ((_ isHidden: Bool) -> Void)?
    //-----Data-----
    /* 外部参数(从外部传入的数据) */
    
    /* 内部参数(从接口获取的数据以及其他内部数据) */
    public weak var popDelegate: PopUpAssistantDelegate?
    
    //MARK: - 逻辑区
    @objc func closeAction() {
        if let block = self.closeBlock {
            block()
        }
    }
    
    @objc func nextAction() {
        
    }
    //MARK: - 跳转区
    
    //MARK: - 生命区
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

