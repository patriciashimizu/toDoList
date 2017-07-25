//==============================================
import UIKit
//==============================================
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    //---------------------
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var task_TextField: UITextField!
    //---------------------
    let addObject = Add()
    var titleAlert: String!
    var messageAlert: String!
    //var selectedCells: [Bool] = []
    //---------------------
    @IBAction func addTask(_ sender: UIButton) {
        addObject.addValue(keyToAdd: task_TextField.text!)
        addObject.parseDict()
        tableView.reloadData()
        task_TextField.text = ""
    }
    //---------------------
    @IBAction func saveTask(_ sender: UIButton) {
        titleAlert = "Save"
        messageAlert = "Do you really want to replace the online database for this one?"
        showAlert(title: titleAlert, message: messageAlert)
    }
    //---------------------
    @IBAction func load(_ sender: UIButton) {
        titleAlert = "Load"
        messageAlert = "Do you really want to load the online database and replace this one?"
        showAlert(title: titleAlert, message: messageAlert)
    }
    //---------------------
    @IBAction func viewListSelectedTasks(_ sender: UIButton) {

    }
    //---------------------
    @IBAction func reset(_ sender: UIButton) {
        titleAlert = "Reset"
        messageAlert = "Do you really want to reset everything?"
        showAlert(title: titleAlert, message: messageAlert)
    }
    //---------------------
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
            if title == "Save" {
                self.replaceDatabaseOnline()
            }
            else if title == "Load" {
                self.downloadDatabaseOnline()
            }
            else if title == "Reset" {
                self.deselectCellsTable()
            }
            
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action: UIAlertAction!) in
            
        }))
        
        present(alert, animated: true, completion: nil)
    }
    //---------------------
    func replaceDatabaseOnline() {
        var urlToSend = "http://localhost/dashboard/shimizu/json_php/add.php?json=["
        var counter = 0
        let total = addObject.dictionnary.count
        for (a, b) in addObject.dictionnary {
            let noSpaces = replaceChars(originalStr: a, what: " ", byWhat: "_")
            counter += 1
            if counter < total {
                urlToSend += "/\(noSpaces)/,/\(b)/!"
            } else {
                urlToSend += "/\(noSpaces)/,/\(b)/"
            }
        }
        urlToSend += "]"
        
        let session = URLSession.shared
        let urlString = urlToSend
        let url = NSURL(string: urlString)
        let request = NSURLRequest(url: url! as URL)
        let dataTask = session.dataTask(with: request as URLRequest) {
            (data:Data?, response:URLResponse?, error:Error?) -> Void in
        }
        dataTask.resume()
    }
    //---------------------
    func downloadDatabaseOnline() {
        let requestURL: NSURL = NSURL(string: "http://localhost/dashboard/shimizu/json_php/data.json")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url:
            requestURL as URL)
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest as URLRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Tout fonctionne correctement...")
                do{
                    let json = try JSONSerialization.jsonObject(with:
                        data!, options:.allowFragments)
                    print(json)
                    
                    //table
                    let temp: [String: String] = json as! [String : String]
                    print(temp)
                    
                    //code
                    var keys: [String] = []
                    var values: [Bool] = []
                    
                    
                    keys = []
                    values = []
                    for (k, v) in temp {
                        keys.append(k)
                        values.append(Bool(v)!)
                        //print(v)
                        //print(k)
                    }
                    
                                        
                    
                }catch {
                    print("Erreur Json: \(error)")
                }
                
                
                
            }
        }
        task.resume()
    }
    //---------------------
    func deselectCellsTable() {
        for i in 0..<addObject.dictionnary.count {
            addObject.values[i] = false
            tableView.backgroundColor = UIColor.clear
        }
        tableView.reloadData()
    }
    //---------------------
    func replaceChars(originalStr: String, what: String, byWhat: String) -> String {
        return originalStr.replacingOccurrences(of: what, with: byWhat)
    }
    //---------------------
    override func viewDidLoad() {
        
        setValuesFalse()
        super.viewDidLoad()
        
    }
    //---------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //---------------------
    func setValuesFalse() {
        for (k, _) in Singleton.singletonInstance.dictionnary {
            Singleton.singletonInstance.dictionnary.updateValue(false, forKey: k)
        }
        
        for (k, _) in addObject.dictionnary {
            addObject.dictionnary.updateValue(false, forKey: k)
        }
        
        for i in 0..<addObject.values.count {
            addObject.values[i] = false
        }
    }
    //---------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundColor = UIColor.clear
        return addObject.dictionnary.count
    }
    //---------------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.default, reuseIdentifier:"proto")
        cell.textLabel!.text = addObject.keys[indexPath.row]
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.font = UIFont(name:"TravelingTypewriter", size:18)
        cell.backgroundColor = UIColor.clear
        return cell
    }
    //---------------------
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if addObject.values[indexPath.row] {
            //cell.backgroundColor = UIColor(red: 118.0/255, green: 137.0/255, blue: 124.0/255, alpha: 1.0)
            cell.backgroundColor = UIColor.lightGray
        }
    }
    //---------------------
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath as IndexPath)!
        selectedCell.contentView.backgroundColor = UIColor.darkGray
        if !addObject.values[indexPath.row] {
            addObject.values[indexPath.row] = true
            addObject.saveValueToSingleton()
            
        } else {
            addObject.values[indexPath.row] = false
            addObject.saveValueToSingleton()
            
        }
        tableView.reloadData()
    }
    //---------------------
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            addObject.removeValue(keyToRemove: addObject.keys[indexPath.row])
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    //---------------------
}
//==============================================
