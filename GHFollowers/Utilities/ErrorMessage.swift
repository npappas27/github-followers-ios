import Foundation

enum ErrorMessage: String {
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete request. Please check your internet connection"
    case invalidResponse = "Invalid response from server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
    case decodingError = "Error decoding JSON data"
}
