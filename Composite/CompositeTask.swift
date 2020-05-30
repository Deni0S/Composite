//
//  CompositeTask.swift
//  Composite
//
//  Created by Денис Баринов on 27.5.20.
//  Copyright © 2020 Денис Баринов. All rights reserved.
//

import Foundation

class CompositeTask: Task {
    let name: String
    var tasks: [CompositeTask] = []
    
    init(name: String) {
        self.name = name
    }
    
    func run(completion: @escaping () -> Void) {
        let dispatchGroup = DispatchGroup()
        for task in tasks {
            dispatchGroup.enter()
            task.run { dispatchGroup.leave() }
        }
        dispatchGroup.notify(queue: .main) {
            completion()
        }
    }
}
