//
//  FileContentType.swift
//  
//
//  Created by Mohamed Khater on 09/10/2024.
//

import Foundation

/// A protocol that defines the required properties for file content types,
/// including the file extension and the MIME content type.
protocol FileContentType {
    
    /// The file extension associated with the content type.
    ///
    /// - Returns: The file extension as a `String`.
    var `extension`: String { get }
    
    /// The MIME content type associated with the file.
    ///
    /// - Returns: The MIME content type as a `String`.
    var contentType: String { get }
}
