//
//  PopUpCommon.swift
//  FrameTest
//
//  Created by Wanglei on 2024/4/2.
//

import UIKit

extension UIColor {
    
    // 字符串转16进制颜色
    convenience init(_ hexString: String) {
        let hexString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
    /// 返回一个 16 进制表示的颜色
    ///
    /// - Parameters:
    ///   - hex: 如 0xFF5A39
    ///   - alpha: 颜色透明度
    convenience init?(hexColor hex: Int, alpha: CGFloat) {
        self.init(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0, green: CGFloat((hex & 0xFF00) >> 8) / 255.0, blue: CGFloat(hex & 0xFF) / 255.0, alpha: alpha)
    }
    
    /// 生成图片
    ///
    /// - Returns: 图片
    func toImage(width:CGFloat? = 1,height:CGFloat? = 1) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        // 在这个范围开启一个上下文
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(self.cgColor)
        // 填充这个颜色
        context?.fill(rect)
        let myImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return myImage!
    }
}

extension NSAttributedString {
    
    ///确定高度，求富文本宽度
    func length(height: CGFloat) -> CGFloat {
        
        self.boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: height), options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil).width
        
    }
    
    ///确定宽度，求富文本高度
    func height(width: CGFloat) -> CGFloat {
        
        self.boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil).height
        
    }
    
    /// 返回一个简单配置富文本
    ///
    /// - Parameters:
    ///   - str: 字符串
    ///   - color: 颜色
    ///   - font: 字体大小
    convenience init?(attributedString str: String, color: UIColor, font: UIFont) {
        let tfAttrDict = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: color]
        self.init(string: str, attributes: tfAttrDict)
    }

}

extension String {
    func attrWidth(withFontSize fontSize: CGFloat, andFontWeight fontWeight: UIFont.Weight) -> CGFloat {
        if let attrStr = NSAttributedString(attributedString: self, color: .white, font: UIFont.systemFont(ofSize: fontSize, weight: fontWeight)) {
            return attrStr.length(height: UIConfigure.Height)
        }
        return 0
    }
    
    func attrHeight(withFontSize fontSize: CGFloat, andFontWeight fontWeight: UIFont.Weight, andWidth thisWidth: CGFloat) -> CGFloat {
        if let attrStr = NSAttributedString(attributedString: self, color: .white, font: UIFont.systemFont(ofSize: fontSize, weight: fontWeight)) {
            return attrStr.height(width: thisWidth)
        }
        return 0
    }
    
    func attrHeight(withFont font: UIFont, andWidth thisWidth: CGFloat) -> CGFloat {
        if let attrStr = NSAttributedString(attributedString: self, color: .white, font: font) {
            return attrStr.height(width: thisWidth)
        }
        return 0
    }
    
    func getHeight(withWidth width: CGFloat, font: UIFont, lineSpacing: CGFloat) -> CGFloat {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .paragraphStyle: paragraphStyle
        ]
        
        let size = CGSize(width: width, height: .greatestFiniteMagnitude)
        
        let options: NSStringDrawingOptions = [.usesLineFragmentOrigin, .usesFontLeading]
        
        let rect = self.boundingRect(with: size, options: options, attributes: attributes, context: nil)
        
        return ceil(rect.height)
    }
}

var defaultCornerRadius = "defaultCornerRadius"
var blockActionDict : [String : ( () -> () )] = [:]

//方向枚举，这里只列出两个
enum GradientDirection {
    case Horizontal ///水平
    case Vertial ///垂直
}

typealias GradientPoints = (startPoint: CGPoint, endPoint: CGPoint)

enum GradientOrientation {
    case topRightBottomLeft
    case topLeftBottomRight
    case horizontal
    case vertical
    
    var startPoint : CGPoint {
        return points.startPoint
    }
    
    var endPoint : CGPoint {
        return points.endPoint
    }
    
    var points : GradientPoints {
        switch self {
        case .topRightBottomLeft:
            return (CGPoint(x: 0.0,y: 1.0), CGPoint(x: 1.0,y: 0.0))
        case .topLeftBottomRight:
            return (CGPoint(x: 0.0,y: 0.0), CGPoint(x: 1,y: 1))
        case .horizontal:
            return (CGPoint(x: 0.0,y: 0.5), CGPoint(x: 1.0,y: 0.5))
        case .vertical:
            return (CGPoint(x: 0.0,y: 0.0), CGPoint(x: 0.0,y: 1.0))
        }
    }
}

extension UIView {
    
    var width: CGFloat {
        return self.frame.size.width
    }
    
