//
//  FileTest.swift
//
//
//  Created by Mohamed Khater on 10/10/2024.
//

import XCTest
@testable import MultipartSwift

final class FileTest: XCTestCase {
    func test_ImageFile() {
        let data = Data()
        let fileName = "fileName test"
        let fileType: FileType = .image(.gif)
        let sut = File(name: fileName, type: fileType, content: data)
        
        XCTAssertEqual(sut.name, fileName)
        XCTAssertEqual(sut.type, fileType)
        XCTAssertEqual(sut.content, data)
        XCTAssertEqual(sut.extension, fileType.file.extension)
        XCTAssertEqual(sut.contentType, fileType.file.contentType)
    }
    
    func test_VideoFile() {
        let data = Data()
        let fileName = "fileName test"
        let fileType: FileType = .video(.mp4)
        let sut = File(name: fileName, type: fileType, content: data)
        
        XCTAssertEqual(sut.name, fileName)
        XCTAssertEqual(sut.type, fileType)
        XCTAssertEqual(sut.content, data)
        XCTAssertEqual(sut.extension, fileType.file.extension)
        XCTAssertEqual(sut.contentType, fileType.file.contentType)
    }
    
    func test_DocumentFile() {
        let data = Data()
        let fileName = "fileName test"
        let fileType: FileType = .document(.pdf)
        let sut = File(name: fileName, type: fileType, content: data)
        
        XCTAssertEqual(sut.name, fileName)
        XCTAssertEqual(sut.type, fileType)
        XCTAssertEqual(sut.content, data)
        XCTAssertEqual(sut.extension, fileType.file.extension)
        XCTAssertEqual(sut.contentType, fileType.file.contentType)
    }
    
    func test_AudioFile() {
        let data = Data()
        let fileName = "fileName test"
        let fileType: FileType = .audio(.mp3)
        let sut = File(name: fileName, type: fileType, content: data)
        
        XCTAssertEqual(sut.name, fileName)
        XCTAssertEqual(sut.type, fileType)
        XCTAssertEqual(sut.content, data)
        XCTAssertEqual(sut.extension, fileType.file.extension)
        XCTAssertEqual(sut.contentType, fileType.file.contentType)
    }
}
