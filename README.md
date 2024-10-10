# MultipartSwift

A Swift library that provides an abstraction layer for sending multipart requests, allowing you to easily send files and data in a single HTTP request.

## Overview

This library defines several types to represent files and their content types, including:

- `File`
- `FileType`
- `ValueType`
- `Multipart`

## Installation

### Swift Package Manager
To include this library in your project, add the following to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/Mohamed-Khaterr/MultipartSwift", from: "1.0.0"),
]
```

## Usage

### Creating Files

You can create files using the `File`:

```swift
let imageFile = File(name: "example.jpg", type: .image(.jpg), content: imageData)
let pdfFile = File(name: "document.pdf", type: .document(.pdf), content: pdfData)
```

### Setting Up a Multipart Request

To create a multipart request, you can initialize the `Multipart` class and set the fields:

```swift
let multipart = Multipart()
multipart.setFields([
    "image": .file(imageFile),
    "document": .file(pdfFile)
])
```

### Sending the Request

You can retrieve the HTTP header and body to send your multipart request:

```swift
let url = URL(string: "https://example.com/upload")!
let request = URLRequest(url: url, multipart: multipart)

// Perform Request...
```

or

```swift
let url = URL(string: "https://example.com/upload")!
var request = URLRequest(url: url)
request.addValue(multipart.httpHeader.value, forHTTPHeaderField: multipart.httpHeader.field)
request.httpBody = multipart.httpBody

// Perform Request...
```

## API Reference

### File
Represents a file with a name, type, and content.

- **Properties**:
    - `name`: The name of the file.
    - `type`: The type of the file (`FileType`).
    - `content`: The binary content of the file.

### File Type
Represents different types of files.

- **Cases**:
    - `image(ImageFile)`
    - `video(VideoFile)`
    - `audio(AudioFile)`
    - `document(DocumentFile)`

### Value Type
Represents various types of values that can be used in requests.

- **Cases**:
    - `value(String, encoding: String.Encoding = .utf8)`
    - `data(Data)`
    - `file(File)`
    - `files([File])`

### Multipart Class
Represents a multipart request.

- **Properties**:
    - `boundary`: The boundary string used to separate different parts.
    - `httpHeader`: The HTTP header for the multipart request.
    - `httpBody`: The HTTP body of the multipart request.

- **Methods**:
    - `setFields(_ fields: [String: ValueType])`: Sets the fields for the multipart request.

### URLRequest Extension
```swift
init(url: URL, multipart: Multipart)
```
Initializes a `URLRequest` with the specified URL and a multipart request. This sets the HTTP header and body based on the provided `Multipart` instance.

## License

This library is licensed under the MIT License. See the [LICENSE](https://github.com/Mohamed-Khaterr/MultipartSwift/blob/main/LICENSE) file for more information.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to discuss changes or improvements.