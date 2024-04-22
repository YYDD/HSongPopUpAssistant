//
//  Simplinit.swift
//  MyViewFactory
//
//  Created by Wanglei on 2022/5/13.
//

import UIKit

class Simplinit: NSObject {

}

extension UITextField {
    
    func stColor(_ colorName: String) -> Self {
        self.textColor = UIColor(colorName)
        return self
    }
    
    //MARK: Font
    ///11
    var size11: Self {
        self.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 11)
        return self
    }
    
    ///12
    var size12: Self {
        self.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 12)
        return self
    }
    
    ///13
    var size13: Self {
        self.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 13)
        return self
    }
    
    ///14
    var size14: Self {
        self.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 14)
        return self
    }
    
    ///15
    var size15: Self {
        self.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 15)
        return self
    }
    
    ///16
    var size16: Self {
        self.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 16)
        return self
    }
    
    ///17
    var size17: Self {
        self.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 17)
        return self
    }
    
    ///18
    var size18: Self {
        self.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 18)
        return self
    }
    
    ///19
    var size19: Self {
        self.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 19)
        return self
    }
    
    ///20
    var size20: Self {
        self.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 20)
        return self
    }
    
//    //MARK: Font Weight
////    var curWeight: UIFont.Weight = .regular
//    ///medium
//    var weightMedium: Self {
//        self.font = UIFont.systemFont(ofSize: self.font.pointSize, weight: .medium)
//        return self
//    }
//
//    ///bold
//    var weightBold: Self {
//        self.font = UIFont.systemFont(ofSize: self.font.pointSize, weight: .bold)
//        return self
//    }
//
//    ///heavy
//    var weightHeavy: Self {
//        self.font = UIFont.systemFont(ofSize: self.font.pointSize, weight: .heavy)
//        return self
//    }
//
//    ///semibold
//    var weightSemibold: Self {
//        self.font = UIFont.systemFont(ofSize: self.font.pointSize, weight: .semibold)
//        return self
//    }
//
}

extension UILabel {

    
    //MARK: Color
    func stColor(_ colorName: String) -> Self {
        self.textColor = UIColor(colorName)
        return self
    }
    
    ///自定义颜色
    func customColor(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }
    
    var colorBlue: UILabel {
        self.textColor = UIConfigure.OwnerServiceColor
        return self
    }
    
    ///theme
    var colorTheme: UILabel {
        self.textColor = UIConfigure.ThemeColor
        return self
    }
    
    ///经典红色
    var colorRed: UILabel {
        self.textColor = UIColor("#DC3D27")
        return self
    }
    
    ///222222
    var colorTwo: UILabel {
        self.textColor = UIColor("222222")
        return self
    }
    
    ///3333333颜色
    var colorThree: UILabel {
        self.textColor = UIColor("333333")
        return self
    }
    ///666666颜色
    var colorSix: UILabel {
        self.textColor = UIColor("666666")
        return self
    }
    ///999999颜色
    var colorNine: UILabel {
        self.textColor = UIColor("999999")
        return self
    }
    
    //MARK: Font Weight
//    var curWeight: UIFont.Weight = .regular
    ///medium
    var weightMedium: UILabel {
        self.font = UIFont.systemFont(ofSize: self.font.pointSize, weight: .medium)
        return self
    }
    
    ///bold
    var weightBold: UILabel {
        self.font = UIFont.systemFont(ofSize: self.font.pointSize, weight: .bold)
        return self
    }
    
    ///heavy
    var weightHeavy: UILabel {
        self.font = UIFont.systemFont(ofSize: self.font.pointSize, weight: .heavy)
        return self
    }
    
    ///semibold
    var weightSemibold: UILabel {
        self.font = UIFont.systemFont(ofSize: self.font.pointSize, weight: .semibold)
        return self
    }
    
    ///regular
    var weightRegular: UILabel {
        self.font = UIFont.systemFont(ofSize: self.font.pointSize, weight: .regular)
        return self
    }
    
