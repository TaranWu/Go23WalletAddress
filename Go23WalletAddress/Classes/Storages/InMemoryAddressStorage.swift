//
//  InMemoryAddressStorage.swift
//  DerbyWalletAddress
//
//  Created by Tatan.
//

import Foundation
import DerbyWalletCore

public class InMemoryAddressStorage: AddressStorage {
    private var cache: AtomicDictionary<AddressKey, DerbyWallet.Address>

    public var allValues: [AddressKey: DerbyWallet.Address] {
        cache.values
    }

    public var count: Int {
        cache.values.count
    }

    public init(values: [AddressKey: DerbyWallet.Address] = [:]) {
        cache = .init(value: values)
    }

    public subscript(key: AddressKey) -> DerbyWallet.Address? {
        get { cache[key] }
        set { cache[key] = newValue }
    } 
}
