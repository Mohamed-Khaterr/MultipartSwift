//
//  AudioFile.swift
//  
//
//  Created by Mohamed Khater on 09/10/2024.
//

import Foundation

/// Represents audio file types with associated MIME types and file extensions.
public enum AudioFile: FileContentType {
    
    /// MP3 audio file with MIME type "audio/mpeg".
    case mp3
    
    /// WAV audio file with MIME type "audio/wav".
    case wav
    
    /// The file extension associated with the audio file type.
    ///
    /// - Returns: The file extension as a `String` (e.g., "mpeg" for `.mp3` or "wav" for `.wav`).
    var `extension`: String {
        switch self {
        case .mp3: "mpeg"
        case .wav: "wav"
        }
    }
    
    /// The MIME content type associated with the audio file type.
    ///
    /// - Returns: The MIME content type as a `String` in the format "audio/{type}".
    var contentType: String {
        let type = switch self {
        case .mp3: "mpeg"
        case .wav: "wav"
        }
        return "audio/\(type)"
    }
}
