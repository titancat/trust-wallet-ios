// Copyright SIX DAY LLC. All rights reserved.

import Foundation

struct WalletInfoViewModel {

    let wallet: Wallet

    init(
        wallet: Wallet
    ) {
        self.wallet = wallet
    }

    var title: String {
        return NSLocalizedString("Manage", value: "Manage", comment: "")
    }

    var nameTitle: String {
        return NSLocalizedString("Name", value: "Name", comment: "")
    }

    var types: [WalletInfoType] {
        switch wallet.type {
        case .privateKey(let account):
            return [
                .exportKeystore(account),
                .exportPrivateKey(account),
                .copyAddress(account.address),
            ]
        case .hd(let account):
            return [
                .exportRecoveryPhrase(account),
                .exportPrivateKey(account),
                .exportKeystore(account),
                .copyAddress(account.address),
            ]
        case .address(let address):
            return [
                .copyAddress(address),
            ]
        }
    }
}
