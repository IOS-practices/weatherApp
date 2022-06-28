import Foundation

enum NetWork: Error{
    case noData
}

class NetworkManager {
    
    static let shared = NetworkManager(session:URLSession.shared)

    let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    @discardableResult
    func get<T: Decodable>(_ type: T.Type, from url: URL, completion: @escaping (Result<T, Error>) -> Void ) -> URLSessionDataTask {
        let task = session.dataTask(with: url) { ( data, response, error) in
            
             if let error = error{
                 DispatchQueue.main.async{
                      completion( Result.failure(error))
                 }
                 return
             }
            
            let jsonDecoder = JSONDecoder()
            if let data = data, let items = try? jsonDecoder.decode(type, from: data){
                DispatchQueue.main.async{
                     completion( Result.success(items))
                }
            } else {
                DispatchQueue.main.async{
                    completion( Result.failure(NetWork.noData))
                }
            }
            
        }
        task.resume()
        
        return task
    }
}
