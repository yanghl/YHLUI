//
//  ModuleTool.swift
//  YHLUI
//
//  Created by 272789124@qq.com on 10/30/2020.
//  Copyright (c) 2020 272789124@qq.com. All rights reserved.
//


import Foundation
import YHLCore

class GWBundle: BundleResource {
    
    static var bundleName: String { get { "YHLUI" } }
    // 这个是固定写法
    static var bundleClass: AnyClass { get { GWBundle.self } }
    
    static func gw_loadXib(xibName: String) -> [Any]? {
        return GWBundle.currentBundle.loadNibNamed(xibName, owner: nil, options: nil)
    }
}
