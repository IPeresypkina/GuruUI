//import CoreData
//
//public final class CoreDataManager {
//    public static let shared = CoreDataManager()
//    
//    private init() {}
//    
//    lazy var persistentContainer: NSPersistentContainer = {
//        let container = NSPersistentContainer(name: "Model")
//        container.loadPersistentStores { (storeDescription, error) in
//            if let error = error as NSError? {
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            } else {
//                print("DB - \(String(describing: storeDescription.url?.absoluteString))")
//            }
//        }
//        
//        return container
//    }()
//    
//    private var context: NSManagedObjectContext {
//        return persistentContainer.viewContext
//    }
//    
//    private func saveContext() {
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }
//    
//    // Предзагрузка начальных данных
//    func preloadCodeExamplesIfNeeded() {
//        let fetchRequest: NSFetchRequest<CodeExample> = CodeExample.fetchRequest()
//        
//        do {
//            let count = try context.count(for: fetchRequest)
//            guard count == 0 else { return } // Если данные уже есть — пропускаем
//            
//            JSONDataSeeder.seed(into: context)
//            saveContext()
//            
//            print("✅ Примеры кода успешно загружены в CoreData")
//        } catch {
//            print("❌ Ошибка при проверке CoreData: \(error)")
//        }
//    }
//    
//    public func fetch<T: NSManagedObject>(_ type: T.Type, predicate: NSPredicate? = nil) -> [T] {
//        let entityName = String(describing: type)
//        let fetchRequest = NSFetchRequest<T>(entityName: entityName)
//        fetchRequest.predicate = predicate
//        
//        do {
//            return try context.fetch(fetchRequest)
//        } catch {
//            print("Failed to fetch \(entityName): \(error)")
//            return []
//        }
//    }
//    
//    public func fetchCodeExamples() -> [CodeExample] {
//        let fetchRequest: NSFetchRequest<CodeExample> = CodeExample.fetchRequest()
//        do {
//            return (try? context.fetch(fetchRequest)) ?? []
//        }
//    }
//    
//    public func fetchCodeExample(with id: UUID) -> CodeExample? {
//        let fetchRequest: NSFetchRequest<CodeExample> = CodeExample.fetchRequest()
//        do {
//            let examples = try? context.fetch(fetchRequest)
//            return examples?.first(where: { $0.id == id })
//        }
//    }
//    
//    public func updateCodeExample(with id: UUID, topic: String, title: String, code: String) {
//        let fetchRequest: NSFetchRequest<CodeExample> = CodeExample.fetchRequest()
//        do {
//            guard let examples = try? context.fetch(fetchRequest),
//                  let example = examples.first(where: { $0.id == id }) else { return }
//            example.topic = topic
//            example.title = title
//            example.code = code
//        }
//        
//        saveContext()
//    }
//    
//    public func deleteAllCodeExample() {
//        let fetchRequest: NSFetchRequest<CodeExample> = CodeExample.fetchRequest()
//        do {
//            let examples = try? context.fetch(fetchRequest)
//            examples?.forEach { context.delete($0) }
//            
//        }
//        saveContext()
//    }
//    
//    public func deleteCodeExample(with id: UUID) {
//        let fetchRequest: NSFetchRequest<CodeExample> = CodeExample.fetchRequest()
//        do {
//            guard let examples = try? context.fetch(fetchRequest),
//                  let example = examples.first(where: { $0.id == id }) else { return }
//            context.delete(example)
//        }
//        saveContext()
//    }
//}
