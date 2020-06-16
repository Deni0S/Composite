//
//  Task.swift
//  Composite
//
//  Created by Денис Баринов on 27.5.20.
//  Copyright © 2020 Денис Баринов. All rights reserved.
//

import Foundation

protocol Task {
    func run(completion: @escaping () -> Void)
}
