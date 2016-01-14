//
//  Lock.swift
//  Synco
//
//  Created by asai.yuki on 2016/01/14.
//  Copyright © 2016年 yukiasai. All rights reserved.
//

import Foundation
import ObjectiveC

class Lock {
    func sync<T>(@noescape closure: Void -> T) -> T {
        return Lock.sync(self, closure: closure)
    }
    
    class func sync<T>(object: AnyObject, @noescape closure: Void -> T) -> T {
        enter(object)
        let value = closure()
        exit(object)
        return value
    }
    
    class func enter(object: AnyObject) {
        objc_sync_enter(object)
    }
    
    class func exit(object: AnyObject) {
        objc_sync_exit(object)
    }
}
