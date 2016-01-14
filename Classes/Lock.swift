//
//  Lock.swift
//  Synco
//
//  Created by asai.yuki on 2016/01/14.
//  Copyright © 2016年 yukiasai. All rights reserved.
//

import Foundation
import ObjectiveC

public class Lock {
    public func sync<T>(@noescape closure: Void -> T) -> T {
        return Lock.sync(self, closure: closure)
    }
    
    public class func sync<T>(object: AnyObject, @noescape closure: Void -> T) -> T {
        enter(object)
        let value = closure()
        exit(object)
        return value
    }
    
    public class func enter(object: AnyObject) {
        objc_sync_enter(object)
    }
    
    public class func exit(object: AnyObject) {
        objc_sync_exit(object)
    }
}
