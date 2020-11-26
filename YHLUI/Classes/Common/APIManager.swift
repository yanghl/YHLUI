//
//  APIManager.swift
//  YHLUI
//
//  Created by 272789124@qq.com on 10/30/2020.
//  Copyright (c) 2020 272789124@qq.com. All rights reserved.
//

import URLNavigator
import YHLCore

extension URLUI {
    
}

extension URLAnimation {
    public static let cc = UI_PREFIX+"/aa"
}

public extension APIManager {
    func distributeRouterYHLUIService(_ navigator: YHLNavigatorType & NavigatorType) {
        navigator.register(URLUI.animation.CAShapLayer) { (route, params, context) -> UIViewController? in
            let vc = YHLCAShapLayerViewController.init(nibName: nil, bundle: GWBundle.currentBundle)
            return vc 
        }
    }
}
