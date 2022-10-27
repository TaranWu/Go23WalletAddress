// Copyright © 2018 Stormbird PTE. LTD.

import Foundation
import TrustKeystore

extension DerbyWallet.Address {
    //TODO multiple versions of init() that accept address types from other libraries goes here. Anymore?
    public init(address: EthereumAddress_fromWeb3SwiftPod) {
        self = .ethereumAddress(eip55String: address.address)
    }

    public init(address: TrustKeystore.Address) {
        self = .ethereumAddress(eip55String: address.eip55String)
    }

    public init?(possibleAddress: Any?) {
        if let address = possibleAddress as? DerbyWallet.Address {
            self = address
        } else if let address = possibleAddress as? EthereumAddress_fromEthereumAddressPod {
            self = .ethereumAddress(eip55String: address.address)
        } else if let address = possibleAddress as? EthereumAddress_fromWeb3SwiftPod {
            self = .ethereumAddress(eip55String: address.address)
        } else {
            return nil
        }
    }

    public func sameContract(as contract: EthereumAddress_fromWeb3SwiftPod) -> Bool {
        return eip55String == contract.address
    }
}

extension EthereumAddress_fromWeb3SwiftPod {
    public init(address: DerbyWallet.Address) {
        //EthereumAddress(Data) is much faster than EthereumAddress(String). This is significant because we can make a few hundred calls
//        let data = Data.fromHex(address.eip55String)!
//        self.init(data)!

        //During testing we found that EthereumAddress(address.eip55String) is faster then self.init(data)!
        //approx time is 0.000980973243713379 while with using self.init(data)! is 2.8967857360839844e-05 seconds.

        self.init(address.eip55String)!
    }
}

extension TrustKeystore.Address {
    public init(address: DerbyWallet.Address) {
        self.init(uncheckedAgainstNullAddress: address.eip55String)!
    }
}
