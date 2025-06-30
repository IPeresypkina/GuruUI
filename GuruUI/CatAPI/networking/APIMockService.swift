import Foundation

struct APIMockService: APIServiceProtocol {
    var resultImage: Result<BreedImage, APIError>
    
    func fetchImageBreeds<T>(_ type: T.Type, url: URL?, completion: @escaping (Result<BreedImage, APIError>) -> Void) where T : Decodable {
        completion(resultImage)
    }
    
    var result: Result<[Breed], APIError>
    
    func fetchBreeds(url: URL?, completion: @escaping (Result<[Breed], APIError>) -> Void) {
        completion(result)
    }
}
