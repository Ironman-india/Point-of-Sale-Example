//
//  POSBResponseAdapter.swift
//  POSExampleProject
//
//  Created by Dan on 2017-03-21.
//  Copyright © 2017 Dan. All rights reserved.
//

import Foundation



class POSBModelAdapter {
    
    func toPOSItem(_ bItem: POSBItem) -> POSItem {
        let item = POSItem(name: bItem.name)
        item.description = bItem.description ?? item.description
        item.imageUrl = bItem.image_url ?? item.imageUrl
        item.basePrice = bItem.base_price ?? item.basePrice
        if bItem.modifiers != nil && !bItem.modifiers!.isEmpty {
            item.modifiers = bItem.modifiers!.map { self.toPOSModifier($0) }
        }
        return item
    }
    
    func toPOSModifier(_ bModifier: POSBModifier) -> POSModifier {
        let modifier = POSModifier(name: bModifier.name)
        modifier.imageUrl = bModifier.image_url ?? modifier.imageUrl
        if bModifier.unit_type != nil && !bModifier.unit_type!.isEmpty {
            if bModifier.unit_type == UnitType.list.rawValue {
                modifier.unitType = UnitType.list
            } else if bModifier.unit_type == UnitType.number.rawValue {
                modifier.unitType =  UnitType.number
            }
        }
        if bModifier.unit_bounds != nil && !bModifier.unit_bounds!.isEmpty {
            modifier.unitBounds = PriceBounds.init(csvBounds: bModifier.unit_bounds!)
        }
        modifier.priceAddition = bModifier.price_addition ?? modifier.priceAddition
        modifier.priceMultiplier = bModifier.price_multiplier ?? modifier.priceMultiplier
        modifier.required = bModifier.required ?? modifier.required
        if bModifier.options != nil && !bModifier.options!.isEmpty {
            modifier.options = bModifier.options!.map { self.toPOSOption($0) }
        }
        return modifier
    }
    
    func toPOSOption(_ bOption: POSBOption) -> POSOption {
        let option = POSOption(name: bOption.name)
        option.description = bOption.description ?? option.description
        option.priceAddition = bOption.price_addition ?? option.priceAddition
        option.priceMultiplier = bOption.price_multiplier ?? option.priceMultiplier
        return option
    }
}
