

import Foundation

enum AppError : LocalizedError {
    
case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    
    
    var errorDescription: String? {
        switch self {
            
        case .errorDecoding:
            return "Response Couldn't be decoded"
        case .unknownError:
            return "Unknown Error"
        case .invalidUrl:
            return "No Valid URL"
        case .serverError(let error):
            return error
        }
    }
    
}
