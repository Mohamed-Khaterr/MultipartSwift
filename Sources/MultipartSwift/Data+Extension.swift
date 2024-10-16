//
//  Data+Extension.swift
//
//
//  Created by Mohamed Khater on 10/10/2024.
//

import Foundation

extension Data {
    mutating func append(_ string: String) {
        guard let data = string.data(using: .utf8) else { return }
        append(data)
    }
}
