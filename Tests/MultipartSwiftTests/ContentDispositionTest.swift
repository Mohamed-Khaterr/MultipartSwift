//
//  ContentDispositionTest.swift
//
//
//  Created by Mohamed Khater on 10/10/2024.
//

import XCTest
@testable import MultipartSwift

final class ContentDispositionTest: XCTestCase {
    func test_Values() {
        XCTAssertEqual(ContentDisposition.inline.value, "inline")
        XCTAssertEqual(ContentDisposition.attachment.value, "attachment")
        XCTAssertEqual(ContentDisposition.formData.value, "form-data")
        XCTAssertEqual(ContentDisposition.signal.value, "signal")
        XCTAssertEqual(ContentDisposition.alert.value, "alert")
        XCTAssertEqual(ContentDisposition.icon.value, "icon")
        XCTAssertEqual(ContentDisposition.render.value, "render")
        XCTAssertEqual(ContentDisposition.recipientListHistory.value, "recipient-list-history")
        XCTAssertEqual(ContentDisposition.recipientList.value, "recipient-list")
        XCTAssertEqual(ContentDisposition.session.value, "session")
        XCTAssertEqual(ContentDisposition.earlySession.value, "early-session")
        XCTAssertEqual(ContentDisposition.recordingSession.value, "recording-session")
        XCTAssertEqual(ContentDisposition.aib.value, "aib")
        XCTAssertEqual(ContentDisposition.notification.value, "notification")
        XCTAssertEqual(ContentDisposition.byReference.value, "by-reference")
        XCTAssertEqual(ContentDisposition.infoPackage.value, "info-package")
    }
}
