import Foundation

public final class Observable<T> {

    public typealias Observer = (Observable<T>, T) -> Void

    private var observers: [Observer]

    public var value: T? {
        didSet {
            if let value = value {
                notifyObservers(value)
            }
        }
    }

    public init(_ value: T? = nil) {
        self.observers = []
        self.value = value
    }

    public func bind(observer: @escaping Observer) {
        self.observers.append(observer)
    }

    private func notifyObservers(_ value: T) {
        self.observers.forEach { [unowned self] observer in
            observer(self, value)
        }
    }
}
