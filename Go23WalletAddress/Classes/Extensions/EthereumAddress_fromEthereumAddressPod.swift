//
//  EthereumAddressEthereumAddress+typealias.swift
//  DerbyWalletAddress
//
//  Created by Tatan.

import EthereumAddress

public typealias EthereumAddress_fromEthereumAddressPod = EthereumAddress
extension EthereumAddress: CustomStringConvertible {
    public var description: String {
        address
    }
}
