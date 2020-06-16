//
//  SymbolExtention.swift
//  MLinViewSample
//
//  Created by chen on 2020/6/16.
//  Copyright © 2020 chen. All rights reserved.
//

import Foundation


precedencegroup RunPrecedenc {
    associativity: left // 代表没有结合性
    higherThan: BitwiseShiftPrecedence
    assignment: false
}

infix operator =>: RunPrecedenc

// 将入参 o 作为作用域执行闭包，并返回修饰后的入参
public func => <T: Any>(_ o: T, run: (_ v: T) -> Void) -> T {
    run(o)
    return o
}


precedencegroup ApplyPrecedenc {
    associativity: left // 代表没有结合性
    higherThan: RunPrecedenc
    assignment: false
}

infix operator =>>: ApplyPrecedenc

// 将入参 o 作为作用域执行闭包，无返回
public func =>> <T: Any>(_ o: T, run: (_ v: T) -> Void) {
    run(o)
}


precedencegroup RunNotNilPrecedenc {
    associativity: left // 代表没有结合性
    higherThan: BitwiseShiftPrecedence
    assignment: true
}

infix operator =>?: RunNotNilPrecedenc

// 将入参 o 作为作用域执行闭包，在入参非空的情况下执行
public func =>? <T: Any>(_ o: T?, run: (_ v: T) -> Void){
    if o != nil { run(o!) }
}
