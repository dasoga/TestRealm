//
//  ShaFunction.swift
//  TestRealm
//
//  Created by Omar Rodriguez on 7/10/19.
//  Copyright © 2019 Dante Solorio. All rights reserved.
//

import CommonCrypto
import Foundation

extension String {
    func sha512() -> Data? {
        let stringData = data(using: String.Encoding.utf8)!
        var result = Data(count: Int(CC_SHA512_DIGEST_LENGTH))
        _ = result.withUnsafeMutableBytes { resultBytes in
            stringData.withUnsafeBytes { stringBytes in
                CC_SHA512(stringBytes, CC_LONG(stringData.count), resultBytes)
            }
        }
        return result
    }
}
