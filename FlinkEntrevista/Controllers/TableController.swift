//
//  TableController.swift
//  FlinkEntrevista
//
//  Created by victor manzanero on 18/01/21.
//

import UIKit

class TableController: UIViewController, UITableViewDelegate, UITableViewDataSource, selecinado,UISearchBarDelegate {
    
   
    let userDefauld = UserDefaults.standard
    var categoriasv = ["Alive","Dead","Unknown"]
    var personajes:Array<Personaje> = []
    var personajesAlive:Array<Personaje> = []
    var personajesDead:Array<Personaje> = []
    var personajesUnkown:Array<Personaje> = []
    var auxPersonajes:Array<Personaje> = []
    let controller = AppController()
    var bar:Bool = true
    @IBOutlet var search: UISearchBar!
    @IBOutlet var tabla: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        search.delegate = self
        

        // Do any additional setup after loading the view.
    }
    
    
    func loadData() {
        
        showLoadingScreen(vc: self, msg: "Personajes")
        controller.getData(){ (res, err) in
            
            if(err == nil){
                self.removeLoadingScreen()
                guard let jsonArray = res as? [String: AnyObject] else {
                                                 return
                                             }
                guard let json = jsonArray["results"]!  as? [[String: AnyObject]] else {
                                                 return
                                             }
                
                self.setTable(data: json)
                                              
                

                return;
            }
           
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? PersonajesTableViewCell
        var objP:Personaje?
        
        if bar {
            
            switch indexPath.section {
            case 0:
                
                objP = personajesAlive[indexPath.row]
                
            break;
            case 1:
                
                objP = personajesDead[indexPath.row]
                
                break;
            case 2:
                
                objP = personajesUnkown[indexPath.row]
                
                break;
            default:
                break
            }
            
            
            
        }else{
            
            objP = auxPersonajes[indexPath.row]
            
        }
        cell?.name.text = objP!.name
        cell?.specie.text = objP!.species
        cell?.type.text = objP!.status
        cell?.delegate = self
        cell?.id = objP!
    
        
        if objP!.image != "" {
        
        let url:URL = URL(string: objP!.image)!
        
        DispatchQueue.global(qos: .userInitiated).async {
            
            let imagedata:NSData = NSData(contentsOf: url)!
            DispatchQueue.main.async {
                
                let image = UIImage(data: imagedata as Data)
                cell?.imagen.image = image
                
            }
            
        }
            
        }
        
        return cell!
        
    
    
    
    
        
    }
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print(sender!)
        
        if segue.identifier == "next"{
            
            let controlador =  segue.destination as! MoreController
            controlador.objp = sender as? Personaje
            
        }
        
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        
        
        self.auxPersonajes = self.personajes.filter { (exercise:Personaje ) -> Bool in
            if exercise.name.lowercased().contains(self.search.text!.lowercased()){
                
                return true
            } else{
                
                return false
            }
        }
        
        if (searchText != ""){
            
            self.bar = false
            self.tabla.reloadData()
            //print(lotes2.count)
            
        }else{
            self.bar = true
            self.tabla.reloadData()
            
            
        }
        
        
        
    }
    
    
    
    @IBAction func logout(_ sender: Any) {
        
        let alert = UIAlertController(title: "Cerrar Sesion", message: "Esta apunto de cerrar sesion ¿Desea continuar?", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Si", style: .default, handler: {(action: UIAlertAction) in
            
            self.userDefauld.set("", forKey: "user")
            self.userDefauld.set("",forKey: "pass")
            
            exit(0)
            
        }))

        self.present(alert, animated: true)
        
        
        
    }
    

}
