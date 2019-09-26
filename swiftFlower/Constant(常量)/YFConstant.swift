//
//  YFConstant.swift
//  swiftFlower
//
//  Created by 李亚飞 on 2019/9/19.
//  Copyright © 2019 xxxx. All rights reserved.
//

import UIKit


/* ==========================  Window  ========================== */
let KeyWindow                     =  UIApplication.shared.keyWindow

/* ==========================  Screen  ========================== */
let ScreenBounds                  =  UIScreen.main.bounds
let ScreenSize                    =  ScreenBounds.size
let ScreenWidth                   =  CGFloat(ScreenSize.width)
let ScreenHeight                  =  CGFloat(ScreenSize.height)
/* ---------------------------  Safe  --------------------------- */
let SafeAreaStatusBarHeight       =  CGFloat(YFTool.isPhoneX() ? 20.0 : 0.0)
let SafeAreaTopHeight             =  CGFloat(SafeAreaStatusBarHeight + 64.0)
let SafeBottomHeight              =  CGFloat(YFTool.isPhoneX() ? 34.0 : 0.0)
let SafeAreaBottomHeight          =  CGFloat(SafeBottomHeight + 49.0)

let isPhoneXStatusBarHeight       =  CGFloat(YFTool.isPhoneX() ? 44.0 : 20.0)

let isPhoneXNavBarHeight       =  CGFloat(YFTool.isPhoneX() ? 88.0 : 64.0)

/* ==========================  设备  ========================== */
let iPhonese  = __CGSizeEqualToSize(CGSize(width: 640, height: 1136), UIScreen.main.currentMode!.size)
let iPhone  = __CGSizeEqualToSize(CGSize(width: 750, height: 1334), UIScreen.main.currentMode!.size)
let iPhonePlus  = __CGSizeEqualToSize(CGSize(width: 1242, height: 2208), UIScreen.main.currentMode!.size)
let iPhoneX  = __CGSizeEqualToSize(CGSize(width: 828, height: 1792), UIScreen.main.currentMode!.size) || __CGSizeEqualToSize(CGSize(width: 1125, height: 2436), UIScreen.main.currentMode!.size) || __CGSizeEqualToSize(CGSize(width: 1242, height: 2688), UIScreen.main.currentMode!.size)


/* ===========================  Color  =========================== */
//  主题蓝
let Navigation_Blue_Color      =  UIColor.colorWithHexString(colorString: "#007AFF")
//  主题黑
let Theme_Black_Color          =  UIColor.colorWithHexString(colorString: "#000B22", alpha: 0.85)
