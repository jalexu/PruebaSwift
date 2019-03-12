//
//  ListarProspectos.swift
//  PruebaSwift
//
//  Created by Jaime Uribe on 3/7/19.
//  Copyright © 2019 Jaime Uribe. All rights reserved.
//

import UIKit

class ListarProspectos: UIViewController {
    
    
    @IBOutlet weak var labelListarUsuarios: UILabel!
    @IBOutlet weak var botonListarUsuarios: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func listarUsuarios(_ sender: Any) {
        let token = "9FQn5gzKA9k2LWyBMZtM"
        _ = mostrarUsuarios(token: token)
        
        
        self.labelListarUsuarios.text = token
        
        
    }
    
    
    func mostrarUsuarios(token: String) -> [AnyObject]{
        var almacenandoData: [AnyObject] = []
        let scriptUrl = "http://directotesting.igapps.co/sch/prospects.json"
        
        // Agregando parametros
        let urlWithParams = scriptUrl + "?authToken=\(token)"
        let myUrl = NSURL(string: urlWithParams);
        
        // Creaste URL Request
        var request = URLRequest(url: myUrl as URL!)
        
        // Metodo get
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            // Check for error
            if error != nil
            {
                print("error=\(String(describing: error))")
                return
            }
            
            
            // Almacena token
            do {
                
                almacenandoData = try JSONSerialization.jsonObject(with: data!)
                as! [AnyObject]
                print(almacenandoData)
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
        }
        
        task.resume()
        
        return almacenandoData
    }
    
}
