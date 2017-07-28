//==============================
import Foundation
//==============================
class Singleton {
    //---------------------------
    static let singletonInstance = Singleton()
    var dictionary: [String: Bool]!
    let userDefault = UserDefaults.standard
    //---------------------------
    init() {
        if userDefault.object(forKey: "data") ==  nil {
            userDefault.setValue(dictionary, forKey: "data")
        } else {
            dictionary = userDefault.object(forKey: "data") as! [String : Bool]!
        }
    }
    //---------------------------
    func saveData() {
        userDefault.setValue(dictionary, forKey: "data")
    }
    //---------------------------
}
//==============================
