import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://api.github.com/users/"
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completed: @escaping ([Follower]?, String?) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        guard let url = URL(string: endpoint) else {
            completed(nil, ErrorMessage.invalidUsername.rawValue)
            return
        }
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(nil, ErrorMessage.unableToComplete.rawValue)
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, ErrorMessage.invalidResponse.rawValue)
                return
            }
            guard let data = data else {
                completed(nil, ErrorMessage.invalidData.rawValue)
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            } catch {
                completed(nil, ErrorMessage.decodingError.rawValue)
            }
        }
        dataTask.resume()
    }
}