    //MARK: Font
    ///8
    var size8: UILabel {
        self.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 8)
        return self
    }
    
    ///9
    var size9: UILabel {
        self.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 9)
        return self
    }
    
    ///10
    var size10: UILabel {
        self.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 10)
        return self
    }
    
    ///11
    var size11: UILabel {
        self.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 11)
        return self
    }
    
    ///12
    var size12: UILabel {
        self.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 12)
        return self
    }
    
    ///13
    var size13: UILabel {
        self.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 13)
        return self
    }
    
    ///14
    var size14: UILabel {
        self.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 14)
        return self
    }
    
    ///15
    var size15: UILabel {
        self.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 15)
        return self
    }
    
    ///16
    var size16: UILabel {
        self.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 16)
        return self
    }
    
    ///17
    var size17: UILabel {
        self.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 17)
        return self
    }
    
    ///18
    var size18: UILabel {
        self.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 18)
        return self
    }
    
    ///19
    var size19: UILabel {
        self.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 19)
        return self
    }
    
    ///20
    var size20: UILabel {
        self.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 20)
        return self
    }
    
    ///21
    var size21: UILabel {
        self.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 21)
        return self
    }
    
    ///22
    var size22: UILabel {
        self.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 22)
        return self
    }
    
    ///23
    var size23: UILabel {
        self.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 23)
        return self
    }
    
    ///24
    var size24: UILabel {
        self.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 24)
        return self
    }
    
    ///设置标签内容
    func hiText(text: String) -> UILabel {
        self.text = text
        return self
    }
    
    //换行
    var canManyLines: Self {
        self.numberOfLines = 0
        return self
    }
    
    //居中
    var textCenter: Self {
        self.textAlignment = .center
        return self
    }
    
    func lineSpacing(value: CGFloat) -> Self {
        let attributedText = NSMutableAttributedString(string: self.text ?? "")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = value  // 调整行间距大小
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedText.length))
        self.attributedText = attributedText
        return self
    }
    
}

extension UITableView {
    
    var hiTableView: UITableView {
        let thisTableView = UITableView(frame: .zero, style: .grouped)
        thisTableView.backgroundColor = UIConfigure.GroupTableViewBackground
        thisTableView.separatorStyle = .none
        thisTableView.isPagingEnabled = false
        thisTableView.showsVerticalScrollIndicator = false
        thisTableView.showsHorizontalScrollIndicator = false
        if #available(iOS 15.0, *) {
            thisTableView.sectionHeaderTopPadding = 0;
        }
        return thisTableView
    }
    
    //MARK: BackgroundColor
    var bgWhite: UITableView {
        self.backgroundColor = UIColor.white
        return self
    }
    
}

/*
 枚举 设置 图片的位置
 */
enum ButtonImagePosition : Int{
    
    ///图片在上
    case PositionTop = 0
    ///图片在左
    case Positionleft
    ///图片在下
    case PositionBottom
    ///图片在右
    case PositionRight
}

extension UIButton {
    
    static var hiBtn: UIButton {
        let btn = UIButton()
        return btn
    }
    
    //MARK: normal按钮字体颜色，默认白色
    ///按钮字体颜色：主题色
    var titleColorTheme: UIButton {
        self.setTitleColor(UIConfigure.ThemeColor, for: .normal)
        return self
    }
    ///按钮字体颜色：主题蓝色
    var titleColorBlue: UIButton {
        self.setTitleColor(UIConfigure.OwnerServiceColor, for: .normal)
        return self
    }
    
    func titleColorCustom(_ colorHex: String) -> Self {
        self.setTitleColor(UIColor(colorHex), for: .normal)
        return self
    }
    
    ///按钮普通标题颜色自定义
    func titleColorCustomForNormal(_ color: UIColor) -> Self {
        self.setTitleColor(color, for: .normal)
        return self
    }
    
