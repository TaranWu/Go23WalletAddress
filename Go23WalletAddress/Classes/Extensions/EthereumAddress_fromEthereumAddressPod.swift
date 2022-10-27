//
//  Go23EthereumAddress+typealias.swift
//  Go23EthereumAddress
//
//  Created by Tatan.

import Go23EthereumAddress

public typealias EthereumAddress_fromEthereumAddressPod = EthereumAddress
extension EthereumAddress: CustomStringConvertible {
    public var description: String {
        address
    }
}
