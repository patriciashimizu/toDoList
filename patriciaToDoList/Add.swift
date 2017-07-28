//==============================
import Foundation
//==============================
class Add {
    //---------------------------
    var dictionary: [String: Bool]!
    var keys: [String] = []
    var values: [Bool] = []
    //---------------------------
    init() {
        if let dict = Singleton.singletonInstance.dictionary {
            dictionary = dict
        } else {
            dictionary = [:]
        }
        parseDict()
    }
    //---------------------------
    func parseDict() {
        keys = []
        values = []
        for (k, v) in dictionary {
            keys.append(k)
            values.append(v)
        }
    }
    //---------------------------
    func addValue(keyToAdd: String) {
        dictionary[keyToAdd] = false
        saveToSingleton()
    }
    //---------------------------
    func removeValue(keyToRemove: String) {
        dictionary[keyToRemove] = nil
        saveToSingleton()
    }
    //---------------------------
    func saveToSingleton() {
        parseDict()
        Singleton.singletonInstance.dictionary = dictionary
        Singleton.singletonInstance.saveData()
    }
    //---------------------------
    func saveValueToSingleton() {
        var i = 0
        
        for (k, _) in dictionary {
            if values[i] == true {
                dictionary.updateValue(true, forKey: k)
            }
            else {
                dictionary.updateValue(false, forKey: k)
            }
            i += 1
        }

        Singleton.singletonInstance.dictionary = dictionary
        Singleton.singletonInstance.saveData()
    }
    
}

//==============================