    ///按钮选中标题颜色自定义
    func titleColorCustomForSelected(_ color: UIColor) -> Self {
        self.setTitleColor(color, for: .selected)
        return self
    }
    
    //MARK: 按钮背景颜色，默认主题色
    ///按钮背景颜色：主题色
    var bgColorTheme: UIButton {
        self.backgroundColor = UIConfigure.ThemeColor
        return self
    }
    ///按钮背景颜色：主题蓝色
    var bgColorBlue: UIButton {
        self.backgroundColor = UIConfigure.OwnerServiceColor
        return self
    }
    
    func bgColorCustom(_ colorHex: String) -> Self {
        self.backgroundColor = UIColor(colorHex)
        return self
    }
    
    func bgColorCustom(_ color: UIColor) -> Self {
        self.backgroundColor = color
        return self
    }
    
    func spBgColorNormal(_ color: UIColor) -> Self {
        self.setBackgroundImage(color.toImage(), for: .normal)
        return self
    }
    
    func spBgColorSelected(_ color: UIColor) -> Self {
        self.setBackgroundImage(color.toImage(), for: .selected)
        return self
    }
    
    //MARK: normal按钮字体大小
    ///11
    var size11: UIButton {
        self.titleLabel?.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 11)
        return self
    }
    
    ///12
    var size12: UIButton {
        self.titleLabel?.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 12)
        return self
    }
    
    ///13
    var size13: UIButton {
        self.titleLabel?.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 13)
        return self
    }
    
    ///14
    var size14: UIButton {
        self.titleLabel?.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 14)
        return self
    }
    
    ///15
    var size15: UIButton {
        self.titleLabel?.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 15)
        return self
    }
    
    ///16
    var size16: UIButton {
        self.titleLabel?.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 16)
        return self
    }
    
    ///17
    var size17: UIButton {
        self.titleLabel?.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 17)
        return self
    }
    
    ///18
    var size18: UIButton {
        self.titleLabel?.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 18)
        return self
    }
    
    ///19
    var size19: UIButton {
        self.titleLabel?.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 19)
        return self
    }
    
    ///20
    var size20: UIButton {
        self.titleLabel?.font = UIFont.systemFont(ofSize: UIConfigure.SizeScale * 20)
        return self
    }
    
    //MARK: normal按钮字体粗细
    ///medium
    var weightMedium: UIButton {
        self.titleLabel?.font = UIFont.systemFont(ofSize: self.titleLabel?.font.pointSize ?? UIConfigure.SizeScale * 14, weight: .medium)
        return self
    }
    
    ///bold
    var weightBold: UIButton {
        self.titleLabel?.font = UIFont.systemFont(ofSize: self.titleLabel?.font.pointSize ?? UIConfigure.SizeScale * 14, weight: .bold)
        return self
    }
    
    ///heavy
    var weightHeavy: UIButton {
        self.titleLabel?.font = UIFont.systemFont(ofSize: self.titleLabel?.font.pointSize ?? UIConfigure.SizeScale * 14, weight: .heavy)
        return self
    }
    
    ///semibold
    var weightSemibold: UIButton {
        self.titleLabel?.font = UIFont.systemFont(ofSize: self.titleLabel?.font.pointSize ?? UIConfigure.SizeScale * 14, weight: .semibold)
        return self
    }
    
    //MARK: 设置按钮文字
    ///设置按钮标题
    func hiTitleNomal(title: String) -> Self {
        self.setTitle(title, for: .normal)
        return self
    }
    
    ///设置按钮选中标题
    func hiTitleSelected(title: String) -> Self {
        self.setTitle(title, for: .selected)
        return self
    }
    
    //MARK: 设置按钮图片
    ///normal：设置按钮图片,若position不是only，应在设置按钮标题后调用
    func hiImgNormal(imgName: String, position: BtnImgPosition? = .only, space: CGFloat = UIConfigure.SizeScale * 2) -> Self {
        self.setImage(BaseImage(named: imgName)?.image, for: .normal)
        
        switch position {
        case .left:
            self.setImgAndTitleStyle(type: .Positionleft, Space: space, img: BaseImage(named: imgName)?.image)
            break
        case .top:
            self.setImgAndTitleStyle(type: .PositionTop, Space: space, img: BaseImage(named: imgName)?.image)
            break
        case .right:
            self.setImgAndTitleStyle(type: .PositionRight, Space: space, img: BaseImage(named: imgName)?.image)
            break
        case .bottom:
            self.setImgAndTitleStyle(type: .PositionBottom, Space: space, img: BaseImage(named: imgName)?.image)
            break
        default:
            break
        }
        return self
    }
    
    ///selected：设置按钮图片，至少应该在normal之后调用
    func hiImgSelected(imgName: String, position: BtnImgPosition? = .only, space: CGFloat = UIConfigure.SizeScale * 2) -> Self {
        self.setImage(BaseImage(named: imgName)?.image, for: .selected)
        switch position {
        case .left:
            self.setImgAndTitleStyle(type: .Positionleft, Space: space, img: BaseImage(named: imgName)?.image)
            break
        case .top:
            self.setImgAndTitleStyle(type: .PositionTop, Space: space, img: BaseImage(named: imgName)?.image)
            break
        case .right:
            self.setImgAndTitleStyle(type: .PositionRight, Space: space, img: BaseImage(named: imgName)?.image)
            break
        case .bottom:
            self.setImgAndTitleStyle(type: .PositionBottom, Space: space, img: BaseImage(named: imgName)?.image)
            break
        default:
            break
        }
        return self
    }
    
    enum BtnImgPosition {
        case only, left, top, right, bottom
    }
    
}

