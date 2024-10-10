//
//  ImageFile.swift
//  
//
//  Created by Mohamed Khater on 09/10/2024.
//

import Foundation

/// Represents image file types with associated MIME types and file extensions.
public enum ImageFile: FileContentType {
    
    /// JPEG image file with MIME type "image/jpg".
    case jpg
    
    /// PNG image file with MIME type "image/png".
    case png
    
    /// GIF image file with MIME type "image/gif".
    case gif
    
    /// The file extension associated with the image file type.
    ///
    /// - Returns: The file extension as a `String` (e.g., "jpg" for `.jpg`, "png" for `.png`).
    var `extension`: String {
        switch self {
        case .jpg: "jpg"
        case .png: "png"
        case .gif: "gif"
        }
    }
    
    /// The MIME content type associated with the image file type.
    ///
    /// - Returns: The MIME content type as a `String` in the format "image/{type}".
    var contentType: String {
        let type = switch self {
        case .jpg: "jpg"
        case .png: "png"
        case .gif: "gif"
        }
        return "image/\(type)"
    }
}

