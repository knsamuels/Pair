//
//  PairController.swift
//  Pair
//
//  Created by Kristin Samuels  on 7/10/20.
//  Copyright © 2020 Kristin Samuels . All rights reserved.
//

import Foundation

class PairController {
   
    static let shared = PairController()
    
    var santaPairs: [Pair] = []
    
    //Mark: CRUD
    
    func createPairs(pairNumber: Int, nameOne: String, nameTwo: String) {
        let newPair = Pair(pairNumber: pairNumber, nameOne: nameOne, nameTwo: nameTwo)
        santaPairs.append(newPair)
        saveToPersistenceStore()
    }
    
    func updatePairs(pair: Pair, pairNumber: Int, nameOne: String, nameTwo: String) {
        pair.pairNumber = pairNumber
        pair.nameOne = nameOne
        pair.nameTwo = nameTwo
        saveToPersistenceStore()
    }
    
    func deletePairs(pair: Pair) {
        guard let index = santaPairs.firstIndex(of: pair) else {return}
        santaPairs.remove(at: index)
        saveToPersistenceStore()
    }
    
    // MARK: Persistence
  
    func createPersistenceStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("Pair.json")
        return fileURL
    }
    
    func saveToPersistenceStore() {
        let jsonEncoder = JSONEncoder()
        do {
            let data = try jsonEncoder.encode(santaPairs)
           try data.write(to: createPersistenceStore())
        } catch {
            print("there was an error encoding the data: \(error) -- \(error.localizedDescription)")
        }
    }

    func loadFromPersistenceStore() {
        let jsonDecoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: createPersistenceStore())
            santaPairs = try jsonDecoder.decode([Pair].self, from: data)
        } catch {
            print("there was an error encoding the data: \(error) -- \(error.localizedDescription)")
        }
    }
}
