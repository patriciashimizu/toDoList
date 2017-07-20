//==============================
import Foundation
//==============================
class Add {
    //---------------------------
    var tableAdd: [String: Bool] = [:]
    var keys: [String] = []
    var values: [Bool] = []
    //---------------------------
    init() {
        if let dict = Singleton.singletonInstance.dictionnary {
            tableAdd = dict
        } else {
            tableAdd = [:]
        }
        parseDict()
    }
    //---------------------------
    func parseDict() {
        keys = []
        values = []
        for (k, v) in tableAdd {
            keys.append(k)
            values.append(v)
        }
    }
    //---------------------------
    func addValue(keyToAdd: String) {
        tableAdd[keyToAdd] = false
    }
    //---------------------------
    func removeValue(keyToRemove: String) {
        tableAdd[keyToRemove] = nil
    }
    //---------------------------
}
//==============================
