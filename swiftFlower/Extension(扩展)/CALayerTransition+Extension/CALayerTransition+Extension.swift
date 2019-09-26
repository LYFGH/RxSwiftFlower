//
//  CALayerTransition+Extension.swift
//  Operate-Swift
//
//  Created by 李亚飞 on 2019/5/31.
//  Copyright © 2019 sugar. All rights reserved.
//

import QuartzCore
/**
 * 动画类型
 */
enum TransitionAnimType : String {
//    ["rippleEffect","suckEffect","pageCurl","oglFlip","cube","reveal","pageUnCurl"]
    /**水波*/
    case  RippleEffect  =  "rippleEffect"
    /**吸走*/
    case  SuckEffect    =  "suckEffect"
    /**翻开书本*/
    case  PageCurl      =  "pageCurl"
    /**正反翻转*/
    case  OglFlip       =  "oglFlip"
    /**正方体*/
    case  Cube          =  "cube"
    /**push推开*/
    case  Reveal        =  "reveal"
    /**合上书本*/
    case  PageUnCurl    =  "pageUnCurl"
    /**随机*/
    case  Ramdom        =  "ramdom"
}
/**
 * 动画方向
 */
enum TransitionSubType : Int {
    /**从上边*/
    case  FromTop = 0
    /**从左*/
    case  FromLeft
    /**从下*/
    case  FromBotoom
    /**从右*/
    case  FromRight
    /**随机*/
    case  FromRamdom
    
}
/*
 *  动画曲线
 */
enum TransitionCurve : Int {
    /**默认*/
    case  Default = 0
    /**缓进*/
    case  EaseIn
    /**缓出*/
    case  EaseOut
    /**缓进缓出*/
    case  EaseInEaseOut
    /**线性*/
    case  Linear
    /**随机*/
    case  CurveRamdom
}

/**
 转场动画
 
 @param animType 转场动画类型
 @param subType 转动动画曲线
 @param curve 转动动画曲线
 @param duration 转动动画时长
 @return 转场动画实例
 */
extension CALayer{
    func layerAnimation(animType: TransitionAnimType, subType: TransitionSubType, curveType: TransitionCurve, duration: Double){
        
        let key: String = "transition"
        
        if self.animation(forKey: key) != nil {
            self.removeAnimation(forKey: key)
        }
        
        let transition: CATransition  = CATransition()
        
        //动画时长
        transition.duration = duration
        
        //动画类型
        transition.type = CATransitionType(rawValue: animaTypeWithTransitionType(type: animType))
        
        //动画方向
        transition.subtype = animaSubtype(subType: subType)
        
        
        //缓动函数
        transition.timingFunction = CAMediaTimingFunction(name: curve(curve: curveType))

        
        //完成动画删除
        transition.isRemovedOnCompletion = true
        
        add(transition, forKey: key)
        
    }
    
    //返回动画曲线
    
    //曲线数组
    func curve(curve: TransitionCurve) -> CAMediaTimingFunctionName {
        let funcNames: [CAMediaTimingFunctionName]=[.default,.easeIn,.easeInEaseOut,.easeOut,.linear]
        if curve.rawValue == 5{
            let i : Int = Int(arc4random_uniform(UInt32(funcNames.count)))
            return funcNames[i]
        }else{
            return funcNames[curve.rawValue]
        }
    }

    //返回动画方向
    func animaSubtype(subType: TransitionSubType) -> CATransitionSubtype {
        //设置转场动画的方向
        let subtypes: [CATransitionSubtype] = [.fromTop,.fromLeft,.fromBottom,.fromRight];
        if subType.rawValue == 4{
            let i : Int = Int(arc4random_uniform(UInt32(subtypes.count)))
            return subtypes[i]
        }else{
          return subtypes[subType.rawValue]
        }
        

    }
    
    
    //返回动画类型
    func animaTypeWithTransitionType(type: TransitionAnimType) -> String {
        //设置转场动画的类型
        let animArray: [String] = ["rippleEffect","suckEffect","pageCurl","oglFlip","cube","reveal","pageUnCurl"]

        let i : Int = Int(arc4random_uniform(UInt32(animArray.count)))

        let typeStr: String = animArray.contains(type.rawValue) ? type.rawValue : animArray[i]

        return typeStr
    }
    
    
    
    
    
}
