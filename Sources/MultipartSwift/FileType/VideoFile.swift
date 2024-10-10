//
//  VideoFile.swift
//  
//
//  Created by Mohamed Khater on 09/10/2024.
//

import Foundation

/// Represents video file types with associated MIME types and file extensions.
public enum VideoFile: FileContentType {
    
    /// MP4 video file with MIME type "video/mp4".
    case mp4
    
    /// WebM video file with MIME type "video/webm".
    case webm
    
    /// The file extension associated with the video file type.
    ///
    /// - Returns: The file extension as a `String` (e.g., "mp4" for `.mp4` or "webm" for `.webm`).
    var `extension`: String {
        switch self {
        case .mp4: "mp4"
        case .webm: "webm"
        }
    }
    
    /// The MIME content type associated with the video file type.
    ///
    /// - Returns: The MIME content type as a `String` in the format "video/{type}".
    var contentType: String {
        let type = switch self {
        case .mp4: "mp4"
        case .webm: "webm"
        }
        return "video/\(type)"
    }
}

