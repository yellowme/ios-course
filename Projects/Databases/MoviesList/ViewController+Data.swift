//
//  ViewController+Save.swift
//  MoviesList
//
//  Created by Luis Burgos on 7/28/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit
import CoreData

// MARK: - Data
extension ViewController {
    internal func populateMovies() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Movie")
        
        do {
            movies = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    internal func save(name: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        // You can consider a managed object context as an in-memory
        // “scratchpad” for working with managed objects.
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // You must spell the KVC key (name in this case) exactly as
        // it appears in your Data Model
        let entity = NSEntityDescription.entity(
            forEntityName: "Movie",
            in: managedContext)!
        
        let movie = NSManagedObject(entity: entity, insertInto: managedContext)
        movie.setValue(name, forKeyPath: "name")
        
        do {
            try managedContext.save()
            movies.append(movie)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
