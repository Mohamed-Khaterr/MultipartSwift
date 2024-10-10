//
//  FileType.swift
//
//
//  Created by Mohamed Khater on 08/10/2024.
//

import Foundation

/// Represents different types of files, such as images, videos, audio, and documents.
public enum FileType {
    
    /// Image file type, such as JPG, PNG, or GIF.
    case image(ImageFile)
    
    /// Video file type, such as MP4 or WebM.
    case video(VideoFile)
    
    /// Audio file type, such as MP3 or WAV.
    case audio(AudioFile)
    
    /// Document file type, such as PDF, Word, or Excel.
    case document(DocumentFile)
    
    /// The file type conforming to `FileContentType`, used to access
    /// the file's extension and MIME content type.
    ///
    /// - Returns: An instance of `FileContentType` corresponding to the specific file type.
    var file: FileContentType {
        switch self {
        case .image(let imageFile): imageFile
        case .video(let videoFile): videoFile
        case .audio(let audioFile): audioFile
        case .document(let documentFile): documentFile
        }
    }
}
