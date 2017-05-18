//
//  ViewController.swift
//  myFirstSwiftDemo
//
//  Created by lostInWorld on 2017/5/16.
//  Copyright © 2017年 lostInWorld. All rights reserved.
//

import UIKit

// 定义宏
func IS_IOS7() ->Bool {
    return (UIDevice.current.systemVersion as NSString).doubleValue >= 7.0
}
func IS_IOS8() -> Bool {
    return (UIDevice.current.systemVersion as NSString).doubleValue >= 8.0
}
// 颜色
func RGBA(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return (UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a))
}
// 尺寸
let ScreenWidth = UIScreen.main.bounds.size.width
let ScreenHeight = UIScreen.main.bounds.size.height
// 位置
let OriginY = 20

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // 一、UIView 的相关创建方式以及常用方法
        let view = UIView(frame: CGRect(x: (Int(ScreenWidth) - 80)/2, y: OriginY, width: 80, height: 80)) // 初始化视图并设置位置
        view.backgroundColor = UIColor.purple
        view.layer.cornerRadius = 40 // 设置圆角 一般取控件宽度的一半则为圆形(宽高一致的时候)
        view.clipsToBounds = true // 要设置成圆形还需要这一方法，超出边界的切掉
        self.view.addSubview(view) // 添加进视图中
        // 二、UILabel 的相关创建方式以及常用方法
        let label = UILabel(frame: CGRect(x: 0, y:OriginY + 100, width: Int(ScreenWidth), height: 80))
        label.text = "First Label (ˇˍˇ)" // 文本内容
        label.textColor = RGBA(r: 167, g: 283, b: 237, a: 1.0) // 文本字体颜色
        label.backgroundColor = UIColor.red
        label.font = UIFont.systemFont(ofSize: 28, weight: 10) // 字体大小设置
        label.textAlignment = NSTextAlignment.center // 文本位置，主要有居中 靠左 靠右 三种
        label.numberOfLines = 0 // 设置文本最大行数 “0”为表示对行数不作限制
        self.view.addSubview(label)
        
        // 三、 UIButton 的相关创建方式以及常用方法
        /*
         按钮有下面四种类型：
         UIButtonType.system：前面不带图标，默认文字颜色为蓝色，有触摸时的高亮效果
         UIButtonType.custom：定制按钮，前面不带图标，默认文字颜色为白色，无触摸时的高亮效果
         UIButtonType.contactAdd：前面带“+”图标按钮，默认文字颜色为蓝色，有触摸时的高亮效果
         UIButtonType.detailDisclosure：前面带“!”图标按钮，默认文字颜色为蓝色，有触摸时的高亮效果
         UIButtonType.infoDark：为感叹号“!”圆形按钮
         UIButtonType.infoLight：为感叹号“!”圆形按钮
         */
        let button:UIButton = UIButton(type:.system)
        button.frame = CGRect(x: (Int(ScreenWidth) - 80)/2, y: OriginY + 200, width: 80, height: 80)
        button.backgroundColor = UIColor.gray
        button.layer.cornerRadius = 40
        button.clipsToBounds = true
        button.setTitle("Click Me!", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(Click(_:)), for: .touchUpInside)
        
        self.view.addSubview(button)
        
        // P.S 子类能继承父类的相关方法，如UILabel、UIButton等常见控件就是继承自UIView的，所以能使用UIView的某些方法
    }
    // 按钮触发方法
    func Click(_ button:UIButton) {
        print("boom!")
    }



}

