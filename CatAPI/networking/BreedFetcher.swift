import Foundation

class BreedFetcher: ObservableObject {
    
    @Published var breeds = [Breed]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchAllBreeds()
    }
    
    func fetchAllBreeds() {
        
        isLoading = true
        errorMessage = nil
        
        let url = URL(string: "https://api.thecatapi.com/v1/breeds")
        service.fetchBreeds(url: url) { [unowned self] result in
            
            DispatchQueue.main.async {
                
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    // print(error.description)
                    print(error)
                case .success(let breeds):
                    print("--- sucess with \(breeds.count)")
                    self.breeds = breeds
                    self.fetchImagesForBreeds()
                }
            }
        }
    }
    
    private func fetchImagesForBreeds() {
        let group = DispatchGroup()
        
        for index in 0..<breeds.count {
            guard let imageId = breeds[index].imageId else {
                continue // Пропускаем породы без imageId
            }
            
            group.enter()
            let imageUrl = URL(string: "https://api.thecatapi.com/v1/images/\(imageId)")!
            service.fetchImageBreeds(BreedImage.self, url: imageUrl) { [unowned self] result in
                defer { group.leave() }
                
                switch result {
                case .failure(let error):
                    print("Error fetching image for breed \(self.breeds[index].name): \(error)")
                case .success(let image):
                    DispatchQueue.main.async {
                        self.breeds[index].image = image
                    }
                }
            }
        }
        
        group.notify(queue: .main) {
            print("All images fetched.")
        }
    }
    
    //MARK: preview helpers
    static func errorState() -> BreedFetcher {
        let fetcher = BreedFetcher()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    static func successState() -> BreedFetcher {
        let fetcher = BreedFetcher()
        fetcher.breeds = [Breed.example1(), Breed.example2()]
        
        return fetcher
    }
}
