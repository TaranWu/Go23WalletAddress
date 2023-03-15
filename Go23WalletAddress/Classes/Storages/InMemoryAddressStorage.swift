//
//  InMemoryAddressStorage.swift
//  DerbyWalletAddress
//
//  Created by Tatan.
//

import Foundation
import Go23WalletCore

public class InMemoryAddressStorage: AddressStorage {
    private var cache: AtomicDictionary<AddressKey, Go23Wallet.Address>

    public var allValues: [AddressKey: Go23Wallet.Address] {
        cache.values
    }

    public var count: Int {
        cache.values.count
    }

    public init(values: [AddressKey: Go23Wallet.Address] = [:]) {
        cache = .init(value: values)
    }

    public subscript(key: AddressKey) -> Go23Wallet.Address? {
        get { cache[key] }
        set { cache[key] = newValue }
    } 
}
