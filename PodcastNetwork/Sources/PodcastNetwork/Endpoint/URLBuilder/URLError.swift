import Foundation

internal enum URLError: Error {
    case missingScheme
    case missingHost
    case missingPath
}
