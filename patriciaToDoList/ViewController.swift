//==============================================
import UIKit
//==============================================
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    //---------------------
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var task_TextField: UITextField!
    //---------------------
    let addObject = Add()
    let saveObject = Save()
    //---------------------
    @IBAction func addTask(_ sender: UIButton) {
        addObject.addValue(keyToAdd: task_TextField.text!)
        addObject.parseDict()
        tableView.reloadData()
        task_TextField.text = ""
    }
    //---------------------
    @IBAction func saveTask(_ sender: UIButton) {
        saveObject.addValue(keyToAdd: task_TextField.text!)
        tableView.reloadData()
        task_TextField.text = ""
    }
    
    //---------------------
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //---------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //---------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundColor = UIColor.clear
        //return saveObject.dictionnary.count
        return addObject.tableauAdd.count
    }
    //---------------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.default, reuseIdentifier:"proto")
        //cell.textLabel!.text = saveObject.keys[indexPath.row]
        cell.textLabel!.text = addObject.keys[indexPath.row]
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.font = UIFont(name:"TravelingTypewriter", size:18)
        cell.backgroundColor = UIColor.clear
        return cell
    }
    //---------------------
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath as IndexPath)!
        selectedCell.contentView.backgroundColor = UIColor.darkGray
    }
    //---------------------
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            //saveObject.removeValue(keyToRemove: saveObject.keys[indexPath.row])
            addObject.removeValue(keyToRemove: saveObject.keys[indexPath.row])
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    //---------------------
}
//==============================================
