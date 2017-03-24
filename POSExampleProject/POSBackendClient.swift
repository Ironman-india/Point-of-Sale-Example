//
//  POSBackendService.swift
//  POSExampleProject
//
//  Created by Dan on 2017-03-20.
//  Copyright © 2017 Dan. All rights reserved.
//

import Foundation
import RxSwift
import ObjectMapper

struct POSBackendServiceEndpoints {
    static let Inventory = "items"
    static let Orders = "orders"
    static let Receipts = "receipts"
    
}

public protocol POSBackendService {
    
    func getInventory() -> Observable<[POSInventory]>
    
    func getReceipt(_ orderId: String) -> Observable<POSReceipt>
    
    func searchForProduct(_ name: String) -> Observable<[POSItem]>
    
    func attemptPurchase(_ cart: POSCart) -> Observable<POSOrder>
}


open class DefaultPOSBackendService: POSBackendService {
    
    // MARK: - Properties
    
    fileprivate let urlSession: URLSession
    fileprivate static let ServerDomain: String = "http://localhost:3000"
    
    // MARK: - Initialization

    // MARK - POSBackendService Implementation
    
    func getInventory() -> Observable<[POSInventory]> {
        
    }
    
}
