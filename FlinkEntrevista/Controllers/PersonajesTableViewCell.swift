//
//  PersonajesTableViewCell.swift
//  FlinkEntrevista
//
//  Created by victor manzanero on 18/01/21.
//

import UIKit

class PersonajesTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet var imagen: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var specie: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var btnMas: UIButton!
    var delegate:selecinado?
    var id:Personaje?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func verMas(_ sender: Any) {
        
        self.delegate?.selecionar(id: self.id!)
        
    }
    

}
