//
//  AddressStorage.swift
//  DerbyWalletAddress
//
//  Created by Tatan.
//

import Foundation

public typealias AddressKey = String

public protocol AddressStorage {
    subscript(key: AddressKey) -> Go23Wallet.Address? { get set }
}
