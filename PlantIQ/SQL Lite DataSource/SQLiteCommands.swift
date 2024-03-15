//
//  SQLiteCommands.swift
//  PlantIQ
//
//  Created by Hamdy Youssef on 02/03/2024.
//

import Foundation
import SQLite
import SQLite3

class SQLiteCommands {
    
    static var table = Table("userData")
    
    //Expression
    static let id = Expression<Int>("id")
    static let name = Expression<String>("userName")
    static let email = Expression<String>("email")
    static let Passward = Expression<String>("Passward")
    
    //creating Table
    static func createTable() {
        guard let dataBase = SQLiteDataBase.shared().dataBase else {
            print("Data Store Connection error ")
            return
        }
        do {
            try dataBase.run(table.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(name)
                table.column(email, unique: true)
                table.column(Passward )
            })
        }catch {
            print("table already exist \(error)")
        }
    }
    
    // insertig row
    static func insertRow(_ userData: User) -> Bool? {
        guard let dataBase = SQLiteDataBase.shared().dataBase else {
            print("DataBase Connection Error")
            return nil
        }
        do {
            try dataBase.run(table.insert(name <- userData.userName,
                                          email <- userData.email,
                                          Passward <- userData.password))
            return true
        }catch let Result.error(message, code, statement) where code == SQLITE_CONSTRAINT {
            print("insert row fail: \(message), in \(String(describing: statement))")
            return false
           
        } catch let error {
            print("Insertion faild: \(error)")
            return false
        }
    }
    
    // present Rows
    static func presentRows() -> [User]? {
        guard let database = SQLiteDataBase.shared().dataBase else {
            print("Datastore connection error")
            return nil
        }
        // user array
        var userArray = [User]()
        
        // sorting data in data base by id
        table = table.order(id.desc)
        
        do {
            for user in try database.prepare(table) {
                let idValue = user[id]
                let nameValue = user[name]
                let emailValue = user[email]
                let passwardValue = user[Passward]
                
                // create object
                let userObject = User(id: idValue, userName: nameValue, email: emailValue, password: passwardValue)
                
                // add object to an array
                userArray.append(userObject)
                
                print("id: \(user[id]), name: \(user[name]), email: \(user[email]), passward: \(user[Passward])")
                
            }
        }catch {
            print("present row error \(error)")
        }
        return userArray
    }
    
    // check login data
    static func checkUserDataForLogIn(emaill: String, password: String) -> Bool {
        guard let dataBase = SQLiteDataBase.shared().dataBase else {
            print("DataBase Connection Error")
            return false
        }
        let searchQuery = SQLiteCommands.table.filter(SQLiteCommands.email == emaill && SQLiteCommands.Passward == password)
        do {
            for row in try dataBase.prepare(searchQuery) {
                if emaill == row[SQLiteCommands.email] && password == row[SQLiteCommands.Passward] {
                    return true
                }else {
                    return false
                }
            }
            
        } catch let error {
            print("Error querying database: \(error)")
            return false
        }
        return false
    }
       
       
    
}
