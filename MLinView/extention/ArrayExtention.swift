//
//  ArrayExtention.swift
//  BaseKit
//
//  Created by chen on 2020/5/25.
//  Copyright © 2020 chen. All rights reserved.
//

import Foundation

extension Array {
    public func getOrNil(_ index: Int) -> Iterator.Element? {
        count > index && index >= 0 ? self[index] : nil
    }
}
