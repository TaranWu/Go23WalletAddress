//
//  AtomicDictionary.swift
//  DerbyWallet
//
//  Created by Tatan.
//

import Foundation

public class AtomicDictionary<Key: Hashable, Value> {
    private var cache = [Key: Value]()
    private let queue: DispatchQueue

    public subscript(server: Key) -> Value? {
        get {
            var element: Value?
            dispatchPrecondition(condition: .notOnQueue(queue))
            queue.sync { [unowned self] in
                element = self.cache[server]
            }
            return element
        }
        set {
            dispatchPrecondition(condition: .notOnQueue(queue))
            queue.sync { [unowned self] in
                self.cache[server] = newValue
            }
        }
    }
    
    public init(queue: DispatchQueue = DispatchQueue(label: "org.Go23Walletswift.atomicDictionary", qos: .background), value: [Key: Value] = [:]) {
        self.queue = queue
        self.cache = value
    }

    public func set(value: [Key: Value]) {
        dispatchPrecondition(condition: .notOnQueue(queue))
        queue.sync { [unowned self] in
            self.cache = value
        }
    }

    public func removeAll() {
        dispatchPrecondition(condition: .notOnQueue(queue))
        queue.sync { [unowned self] in
            self.cache.removeAll()
        }
    }

    @discardableResult public func removeValue(forKey key: Key) -> Value? {
        var element: Value?
        dispatchPrecondition(condition: .notOnQueue(queue))
        queue.sync { [unowned self] in
            element = self.cache.firstIndex(where: { $0.key == key }).flatMap { self.cache.remove(at: $0).value }
        }
        return element
    }

    public var count: Int {
        return values.count
    }

    public var values: [Key: Value] {
        var elements: [Key: Value] = [:]
        dispatchPrecondition(condition: .notOnQueue(queue))
        queue.sync { [unowned self] in
            elements = self.cache
        }

        return elements
    }

    public func forEach(body: ((key: Key, value: Value)) -> Void) {
        dispatchPrecondition(condition: .notOnQueue(queue))
        queue.sync { [unowned self] in
            self.cache.forEach(body)
        }
    }

    public func contains(where closure: ((_ key: Key, _ value: Value) -> Bool)) -> Bool {
        var value: Bool = false
        dispatchPrecondition(condition: .notOnQueue(queue))
        queue.sync { [unowned self] in
            value = self.cache.contains(where: closure)
        }

        return value
    }
}
