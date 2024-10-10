//
//  ContentDisposition.swift
//
//
//  Created by Mohamed Khater on 09/10/2024.
//

import Foundation

/// Represents various content disposition types as defined by IANA, used to
/// specify how the content body should be handled or displayed.
///
/// - Reference: https://www.iana.org/assignments/cont-disp/cont-disp.xhtml
public enum ContentDisposition {
    
    /// Content is to be displayed automatically.
    case inline
    
    /// Content is to be displayed with user control, typically as a file attachment.
    case attachment
    
    /// Content is processed as form response data.
    case formData
    
    /// Content is tunneled and processed silently.
    case signal
    
    /// The body is a custom ring tone to alert the user.
    case alert
    
    /// The body is displayed as an icon to the user.
    case icon
    
    /// The body should be rendered and displayed to the user.
    case render
    
    /// The body contains a list of URIs that indicates the recipients of the request.
    case recipientListHistory
    
    /// The body includes a list of URIs to which URI-list services are to be applied.
    case recipientList
    
    /// The body describes a communications session (e.g., an RFC2327 SDP body).
    case session
    
    /// The body describes an early communications session (e.g., an early [RFC2327] SDP body).
    case earlySession
    
    /// The body describes either metadata about the RS or the reason for a metadata snapshot request.
    case recordingSession
    
    /// The body contains an Authenticated Identity Body.
    case aib
    
    /// The payload contains an Instant Message Disposition Notification as requested.
    case notification
    
    /// The body is handled according to a reference located in the same SIP message.
    case byReference
    
    /// The body contains information associated with an Info Package.
    case infoPackage
    
    /// The string representation of the content disposition value.
    ///
    /// - Returns: The string value of the content disposition.
    var value: String {
        switch self {
        case .inline: "inline"
        case .attachment: "attachment"
        case .formData: "form-data"
        case .signal: "signal"
        case .alert: "alert"
        case .icon: "icon"
        case .render: "render"
        case .recipientListHistory: "recipient-list-history"
        case .recipientList: "recipient-list"
        case .session: "session"
        case .earlySession: "early-session"
        case .recordingSession: "recording-session"
        case .aib: "aib"
        case .notification: "notification"
        case .byReference: "by-reference"
        case .infoPackage: "info-package"
        }
    }
}
