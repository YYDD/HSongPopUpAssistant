# HSongPopUpAssistant
<p align="leading">
    <img src="https://img.shields.io/badge/platform-iOS-blue.svg?style=flat" alt="Platforms" />
    <img src="https://img.shields.io/badge/Swift-5-orange.svg" />
    <a href="https://github.com/Thered-key/HSongSlideTabView/blob/main/LICENSE"><img src="http://img.shields.io/badge/license-MIT-blue.svg?style=flat" alt="License: MIT" /></a>
</p>

##### HSongPopUpAssistant is a toast assitant, is a pop-up window assistant, you can pop any your custom view or reset view.If this is your cup of tea, please give me a little star.
### 1.Sample
<br />
<div>
    <img src="/ReadMeImgs/111.gif" width = "250" height = "541" alt="" align=center />
    <img src="/ReadMeImgs/22.gif" width = "250" height = "541" alt="" align=center />
    <img src="/ReadMeImgs/33.gif" width = "250" height = "541" alt="" align=center />
    <img src="/ReadMeImgs/444.gif" width = "250" height = "541" alt="" align=center />
    <img src="/ReadMeImgs/555.gif" width = "250" height = "541" alt="" align=center />
<div />

### 2.Install
  
#### CocoaPods
  - Add the following to your Podfile: ``` pod 'HSongPopUpAssistant' ```
  - And ``` pod install ``` in your Terminal
### 3.Use
  - just ``` import HSongPopUpAssistant ```
  - And
    ```
    // pop reset toast
    PopUpAssistant.shared.showToast(.success, mainTitle: "提交成功", subTitle: "提交是真的成功了")
    // pop your custom view
    let centerView = CustomCenterView(frame: CGRect(x: 0, y: 0, width: 300, height: 230))
    centerView.layer.cornerRadius = 15
    PopUpAssistant.shared.showCustomView(centerView, position: .center, useCover: true)
    
    ```
- For reset toast, you can set the configure what you like
```
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
    
    /// 需要震动效果
    var haveVibration = false
    
}

```
  ### 4.Author

  Thered-key

  ### 5.License

  `HSongPopUpAssistant` is available under the MIT license. See the [LICENSE](LICENSE) file for more info.

  ---
  
