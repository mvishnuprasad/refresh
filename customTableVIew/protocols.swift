//
//  protocols.swift
//  customTableVIew
//
 
//

import Foundation
protocol TableStatusDelegate: AnyObject {
    func setStatus(_ value: Bool, index : Int)
}