    var height: CGFloat {
        return self.frame.size.height
    }
    //MARK:圆角相关
    /// 圆角
    @IBInspectable var cornerRadiu: CGFloat{
        get{
            if(objc_getAssociatedObject(self, &defaultCornerRadius) == nil){
                objc_setAssociatedObject(self, &defaultCornerRadius, 0,.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                
                return 0
            }else{
                
                return objc_getAssociatedObject(self,&defaultCornerRadius) as! CGFloat
            }
        }
        set{
            layer.cornerRadius = newValue
            layer.masksToBounds = true
            objc_setAssociatedObject(self, &defaultCornerRadius, newValue,.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
        }
    }
    
    func addTarget(_ target: Any?, action: Selector) {
        self.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(tap)
    }
    
    /**
     view以及其子类的block点击方法（当给 UIButton 添加时，再给其添加 target 点击事件无效）
     - parameter action: 单击时执行的block
     */
    public func tapActionsGesture(_ action:@escaping ( () -> Void )){
        self.isUserInteractionEnabled = true
        addBlock(action)//添加点击block
        whenTouchOne()//点击block
    }
    
    fileprivate func addBlock(_ block:@escaping ()->()){
        //创建唯一标示  方便在点击的时候取出
        //        blockActionDict[String(NSValue(nonretainedObject: self))] = block
        blockActionDict[String(self.hashValue)] = block
    }
    
    fileprivate func whenTouchOne(){
        let tapGesture = UITapGestureRecognizer()
        tapGesture.numberOfTouchesRequired = 1
        tapGesture.numberOfTapsRequired = 1
        tapGesture.addTarget(self, action: #selector(UIView.tapActions))
        self.addGestureRecognizer(tapGesture)
    }
    
    /**
     私有方法，禁止调用
//     */
    @objc fileprivate func tapActions(){
        //取出唯一标示 并执行block里面的方法
        //        blockActionDict[String(NSValue(nonretainedObject:self))]!()
        blockActionDict[String(self.hashValue)]!()
    }
    
    ///渐变色
    func gradient(colors: [CGColor], orientation: GradientOrientation, shadowColor: UIColor = UIColor.clear, cornerRadius: CGFloat = 0) {
        self.backgroundColor = nil
        self.layoutIfNeeded()
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = orientation.startPoint
        gradientLayer.endPoint = orientation.endPoint
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = cornerRadius
        
        gradientLayer.shadowColor = shadowColor.cgColor
        gradientLayer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        gradientLayer.shadowRadius = 5.0
        gradientLayer.shadowOpacity = 0.3
        gradientLayer.masksToBounds = false
        
        self.layer.insertSublayer(gradientLayer, at: 0)
        //        self.contentVerticalAlignment = .center
        //        self.setTitleColor(UIColor.white, for: .normal)
        //        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17.0)
        //        self.titleLabel?.textColor = UIColor.white
    }
    
    /// 随心所欲设置圆角
    /// - Parameters:
    ///   - cor: 圆角弧度
    ///   - rectCorner: 圆角位置
    func setCornerRadius(cor: CGFloat, rectCorner: UIRectCorner) {
        
        self.layoutIfNeeded()
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: rectCorner, cornerRadii: CGSize(width: cor, height: cor))
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.path = path.cgPath
        self.layer.mask = shapeLayer
        
    }
    
    /// 随心所欲设置圆角
    /// - Parameters:
    ///   - cor: 圆角弧度
    ///   - rectCorner: 圆角位置
    func setCornerRadiusWithShadow(cor: CGFloat, rectCorner: UIRectCorner) {
        
        self.layoutIfNeeded()
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: rectCorner, cornerRadii: CGSize(width: cor, height: cor))
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        
        shapeLayer.shadowOffset = CGSize(width: -2, height: 2)
        shapeLayer.shadowRadius = UIConfigure.SizeScale * 3
        shapeLayer.shadowOpacity = 0.5
        shapeLayer.shadowColor = UIColor.black.cgColor
        
        shapeLayer.path = path.cgPath


        self.layer.mask = shapeLayer
        
    }
}

public extension NSObject {
    
    /**
     在延迟后结束. 在 main_queue 调用.
     
     - parameter delay: 延迟的秒数
     */
    func delay(_ delay: Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
}

extension UITapGestureRecognizer {
    
    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText!)
        
        // Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        // Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize
        
        // Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        
        let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x, y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y)
        
        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x, y: locationOfTouchInLabel.y - textContainerOffset.y)
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        return NSLocationInRange(indexOfCharacter, targetRange)
    }
    
}

class BaseImage: NSObject {
    
    var image : UIImage?
    
