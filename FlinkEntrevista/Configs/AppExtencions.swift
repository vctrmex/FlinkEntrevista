//
//  Extencions.swift
//  FlinkEntrevista
//
//  Created by victor manzanero on 18/01/21.
//

import Foundation
import UIKit


enum AppColors:String {
    case dark = "#3C1B32"
    case accent = "#7A145D"
    case base = "#16DDC1"
    case warning = "#EF1C90"
    case success = "#4EA6E9"
    case info = "#D5E519"
    case mainFont = "#1B3C38"
    case mainFontReverse = "#FFFFFF"
    case fbBtnColor = "#3B5999"
    case bkgdLight = "#000000"
}

enum AlertType {
    case error
    case success
    case warning
    case info
    
}

extension TableController {
    
    
    
    func selecionar(id:Personaje) {
        
        self.performSegue(withIdentifier: "next", sender: id)
       
        
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
            return categoriasv
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if (bar){
            
              return categoriasv.count
            
        }else{
            
               return 1
        }
           
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            
        if bar {
            
              let label = UILabel()
              label.text = categoriasv[section]
              label.backgroundColor = UIColor.systemFill
              return label
        }else{
            
            let label = UILabel()
            label.text = "Custom"
            label.backgroundColor = UIColor.systemFill
            return label
            
        }
              
    }
    
    func setTable(data:[[String:Any]]){
        
        for dato in data {
            
            
            guard let name = dato["name"] as? String else { return }
            guard let status = dato["status"] as? String  else { return }
            guard let id = dato["id"]  as? Int else { return }
            guard let species = dato["species"]  as? String else { return }
            guard let types = dato["type"]  as? String else { return }
            guard let gender = dato["gender"]  as? String else { return }
            guard let image = dato["image"]  as? String else { return }
            guard let created = dato["created"]  as? String else { return }
            
            // MARK: structuras de origin y localizacion
            guard let originData = dato["origin"]  as? [String:Any] else { return }
            guard let originName = originData["name"]  as? String else { return }
            guard let originUrl = originData["url"]  as? String else { return }
            guard let locationData = dato["location"]  as? [String:Any] else { return }
            guard let locationName = locationData["name"]  as? String else { return }
            guard let locationUrl = locationData["url"]  as? String else { return }
            
            // MARK: array de capitulos
            guard let arrayEpisodes = dato["episode"]  as? [String] else { return }
         
            
            let location:Location = Location(name: locationName, url: locationUrl)
            let origin:Origin = Origin(name: originName, url: originUrl)
            
            
           let p:Personaje = Personaje(id: id, name: name, gender: gender, type: types, status: status, species: species, image: image, created: created, location: location, origin: origin, episodes: arrayEpisodes)
            
           self.personajes.append(p)
           if p.status.lowercased() == "alive".lowercased(){
                
                personajesAlive.append(p)
                
            }
            if p.status.lowercased() == "dead".lowercased(){
                 
                personajesDead.append(p)
                 
             }
            if p.status.lowercased() == "unknown".lowercased(){
                 
                personajesUnkown.append(p) 
                 
             }
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if bar {
            
            switch section {
            case 0:
                
                return self.personajesAlive.count
                
             
            case 1:
                
                return self.personajesDead.count
                
              
            case 2:
                
                return self.personajesUnkown.count
                
              
            default:
                return 0
            }
        
        
        }else{
            
            return auxPersonajes.count
            
        }
        
    }
    

}


extension UIViewController {
    
    func hideKeyboard(){
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
                target: self,
                action: #selector(self.dismissKeyboard))
               
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
           
    @objc func dismissKeyboard(){
        
        view.endEditing(true)
    }
    
    func showLoadingScreen(vc: UIViewController, msg: String){

        let overlay: UIView = {
            let view = UIView()
            view.tag = 101010;
            view.backgroundColor = UIColor(named: AppColors.bkgdLight.rawValue)
            return view
        }()

        let loadingContainer: UIView = {
            let view = UIView()
            view.backgroundColor = .white
            view.clipsToBounds = true
            view.layer.cornerRadius = 3
            return view
        }()
        let loader: UIActivityIndicatorView = {
            let activityIndicator = UIActivityIndicatorView(style: .gray)
            activityIndicator.startAnimating()
            activityIndicator.hidesWhenStopped = false
            activityIndicator.color = UIColor(named: AppColors.dark.rawValue)
            return activityIndicator
        }()

        let textLbl: UILabel = {
            let lbl = UILabel()
            lbl.text = msg
            lbl.textAlignment = .center
            lbl.tintColor = UIColor(named: AppColors.mainFont.rawValue)
            lbl.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            return lbl
        }()

        DispatchQueue.main.async {
            vc.view.addSubview(overlay)
            if #available(iOS 11.0, *) {
                overlay.anchor(top: vc.view.safeAreaLayoutGuide.topAnchor, paddingTop: 0, right: vc.view.rightAnchor, paddingRight: 0, bottom: vc.view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 0, left: vc.view.leftAnchor, paddingLeft: 0, height: nil, width: nil, centerX: nil, centerY: nil)
            } else {
                // Fallback on earlier versions
            }
            overlay.addSubview(loadingContainer)
            loadingContainer.anchor(top: nil, paddingTop: 0, right: nil, paddingRight: 0, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, height: 64, width: 256, centerX: overlay.centerXAnchor, centerY: overlay.centerYAnchor)
            loadingContainer.addSubview(loader)
            loader.center = CGPoint(x: 32, y: 32)
            loadingContainer.addSubview(textLbl)
            textLbl.anchor(top: loadingContainer.topAnchor, paddingTop: 8, right: loadingContainer.rightAnchor, paddingRight: 16, bottom: loadingContainer.bottomAnchor, paddingBottom: 8, left: loadingContainer.leftAnchor, paddingLeft: 48, height: nil, width: nil, centerX: nil, centerY: nil)
        }

    }

    func removeLoadingScreen(){
        DispatchQueue.main.async(execute: {()->Void in
            guard let myView = self.view.viewWithTag(101010) else { return }
            myView.removeFromSuperview()
        })
    }
    
    
    
    
}

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, paddingTop: CGFloat,
                right: NSLayoutXAxisAnchor?, paddingRight: CGFloat,
                bottom: NSLayoutYAxisAnchor?, paddingBottom: CGFloat,
                left: NSLayoutXAxisAnchor?, paddingLeft: CGFloat,
                height: CGFloat?,
                width: CGFloat?,
                centerX: NSLayoutXAxisAnchor?,
                centerY: NSLayoutYAxisAnchor?
        ) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: paddingRight * -1).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom * -1).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
    }
    
    func addShadow(opacity: Float, shadowRad: CGFloat, cornerRds: CGFloat){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = shadowRad
        self.layer.cornerRadius = cornerRds
        self.clipsToBounds = false
    }
}