extension UIView {
    
    var hiView: UIView {
        let view = UIView()
        view.backgroundColor = .white
        view.cornerRadiu = UIConfigure.SizeScale * 8
        return view
    }
    
    var hiLine: UIView {
        let line = UIView()
        line.backgroundColor = UIConfigure.LineGrayColor
        return line
    }
    
    var themeGradientView: UIView {
        self.gradient(colors: [UIColor("#72BE91").cgColor, UIColor("#61BA86").cgColor, UIColor("#44A76D").cgColor, UIColor("#5FB984").cgColor, UIColor("#65C98E").cgColor, UIColor("#64D391").cgColor], orientation: .topRightBottomLeft)
        return self
    }
    
    ///边框
    func hiBorder(color: UIColor) -> Self {
        self.layer.borderWidth = UIConfigure.SizeScale * 1
        self.layer.borderColor = color.cgColor
        return self
    }
    
    ///圆角
    func hiCorner(cornerNum: CGFloat) -> Self {
        self.cornerRadiu = cornerNum
        return self
    }
    
    ///全部圆角
    func cornerRadiuForAll(cornerNum: CGFloat) {
        if #available(iOS 11.0, *) {
            // iOS11:只需要带用这个系统方法就可以随意设置View的圆角了，是不是很方便，赶快试一下吧
            self.layer.cornerRadius = cornerNum*UIConfigure.SizeScale
            self.layer.maskedCorners = CACornerMask(rawValue: CACornerMask.layerMinXMinYCorner.rawValue | CACornerMask.layerMaxXMinYCorner.rawValue | CACornerMask.layerMaxXMaxYCorner.rawValue | CACornerMask.layerMinXMaxYCorner.rawValue)
        } else {
            // 类型可省略
            let corners: UIRectCorner = [.topLeft,.topRight,.bottomLeft,.bottomRight]
            self.setCornerRadius(cor: UIConfigure.SizeScale * cornerNum, rectCorner: corners)
        }
    }
    
    ///上面圆角
    func cornerRadiuForTop_LeftRight(cornerNum: CGFloat) {
        if #available(iOS 11.0, *) {
            // iOS11:只需要带用这个系统方法就可以随意设置View的圆角了，是不是很方便，赶快试一下吧
            self.layer.cornerRadius = cornerNum*UIConfigure.SizeScale
            self.layer.maskedCorners = CACornerMask(rawValue: CACornerMask.layerMinXMinYCorner.rawValue | CACornerMask.layerMaxXMinYCorner.rawValue)
        } else {
            // 类型可省略
            let corners: UIRectCorner = [.topLeft,.topRight]
            self.setCornerRadius(cor: UIConfigure.SizeScale * cornerNum, rectCorner: corners)
        }
    }
    
    ///下面圆角
    func cornerRadiuForBottom_LeftRight(cornerNum: CGFloat) {
        if #available(iOS 11.0, *) {
            // iOS11:只需要带用这个系统方法就可以随意设置View的圆角了，是不是很方便，赶快试一下吧
            self.layer.cornerRadius = cornerNum
            self.layer.maskedCorners = CACornerMask(rawValue: CACornerMask.layerMinXMaxYCorner.rawValue | CACornerMask.layerMaxXMaxYCorner.rawValue)
        } else {
            // 类型可省略
            let corners: UIRectCorner = [.bottomLeft,.bottomRight]
            self.setCornerRadius(cor: cornerNum, rectCorner: corners)
        }
    }
    
    ///左上右下圆角
    func cornerRadiuForTopLeft_BottomRight(cornerNum: CGFloat) {
        if #available(iOS 11.0, *) {
            // iOS11:只需要带用这个系统方法就可以随意设置View的圆角了，是不是很方便，赶快试一下吧
            self.layer.cornerRadius = cornerNum*UIConfigure.SizeScale
            self.layer.maskedCorners = CACornerMask(rawValue: CACornerMask.layerMinXMinYCorner.rawValue | CACornerMask.layerMaxXMinYCorner.rawValue)
        } else {
            // 类型可省略
            let corners: UIRectCorner = [.topLeft,.bottomRight]
            self.setCornerRadius(cor: UIConfigure.SizeScale * cornerNum, rectCorner: corners)
        }
    }
    
    ///左侧圆角
    func cornerRadiuForLeft_topBottom(cornerNum: CGFloat) {
        if #available(iOS 11.0, *) {
            // iOS11:只需要带用这个系统方法就可以随意设置View的圆角了，是不是很方便，赶快试一下吧
            self.layer.cornerRadius = cornerNum*UIConfigure.SizeScale
            self.layer.maskedCorners = CACornerMask(rawValue: CACornerMask.layerMinXMinYCorner.rawValue | CACornerMask.layerMinXMaxYCorner.rawValue)
        } else {
            // 类型可省略
            let corners: UIRectCorner = [.topLeft,.bottomLeft]
            self.setCornerRadius(cor: UIConfigure.SizeScale * cornerNum, rectCorner: corners)
        }
    }
    
    ///右侧圆角
    func cornerRadiuForRight_topBottom(cornerNum: CGFloat) {
        if #available(iOS 11.0, *) {
            // iOS11:只需要带用这个系统方法就可以随意设置View的圆角了，是不是很方便，赶快试一下吧
            self.layer.cornerRadius = cornerNum*UIConfigure.SizeScale
            self.layer.maskedCorners = CACornerMask(rawValue: CACornerMask.layerMaxXMinYCorner.rawValue | CACornerMask.layerMaxXMaxYCorner.rawValue)
        } else {
            // 类型可省略
            let corners: UIRectCorner = [.topRight,.bottomRight]
            self.setCornerRadius(cor: UIConfigure.SizeScale * cornerNum, rectCorner: corners)
        }
    }
    
    
    
}

extension UIImageView {
    
    static var hiImg: UIImageView {
        let img = UIImageView()
        return img
    }
    
    func imageName(_ imgName: String) -> Self {
        self.image = BaseImage(named: imgName)?.image
        return self
    }
    
}
