//
//  EthereumAddress_fromWeb3SwiftPod.swift
//  DerbyWalletFoundation
//
//  Created by Tatan.
//

import web3swift

public typealias EthereumAddress_fromWeb3SwiftPod = web3swift.EthereumAddress
extension EthereumAddress_fromWeb3SwiftPod: CustomStringConvertible {
    public var description: String {
        return address
    }
}
