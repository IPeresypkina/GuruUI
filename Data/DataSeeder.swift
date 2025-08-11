//import CoreData
//
//protocol DataSeeder {
//    static func seed(into context: NSManagedObjectContext)
//}
//
//struct JSONDataSeeder: DataSeeder {
//    private struct ExampleDTO: Decodable {
//        let topic: String
//        let title: String
//        let code: String
//    }
//    
//    static func seed(into context: NSManagedObjectContext) {
//        guard let url = Bundle.main.url(forResource: "code_examples", withExtension: "json") else {
//            print("❌ Файл не найден в Bundle")
//            return
//        }
//        
//        guard let data = try? Data(contentsOf: url) else {
//            print("❌ Не удалось прочитать данные из файла")
//            return
//        }
//        
//        do {
//            let examples = try JSONDecoder().decode([ExampleDTO].self, from: data)
//            examples.forEach { dto in
//                let example = CodeExample(context: context)
//                example.id = UUID()
//                example.title = dto.title
//                example.code = dto.code
//                example.topic = dto.topic
//            }
//        } catch {
//            print("❌ Ошибка декодирования JSON: \(error)")
//            print("Локальное описание: \(error.localizedDescription)")
//            if let decodingError = error as? DecodingError {
//                print("Детали DecodingError:", decodingError)
//            }
//            return
//        }
//    }
//}
