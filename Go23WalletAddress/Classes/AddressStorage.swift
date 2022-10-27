//
//  AddressStorage.swift
//  DerbyWalletAddress
//
//  Created by Tatan.
//

import Foundation

public typealias AddressKey = String

public protocol AddressStorage {
    subscript(key: AddressKey) -> DerbyWallet.Address? { get set }
}
