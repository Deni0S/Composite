import Foundation

protocol Task {
    func run(completion: @escaping () -> Void)
}

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
