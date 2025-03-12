import Foundation

protocol APIServiceProtocol {
    func fetchBreeds(url: URL?, completion: @escaping(Result<[Breed], APIError>) -> Void)
    func fetchImageBreeds<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<BreedImage, APIError>) -> Void)
}
