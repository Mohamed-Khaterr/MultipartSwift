//
//  MultipartTest.swift
//
//
//  Created by Mohamed Khater on 10/10/2024.
//

import XCTest
@testable import MultipartSwift

final class MultipartTest: XCTestCase {
    var sut: Multipart!
    
    override func tearDown() {
        sut = nil
    }
    
    func test_httpHeader(){
        let boundary = UUID().uuidString
        sut = Multipart(boundary: boundary)
        let httpHeaderValue = sut.httpHeader.value
        let httpHeaderField = sut.httpHeader.field
        
        XCTAssertEqual(httpHeaderField, "Content-Type")
        XCTAssertEqual(httpHeaderValue, "multipart/\(ContentDisposition.formData.value); boundary=\(boundary)")
    }
    
    func test_SetFields() {
        let boundary = "myBoundary"
        let sut = Multipart(boundary: boundary, contentDisposition: .formData)
        
        let data = "Hello World".data(using: .utf8)!
        
        let file = File(name: "test", type: .document(.pdf), content: data)
        
        sut.setFields([
            "name": .value("Mohamed"),
            "address": .value("3, Garden St"),
            "data": .data(data),
            "file": .file(file),
            "files": .files([file, file])
        ])
        
        XCTAssertFalse(sut.httpBody.isEmpty)
    }
    
    func test_initWithURLRequest() {
        let boundary = "myBoundary"
        let sut = Multipart(boundary: boundary, contentDisposition: .formData)
        
        sut.setFields([
            "name": .value("Mohamed"),
            "address": .value("3, Garden St")
        ])
        
        let request = URLRequest(url: URL(string: "https://google.com")!, multipart: sut)
        XCTAssertNotNil(request.httpBody)
        XCTAssertEqual(request.allHTTPHeaderFields?[sut.httpHeader.field], sut.httpHeader.value)
    }
}
