//
//  FileAddressStorage.swift
//  DerbyWalletAddress
//
//  Created by Tatan.
//

import Foundation
import UIKit
import Go23WalletCore

public class FileAddressStorage: AddressStorage {
    private var lastCount: Int
    private var persistentStorage: StorageType
    private let inMemoryStorage: InMemoryAddressStorage
    private let fileName: String
    private let dropToPersistentStorageThreshold: Int = 1000

    public subscript(key: AddressKey) -> DerbyWallet.Address? {
        get { inMemoryStorage[key] }
        set { addOrUpdate(address: newValue, for: key) }
    }

    public var cachedAddressCount: Int { return inMemoryStorage.count }
    public var persistantAddressCount: Int { return lastCount }

    public init(fileName: String = "addresses", persistentStorage: StorageType = FileStorage(fileExtension: "json")) {
        self.fileName = fileName
        self.persistentStorage = persistentStorage

        let snapshot: [String: DerbyWallet.Address] = persistentStorage.load(forKey: fileName, defaultValue: [:])
        inMemoryStorage = .init(values: snapshot)
        lastCount = snapshot.count
        let _ = NotificationCenter.default.addObserver(forName: UIApplication.willTerminateNotification, object: nil, queue: .main) { _ in
            self.persist(self.inMemoryStorage.allValues)
        }
    }

    private func addOrUpdate(address: DerbyWallet.Address?, for key: String) {
        inMemoryStorage[key] = address

        if inMemoryStorage.count - lastCount > dropToPersistentStorageThreshold {
            persist(inMemoryStorage.allValues)
            lastCount = inMemoryStorage.count
        }
    }

    private func persist(_ values: [String: DerbyWallet.Address]) {
        guard let data = try? JSONEncoder().encode(values) else { return }

        persistentStorage.setData(data, forKey: fileName)
    }
}
