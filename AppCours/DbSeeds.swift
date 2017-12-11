//
//  DbSeeds.swift
//  AppCours
//
//  Created by Jonathan on 11/12/2017.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DbSeeds {
    
    private func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer!
        let databaseContext = persistentContainer.viewContext
        return databaseContext
    }
    
    func addObject() {
        let databaseContext = getContext()
        
        let student = Student(context: databaseContext)
        student.level = 4
        student.name = "Jérôme"
        student.birthday = Date()
        
        do {
            try databaseContext.save()
        } catch let error {
            print("CANT SAVE THE DATABASE: \(error)")
        }
    }
    
    func getObject() {
        let databaseContext = getContext()
        
        // Create request
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Course")
        
        // Filter request
        request.predicate = NSPredicate(format: "level > 2")
        
        // Sort request
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        do {
            let courseList = try? databaseContext.fetch(request)
            
            print("Size: \(courseList?.count ?? 0)")
        }
    }
    
    func deleteObject() {
        let databaseContext = getContext()
        
        // Create request
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Course")
        
        // Filter request
        request.predicate = NSPredicate(format: "level == 1")
        
        do {
            let courseList = try? databaseContext.fetch(request)
            
            if let courseList = courseList as? [Course] {
                for course in courseList {
                    try? databaseContext.delete(course)
                }
                
                try? databaseContext.save()
            }
        }
    }
    
    func updateObject() {
        let databaseContext = getContext()
        
        // Create request
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        
        // Filter request
        request.predicate = NSPredicate(format: "name == %@ and level > %@", "Jérôme", 2)
        
        do {
            let studentList = try? databaseContext.fetch(request)
            
            if let studentList = studentList as? [Student], studentList.count > 0 {
                let jerome = studentList[0]
                jerome.level = 10
                
                try? databaseContext.save()
            }
        }
    }
    
    func async() {
        // << main thread
        DispatchQueue.global().async {
            // << async thread
            
            self.getObject()
            
            DispatchQueue.main.async {
                // << main thread
                let label = UILabel()
                label.text = "Saved!"
                print("done!")
            }
        }
    }
    
}
