//
//  ValueType.swift
//
//
//  Created by Mohamed Khater on 08/10/2024.
//

import Foundation

/// Represents various types of values that can be used in requests,
/// including strings, binary data, and files.
public enum ValueType {
    
    /// A string value with an optional specified encoding.
    ///
    /// - Parameters:
    ///   - value: The string value.
    ///   - encoding: The encoding of the string (default is UTF-8).
    case value(String, encoding: String.Encoding = .utf8)
    
    /// A binary data value.
    ///
    /// - Parameter data: The binary data.
    case data(Data)
    
    /// A single file value.
    ///
    /// - Parameter file: The file associated with this value.
    case file(File)
    
    /// An array of file values.
    ///
    /// - Parameter files: The array of files associated with this value.
    case files([File])
}

