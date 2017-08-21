//==============================
import Foundation
//==============================
class Singleton {
    //---------------------------
    // MARK: ------ PROPERTIES
    static let singletonInstance = Singleton()
    var dictionary: [String: Bool]!
    let userDefault = UserDefaults.standard
    //---------------------------
    // MARK: ------ CONSTRUCTOR
    init() {
        if userDefault.object(forKey: "data") ==  nil {
            userDefault.setValue(dictionary, forKey: "data")
        } else {
            dictionary = userDefault.object(forKey: "data") as! [String : Bool]!
        }
    }
    //---------------------------
    // MARK: ------ OTHER FUNCTIONS
    func saveData() {
        userDefault.setValue(dictionary, forKey: "data")
    }
    //---------------------------
}
//==============================
