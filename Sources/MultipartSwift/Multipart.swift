//
//  Multipart.swift
//  
//
//  Created by Mohamed Khater on 08/10/2024.
//

import Foundation

/// A class that represents a multipart request, typically used for
/// sending files and data in a single HTTP request.
public class Multipart {
    /// The boundary string used to separate different parts of the multipart data.
    public let boundary: String
    
    /// The content disposition type for the multipart request, indicating how the content should be handled.
    private let contentDisposition: ContentDisposition
    
    /// The binary data representing the entire multipart body.
    private var data: Data
    
    /// The HTTP header for the multipart request, including the content type and boundary.
    ///
    /// - Returns: A tuple containing the value and field of the HTTP header.
    public var httpHeader: (value: String, field: String) {
        ("multipart/\(contentDisposition.value); boundary=\(boundary)", "Content-Type")
    }
    
    /// The HTTP body of the multipart request.
    ///
    /// This property appends the final boundary to the data before returning it.
    ///
    /// - Returns: The binary data representing the multipart body.
    public var httpBody: Data {
        appendFinalBoundary()
        return data
    }
    
    // MARK: - Initializer
    
    /// Initializes a new `Multipart` instance with an optional boundary and content disposition.
    ///
    /// - Parameters:
    ///   - boundary: The boundary string to separate parts of the multipart data (default is a new UUID).
    ///   - contentDisposition: The content disposition type (default is `.formData`).
    public init(boundary: String = UUID().uuidString, contentDisposition: ContentDisposition = .formData) {
        self.boundary = boundary
        self.contentDisposition = contentDisposition
        self.data = .init()
    }
    
    // MARK: - Public Methods
    
    /// Sets the fields for the multipart request.
    ///
    /// - Parameter fields: A dictionary containing field names as keys and their corresponding `ValueType` values.
    /// This function allows you to specify various types of data to be included in the multipart request, such as
    /// strings, binary data, or files.
    ///
    /// - Note: This method may need to handle the encoding of string values and the formatting of files as part of the
    /// multipart body.
    public func setFields(_ fields: [String: ValueType]) {
        for (filedName, type) in fields {
            appendEncapsulationBoundary()
            appendSeparator()
            
            switch type {
            case .value(let value, let encoding):
                disposition(filedName: filedName)
                appendSeparator(count: 2)
                appendString(value, encoding: encoding)
                appendSeparator()
                
            case .data(let other):
                disposition(filedName: filedName)
                appendSeparator(count: 2)
                data.append(other)
                appendSeparator()
                
            case .file(let file):
                disposition(filedName: filedName, file: "\(file.name).\(file.extension)")
                appendSeparator()
                contentType(file.contentType)
                appendSeparator(count: 2)
                data.append(file.content)
                appendSeparator()
                
            case .files(let files):
                for file in files {
                    disposition(filedName: filedName, file: "\(file.name).\(file.extension)")
                    appendSeparator()
                    contentType(file.contentType)
                    appendSeparator(count: 2)
                    data.append(file.content)
                    appendSeparator()
                }
            }
        }
    }
    
    // MARK: - Private Methods
    private func disposition(filedName: String, file: String? = nil) {
        if let file = file {
            data.append("Content-Disposition: \(contentDisposition.value); name=\"\(filedName)\"; filename=\"\(file)\"")
        } else {
            data.append("Content-Disposition: \(contentDisposition.value); name=\"\(filedName)\"")
        }
    }
    
    private func contentType(_ type: String) {
        data.append("Content-Type: \(type)")
    }
    
    private func appendSeparator(count: Int = 1) {
        let separator: String = "\r\n"
        for _ in 0..<count {
            data.append(separator)
        }
    }
    
    private func appendString(_ string: String, encoding: String.Encoding) {
        guard let other = string.data(using: encoding) else { return }
        data.append(other)
    }
    
    private func appendEncapsulationBoundary() {
        data.append("--\(boundary)")
    }
    
    private func appendFinalBoundary() {
        data.append("--\(boundary)--")
    }
}
