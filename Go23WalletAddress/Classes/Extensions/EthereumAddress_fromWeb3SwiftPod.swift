//
//  EthereumAddress_fromWeb3SwiftPod.swift
//  DerbyWalletFoundation
//
//  Created by Tatan.
//

import Go23Web3Swift

public typealias EthereumAddress_fromWeb3SwiftPod = Go23Web3Swift.EthereumAddress
extension EthereumAddress_fromWeb3SwiftPod: CustomStringConvertible {
    public var description: String {
        return address
    }
}
