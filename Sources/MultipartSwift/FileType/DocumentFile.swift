//
//  DocumentFile.swift
//  
//
//  Created by Mohamed Khater on 09/10/2024.
//

import Foundation

/// Represents document file types with associated MIME types and file extensions.
public enum DocumentFile: FileContentType {
    
    /// PDF document with MIME type "application/pdf".
    case pdf
    
    /// Microsoft Word document with MIME type "application/msword".
    case word
    
    /// Microsoft Excel document with MIME type "application/vnd.ms-excel".
    case excel
    
    /// JSON file with MIME type "application/json".
    case json
    
    /// XML file with MIME type "application/xml".
    case xml
    
    /// Binary file with MIME type "application/octet-stream".
    case binary
    
    /// The file extension associated with the document file type.
    ///
    /// - Returns: The file extension as a `String` (e.g., "pdf" for `.pdf` or "msword" for `.word`).
    var `extension`: String {
        switch self {
        case .pdf: "pdf"
        case .word: "msword"
        case .excel: "vnd.ms-excel"
        case .json: "json"
        case .xml: "xml"
        case .binary: "octet-stream"
        }
    }
    
    /// The MIME content type associated with the document file type.
    ///
    /// - Returns: The MIME content type as a `String` in the format "application/{type}".
    var contentType: String {
        let type = switch self {
        case .pdf: "pdf"
        case .word: "msword"
        case .excel: "vnd.ms-excel"
        case .json: "json"
        case .xml: "xml"
        case .binary: "octet-stream"
        }
        return "application/\(type)"
    }
}
