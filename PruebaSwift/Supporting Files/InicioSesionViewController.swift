//
//  InicioSesionViewController.swift
//  PruebaSwift
//
//  Created by Jaime Uribe on 3/7/19.
//  Copyright © 2019 Jaime Uribe. All rights reserved.
//
import Foundation
import Security
import UIKit

class InicioSesionViewController: UIViewController {
    
    
    
    @IBOutlet weak var listaProspectos: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var contrasenaTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func inicioSesionBoton(_ sender: Any) {
        
        let email = emailTextField.text!
        let contrasena = contrasenaTextField.text!
        
        //validación
        if (email.isEmpty || contrasena.isEmpty){
            mensajeDeAlerta(userMessage: "Campos requeridos")
            return
        }
        
        if (!email.isEmpty || !contrasena.isEmpty){
        //validar campo contraseña
        let range = NSRange(location: 0, length: email.count)
        let regex = try? NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}", options: [])
        let validation = regex?.firstMatch(in: email, options: [], range: range)
        
        if(validation == nil ){
            mensajeDeAlerta(userMessage: "Email inválido")
            return
        }else {
            
            
            let ini = iniciarSesion(usuario: email, contrasenaUsuario: contrasena)
            
            }
            
        }
       
    }
    
    
    
    func mensajeDeAlerta(userMessage:String){
        
        let alerta = UIAlertController(title: "Alerta", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        
        let accion = UIAlertAction(title: "Cerrar", style: UIAlertAction.Style.default) { _ in alerta.dismiss(animated: true, completion: nil) }
        
        alerta.addAction(accion)
        self.present(alerta, animated: true, completion:nil)
    }
    
    
    
    
    
    func iniciarSesion(usuario: String, contrasenaUsuario: String) -> [Any]{
        
        
        var tokens: [AnyObject] = []
        let scriptUrl = "http://directotesting.igapps.co/application/login"
        
        // Agregando parametros
        let urlWithParams = scriptUrl + "?email=\(usuario)&password=\(contrasenaUsuario)"
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
                print("error=\(error)")
                return
            }
            
            // Print out response string
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(responseString)")
            
            
            // Convert server json response to NSDictionary
            do {
                if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                    
                    // Print out dictionary
                    tokens = [convertedJsonIntoDict]
                    print(convertedJsonIntoDict)
                    
                    
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
        }
        
        task.resume()
        
        return tokens
      
        
    }
    
    
    

}
