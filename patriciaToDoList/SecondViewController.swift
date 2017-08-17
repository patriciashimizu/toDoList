//==============================================
import UIKit
//==============================================
class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //---------------------
    var dataTableFirstView = [""]
    //---------------------
    override func viewDidLoad() {
        dataTableFirstView.remove(at: 0)
        for(b, a) in Singleton.singletonInstance.dictionary{
            if a == true {
                dataTableFirstView.append(b)
            }
        }
        super.viewDidLoad()
    }
    //---------------------------
    // ***** Bouton: BACK
    @IBAction func back(_ sender: UIButton) {

    }
    //---------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //---------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundColor = UIColor.clear
        return dataTableFirstView.count
    }
    //---------------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.default, reuseIdentifier:"proto")
        cell.textLabel!.text = dataTableFirstView[indexPath.row]
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
            Singleton.singletonInstance.dictionary.updateValue(false, forKey: dataTableFirstView[indexPath.row])
            Singleton.singletonInstance.saveData()
            dataTableFirstView.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    //---------------------
    
}
//==============================================
