//==============================
import Foundation
//==============================
class Add {
    //---------------------------
    var tableauAdd: [String: Bool] = [:]
    var keys: [String] = []
    var values: [Bool] = []
    //---------------------------
    init() {
        if let dict = Singleton.singletonInstance.dictionnary {
            tableauAdd = dict
        } else {
            tableauAdd = [:]
        }
        parseDict()
    }
    //---------------------------
    func parseDict() {
        keys = []
        values = []
        for (k, v) in tableauAdd {
            keys.append(k)
            values.append(v)
        }
    }
    //---------------------------
    func addValue(keyToAdd: String) {
        tableauAdd[keyToAdd] = false
    }
    //---------------------------
    func removeValue(keyToRemove: String) {
        tableauAdd[keyToRemove] = nil
    }
    //---------------------------
}
//==============================