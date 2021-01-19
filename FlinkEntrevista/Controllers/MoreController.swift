//
//  MoreController.swift
//  FlinkEntrevista
//
//  Created by victor manzanero on 18/01/21.
//

import UIKit

class MoreController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    

    @IBOutlet var name: UILabel!
    var objp:Personaje?
    @IBOutlet var tabla: UITableView!
    @IBOutlet var txtOrigin: UILabel!
    @IBOutlet var txtLocation: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let personaje = objp else {
            
            return
            
        }
        
        name.text = personaje.name
        txtOrigin.text = "Origin: \(objp!.origin.name)"
        txtLocation.text = "Location: \(objp!.location.name)"

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (objp?.episodes.count)!
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = objp?.episodes[indexPath.row]
        
        return cell
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
