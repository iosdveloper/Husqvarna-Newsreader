//
//  CoreDataManager.swift
//  Newsreader
//
//  Created by Ashutosh Dadhich on 19/11/24.
//

import Foundation
import CoreData


class CoreDataManager {
    // MARK: - Singleton Instance
    static let shared = CoreDataManager()
    private init() {}

    // MARK: - Persistent Container
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "NewsReader")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error.localizedDescription)")
            }
        }
        return container
    }()

    // MARK: - Context
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    // MARK: - Save Context
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    // MARK: - Create Bookmark
    func createBookmark(title: String, description: String, content: String, url: String, urlToImage: String?) {
        let bookmark = Bookmark(context: context)
        bookmark.title = title
        bookmark.newsDescription = description
        bookmark.content = content
        bookmark.url = url
        bookmark.urlToImage = urlToImage

        saveContext()
    }

    // MARK: - Fetch Bookmarks
    func fetchBookmarks() -> [Bookmark] {
        let fetchRequest: NSFetchRequest<Bookmark> = Bookmark.fetchRequest()
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch bookmarks: \(error.localizedDescription)")
            return []
        }
    }


    // MARK: - Delete Bookmark
    func deleteBookmark(bookmark: Bookmark) {
        context.delete(bookmark)
        saveContext()
    }

    // MARK: - Clear All Data
    func clearAllBookmarks() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Bookmark.fetchRequest()
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try context.execute(batchDeleteRequest)
            saveContext()
        } catch {
            print("Failed to clear all bookmarks: \(error.localizedDescription)")
        }
    }
}
