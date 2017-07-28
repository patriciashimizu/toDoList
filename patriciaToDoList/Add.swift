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
    // ***** Fonction: parseDict
    /*
     *  Sauvegarde les clés et les valeurs du dictionnaire dans tableaux différents
     *
     */
    func parseDict() {
        keys = []
        values = []
        for (k, v) in dictionary {
            keys.append(k)
            values.append(v)
        }
    }
    //---------------------------
    // ***** Fonction: addValue
    /*
     *  Sauvegarde dans le Singleton un nouveau valeur qui a été ajouté par l’utilisateur
     *
     */
    func addValue(keyToAdd: String) {
        dictionary[keyToAdd] = false
        saveToSingleton()
    }
    //---------------------------
    // ***** Fonction: removeValue
    /*
     *  Efface dans le Singleton le valeur qui a été effacé par l’utilisateur
     *  @param keyToRemove: la clé de la cellule sélectionnée
     *
     */
    func removeValue(keyToRemove: String) {
        dictionary[keyToRemove] = nil
        saveToSingleton()
    }
    //---------------------------
    // ***** Fonction: saveToSingleton
    /*
     *  Sauvegarde les données dans le Singleton
     *
     */
    func saveToSingleton() {
        parseDict()
        Singleton.singletonInstance.dictionary = dictionary
        Singleton.singletonInstance.saveData()
    }
    //---------------------------
    // ***** Fonction: saveValueToSingleton
    /*
     *  Sauvegarde les valeurs (true ou false) dans le Singleton à chaque fois que une cellule est sélectionne ou désélectionne par l’utilisateur
     *
     */
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
    //---------------------------
}

//==============================
