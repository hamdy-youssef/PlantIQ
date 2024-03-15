//
//  SQLLiteDataBase.swift
//  PlantIQ
//
//  Created by Hamdy Youssef on 02/03/2024.
//

import Foundation
import SQLite

class SQLiteDataBase {
    
    // MARK: - Singleton
    private static let sharedInstance = SQLiteDataBase()
    static func shared() -> SQLiteDataBase {
        return SQLiteDataBase.sharedInstance
    }
    
    var dataBase: Connection?
    
    private init() {
        // create connection to database
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("userData").appendingPathExtension("sqlite3")
            
            dataBase = try Connection(fileUrl.path)
        }catch {
            print("Creating Connection to database error \(error )")
        }
    }
    
   
    
    // creating table
    
    func createTable () {
        SQLiteCommands.createTable()
    }
}
