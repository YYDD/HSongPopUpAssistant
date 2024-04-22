//
//  PopUpToastView.swift
//  MyViewFactory
//
//  Created by Wanglei on 2024/3/26.
//

import UIKit
/// 提示弹窗
class PopUpToastView: PopUpBaseView {
    
    //MARK: - 声明区
    //-----UI-----
    var bgView = UIView()
    var mainIcon = UIImageView()
//    var mainSvgIcon: UIImageView!
    var mainSvgIcon = UIImageView()
//    var mainSvgIcon: SVGKFastImageView!
    var titLab = UILabel()
        .size14
        .weightMedium
        .canManyLines
        .textCenter
    var subTitLab = UILabel()
        .size12
        .canManyLines
        .textCenter
    //-----Block-----
    
    //-----Data-----
    /* 外部参数(从外部传入的数据) */
    /* 内部参数(从接口获取的数据以及其他内部数据) */
    let icon_size = UIConfigure.SizeScale * 40
    //MARK: - 逻辑区
    func setUI(withConfigure configureModel: PopUpConfigure) {
        
//        let svgCodeData = """
// <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none"><style>@keyframes blink-1{0%,50%,to{opacity:1}25%{opacity:0}}</style><rect width="16" height="16" x="4" y="4" stroke="#0A0A30" stroke-width="1.5" rx="2.075"/><path fill="#265BFF" d="M10.242 9.18a.75.75 0 00-1.061 1.062l1.79 1.79-1.79 1.79a.75.75 0 001.06 1.06l1.79-1.79 1.79 1.79a.75.75 0 001.062-1.06l-1.79-1.79 1.79-1.79a.75.75 0 10-1.061-1.061l-1.79 1.79-1.79-1.79z" style="animation:blink-1 2s steps(1,end) infinite both"/></svg>
//""".data(using: .utf8)
//        if let svgImg = SVGKImage(data: svgCodeData) {
//            self.mainSvgIcon = SVGKFastImageView(svgkImage: svgImg)
//        }
//        var mySvgImg = SVGKFastImageView()
//        mySvgImg.image = svgImg
        
//        let img = UIImage.gif(name: "1111222")
//        
//        self.mainSvgIcon = UIImageView(gifImage: img ?? UIImage(), loopCount: 1)
        let imageManaer = SwiftyGifManager(memoryLimit: 100)
        self.mainSvgIcon.clear()
        switch configureModel.toastType {
        case .success:
            do {
                let img = try UIImage(imageName: "app_success") ?? UIImage()
//                self.mainSvgIcon = UIImageView(gifImage: img, manager: SwiftyGifManager(memoryLimit: 100), loopCount: 1)
                self.mainSvgIcon.setImage(img, manager: imageManaer, loopCount: -1)
                self.mainSvgIcon.contentMode = .scaleAspectFill
            } catch {
                print(error)
            }
        case .fail:
            do {
                let img = try UIImage(gifName: "app_fail")
                self.mainSvgIcon = UIImageView(gifImage: img, loopCount: 1)
                
            } catch {
                print(error)
            }
        case .warn:
            do {
                let img = try UIImage(gifName: "app_warn")
                self.mainSvgIcon = UIImageView(gifImage: img, loopCount: 1)
                
            } catch {
                print(error)
            }
        case .custom:
            self.mainSvgIcon = UIImageView(image: BaseImage(named: configureModel.mainIconName)?.image)
        }
        
//        self.mainSvgIcon
        
        self.backgroundColor = configureModel.mainBgColor
//        self.cornerRadiu = UIConfigure.SizeScale * 10
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 20
        self.layer.cornerRadius = UIConfigure.SizeScale * 10
        
        let blurEffect = UIBlurEffect(style: .light)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        self.addSubview(visualEffectView)
        visualEffectView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
        visualEffectView.cornerRadiu = UIConfigure.SizeScale * 10

        self.addSubview(self.mainSvgIcon)
        self.mainSvgIcon.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(UIConfigure.SizeScale * 15)
            make.size.equalTo(icon_size)
        }

        
        addSubview(titLab)
        titLab.snp.makeConstraints { (make) in
            make.top.equalTo(mainSvgIcon.snp.bottom).offset(UIConfigure.SizeScale * 15)
            make.left.equalTo(UIConfigure.SizeScale * 15)
            make.right.equalTo(UIConfigure.SizeScale * -15)
        }
        titLab.textColor = configureModel.mainTitColor
        titLab.text = configureModel.mainTitle
        
