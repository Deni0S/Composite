# Composite Pattern Implementation **[🇷🇺 Rus](./README.RU.md)**
[![Status](https://img.shields.io/badge/status-deprecated-red)](#)
[![Purpose](https://img.shields.io/badge/purpose-educational%20%2F%20history-blue)](#)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](./LICENSE)

> **This project is no longer maintained.**
> It is kept as an educational subproject for reference and historical purposes.
> The code may be incomplete, outdated, or contain educational simplifications.

An implementation of the **Composite** design pattern in **Swift** within the project.

## Screenshots
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="Screens/Screenshot_1_Dark.png">
  <source media="(prefers-color-scheme: light)" srcset="Screens/Screenshot_1_Light.png">
  <img alt="First page of the file hierarchy" src="Screens/Screenshot_1_Dark.png" width="250">
</picture>
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="Screens/Screenshot_2_Dark.png">
  <source media="(prefers-color-scheme: light)" srcset="Screens/Screenshot_2_Light.png">
  <img alt="Nested page of the file hierarchy" src="Screens/Screenshot_2_Dark.png" width="250">
</picture>

## Description
An application has been developed that allows building file nesting hierarchies based on the Composite pattern. The pattern provides a uniform way to work with both individual files and their groups (folders), enabling composite and leaf objects to be handled through a common interface.

## Features
- Building a tree-like structure of files and folders
- A unified interface for working with files and directories
- Recursive processing of nested elements
- Adding, removing, and traversing hierarchy elements

## Pattern Application
The Composite pattern allows client code to interact uniformly with simple (file) and composite (folder) objects, which simplifies the construction and traversal of tree structures with arbitrary nesting.

## Usage Example
```swift
protocol Task {
    func run(completion: @escaping () -> Void)
}

final class ConcretTask: Task {
    public let name: String

    init(name: String) {
        self.name = name
    }

    public func run(completion: @escaping () -> Void) {
        print("start \(self.name)")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            print("completed \(self?.name ?? "")")
            completion()
        }
    }
}

final class CompositeTask: Task {
    public let name: String
    public var tasks: [CompositeTask] = []

    init(name: String) {
        self.name = name
    }

    public func run(completion: @escaping () -> Void) {
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
