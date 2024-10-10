//
//  File.swift
//  
//
//  Created by Mohamed Khater on 10/10/2024.
//

import Foundation

/// Represents a file with a name, type, and content.
public struct File {
    
    /// The name of the file.
    public let name: String
    
    /// The type of the file, which can be an image, video, audio, or document.
    public let type: FileType
    
    /// The binary content of the file.
    public let content: Data
    
    /// The file extension associated with the file's type.
    ///
    /// - Returns: The file extension as a `String` (e.g., "pdf", "jpg").
    var `extension`: String {
        type.file.extension
    }
    
    /// The MIME content type associated with the file's type.
    ///
    /// - Returns: The MIME content type as a `String` (e.g., "application/pdf", "image/jpg").
    var contentType: String {
        type.file.contentType
    }
    
    /// Initializes a `File` instance with the provided name, type, and content.
    ///
    /// - Parameters:
    ///   - name: The name of the file.
    ///   - type: The type of the file, which can be an image, video, audio, or document.
    ///   - content: The binary content of the file as `Data`.
    public init(name: String, type: FileType, content: Data) {
        self.name = name
        self.type = type
        self.content = content
    }
}
