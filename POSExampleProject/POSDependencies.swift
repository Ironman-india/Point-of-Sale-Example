//
//  Dependencies.swift
//  POSExampleProject
//
//  Created by Dan on 2017-03-20.
//  Copyright © 2017 Dan. All rights reserved.
//

import Foundation
import Swinject

class Dependencies {
    fileprivate static var dependencyInjector: Container?
    fileprivate static var dependencyAssembler: Assembler?
    
    static func main() -> Container {
        if dependencyInjector == nil {
            dependencyAssembler = try? Assembler(assemblies: [MainAssembly()])
            
            dependencyInjector = dependencyAssembler!.resolver as? Container
        }
    }
}

class MainAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(POSBackendClient.self) { ($: Resolver) in
            return DefaultPOSBackendClient(urlSession: URLSession.shared)
        }
        
        container.register(POSNetworkService.self) { ($: Resolver) in
            return DefaultPOSNetworkService()
    }
}