        addSubview(subTitLab)
        subTitLab.snp.makeConstraints { (make) in
            make.top.equalTo(titLab.snp.bottom).offset(UIConfigure.SizeScale * 10)
            make.left.equalTo(UIConfigure.SizeScale * 15)
            make.bottom.right.equalTo(UIConfigure.SizeScale * -15)
        }
        subTitLab.textColor = configureModel.subTitColor
        subTitLab.text = configureModel.subTitle

        self.calThisSize(fromConfigure: configureModel)
        
        self.tapActionsGesture {
            self.popDelegate?.didClosePopView()
        }
        
    }
    
    func calThisSize(fromConfigure configureModel: PopUpConfigure) {
        
        let max_w = UIConfigure.Width - UIConfigure.SizeScale * 80
        // 1.首先确定弹窗宽度
        let mainTit_w = configureModel.mainTitle.attrWidth(withFontSize: UIConfigure.SizeScale * 13, andFontWeight: .medium) + UIConfigure.SizeScale * 30
        let subTit_w = configureModel.subTitle.attrWidth(withFontSize: UIConfigure.SizeScale * 10, andFontWeight: .regular) + UIConfigure.SizeScale * 30
        let titMax_w = mainTit_w > subTit_w ? mainTit_w : subTit_w
        
        if titMax_w == UIConfigure.SizeScale * 30 {
            self.mainSvgIcon.snp.remakeConstraints { (make) in
                make.left.top.equalTo(UIConfigure.SizeScale * 15)
                make.size.equalTo(icon_size)
                make.right.bottom.equalTo(UIConfigure.SizeScale * -15)
            }
        } else {
            
            self.mainSvgIcon.snp.remakeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.top.equalTo(UIConfigure.SizeScale * 15)
                make.size.equalTo(icon_size)
            }
            
            if subTit_w ==  UIConfigure.SizeScale * 30 {
                titLab.snp.remakeConstraints { (make) in
                    make.top.equalTo(mainSvgIcon.snp.bottom).offset(UIConfigure.SizeScale * 15)
                    make.left.equalTo(UIConfigure.SizeScale * 15)
                    make.bottom.right.equalTo(UIConfigure.SizeScale * -20)
                }
            } else {
                titLab.snp.makeConstraints { (make) in
                    make.top.equalTo(mainSvgIcon.snp.bottom).offset(UIConfigure.SizeScale * 15)
                    make.left.equalTo(UIConfigure.SizeScale * 15)
                    make.right.equalTo(UIConfigure.SizeScale * -15)
                }
            }
            
            var view_w = titMax_w > max_w ? max_w : titMax_w
            
            print("UIConfigure.Width = \(UIConfigure.Width)\ntitMax_w = \(titMax_w) \n view_w = \(view_w)")
            
            if view_w < UIConfigure.SizeScale * 180 {
                view_w = UIConfigure.SizeScale * 180
            }
            
            self.snp.makeConstraints { (make) in
                make.width.equalTo(view_w)
            }
        }
    }
    
    //MARK: - 跳转区
    
    //MARK: - 生命区
    override init(frame: CGRect) {
        super.init(frame: frame)
//        setUI()
    }
    
    init(frame: CGRect, configureModel: PopUpConfigure) {
        super.init(frame: frame)
        setUI(withConfigure: configureModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

public enum PopUpToastType: Int {
    case success = 0
    case fail = 1
    case warn = 2
    case custom = 3
}
