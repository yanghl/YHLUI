//
//  APIManager_Example.swift
//  YHLUI
//
//  Created by 272789124@qq.com on 10/30/2020.
//  Copyright (c) 2020 272789124@qq.com. All rights reserved.
//
import UIKit
import URLNavigator
import YHLCore
import YHLUI

/// 这里是给Example工程的调用示例
extension APIManager {
    func registAllRouter() {
        distributeRouterYHLUIService(YHLNavigator.shared)
        distributeRouterYHLUIServiceExample(YHLNavigator.shared)
    }
}
