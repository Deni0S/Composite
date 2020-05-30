//
//  ConcretTask.swift
//  Composite
//
//  Created by Денис Баринов on 27.5.20.
//  Copyright © 2020 Денис Баринов. All rights reserved.
//

import Foundation

class ConcretTask: Task {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func run(completion: @escaping () -> Void) {
        print("start \(self.name)")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            print("completed \(self?.name ?? "")")
            completion()
        }
    }
}
