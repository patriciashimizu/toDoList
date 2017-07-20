//==============================
import Foundation
//==============================
class Save {
    //---------------------------
    var dictionnary: [String: Bool]!
    var keys: [String] = []
    var values: [Bool] = []
    //---------------------------
    init() {
        if let dict = Singleton.singletonInstance.dictionnary {
            dictionnary = dict
        } else {
            dictionnary = [:]
        }
        parseDict()
    }
    //---------------------------
    func parseDict() {
        keys = []
        values = []
        for (k, v) in dictionnary {
            keys.append(k)
            values.append(v)
        }
    }
    //---------------------------
    func addTable(tableToAdd: [String: Bool]) {
        keys = []
        values = []
        for (k, v) in tableToAdd {
            keys.append(k)
            values.append(v)
        }
        Singleton.singletonInstance.dictionnary = tableToAdd
        Singleton.singletonInstance.saveData()
    }
    //---------------------------
}
//==============================