    init?(named name: String) {
        
        let bunbun = Bundle(for: Self.self)
        self.image = UIImage(named: name, in: bunbun, compatibleWith: nil)
        
    }
    
    // 获取聊天的图片 emoji 等
    init?(emojiNamed name: String) {
        
        //        if AppConfigure.UseDownloadImages {
        //            // 如果开启使用下载的图片 需要重新进行测试／更改 这里没有进行测试
        //            self.image = UIImage(named: "\(NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0])" + "/pic/" + name)
        //        }else{
        self.image = UIImage(named: "\(name)")
        //        }
    }
}

extension UIButton {
/**
imageName:图片的名字
title：button 的名字
type ：image 的位置
Space ：图片文字之间的间距
*/
    func setImageAndTitle(imageName:String,title:String,type:ButtonImagePosition,Space space:CGFloat)  {
      
        self.setTitle(title, for: .normal)
        self.setImage(UIImage(named:imageName), for: .normal)
        
        let imageWith :CGFloat = (self.imageView?.frame.size.width)!;
        let imageHeight :CGFloat = (self.imageView?.frame.size.height)!;
      
        var labelWidth :CGFloat = 0.0;
        var labelHeight :CGFloat = 0.0;

        labelWidth = CGFloat(self.titleLabel!.intrinsicContentSize.width);
        labelHeight = CGFloat(self.titleLabel!.intrinsicContentSize.height);

        var  imageEdgeInsets :UIEdgeInsets = UIEdgeInsets();
        var  labelEdgeInsets :UIEdgeInsets = UIEdgeInsets();
       
        switch type {
        case .PositionTop:
            imageEdgeInsets = UIEdgeInsets(top: -labelHeight - space/2.0, left: 0, bottom: 0, right: -labelWidth);
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWith, bottom: -imageHeight-space/2.0, right: 0);
            break;
        case .Positionleft:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -space/2.0, bottom: 0, right: space/2.0);
            labelEdgeInsets = UIEdgeInsets(top: 0, left: space/2.0, bottom: 0, right: -space/2.0);
            break;
        case .PositionBottom:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight-space/2.0, right: -labelWidth);
            labelEdgeInsets = UIEdgeInsets(top: -imageHeight-space/2.0, left: -imageWith, bottom: 0, right: 0);
            break;
        case .PositionRight:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth - 40, bottom: 0, right: -labelWidth);
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWith-space/2.0, bottom: 0, right: imageWith+space/2.0);
            break;
        }
        
        // 4. 赋值
        self.titleEdgeInsets = labelEdgeInsets;
        self.imageEdgeInsets = imageEdgeInsets;
    }
    
    func setImgAndTitleStyle(type:ButtonImagePosition,Space space:CGFloat, img: UIImage? = nil)  {
            
        var imageWith :CGFloat = 0.0
        var imageHeight :CGFloat = 0.0
        if img != nil {
            imageWith = (img!.size.width);
            imageHeight = (img!.size.height);
        } else {
            imageWith = (self.imageView?.frame.size.width)!;
            imageHeight = (self.imageView?.frame.size.height)!;
        }
        
        var labelWidth :CGFloat = 0.0;
        var labelHeight :CGFloat = 0.0;
        
        labelWidth = CGFloat(self.titleLabel!.intrinsicContentSize.width);
        labelHeight = CGFloat(self.titleLabel!.intrinsicContentSize.height);
        
        var  imageEdgeInsets :UIEdgeInsets = UIEdgeInsets();
        var  labelEdgeInsets :UIEdgeInsets = UIEdgeInsets();
        
        switch type {
        case .PositionTop:
            imageEdgeInsets = UIEdgeInsets(top: -labelHeight - space/2.0, left: 0, bottom: 0, right: -labelWidth);
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWith, bottom: -imageHeight-space/2.0, right: 0);
            break;
        case .Positionleft:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -space/2.0, bottom: 0, right: space/2.0);
            labelEdgeInsets = UIEdgeInsets(top: 0, left: space/2.0, bottom: 0, right: -space/2.0);
            break;
        case .PositionBottom:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight-space/2.0, right: -labelWidth);
            labelEdgeInsets = UIEdgeInsets(top: -imageHeight-space/2.0, left: -imageWith, bottom: 0, right: 0);
            break;
        case .PositionRight:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth, bottom: 0, right: -labelWidth);
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWith-space/2.0, bottom: 0, right: imageWith+space/2.0);
            break;
        }
        
        // 4. 赋值
        self.titleEdgeInsets = labelEdgeInsets;
        self.imageEdgeInsets = imageEdgeInsets;
    }
    
}
