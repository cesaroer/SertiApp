//
//  SingUpViewController.swift
//  sertiAppPrueba
//
//  Created by Cesar on 27/03/20.
//  Copyright © 2020 CesarVargas. All rights reserved.
//

import UIKit
import Alamofire

class SingUpViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var apellidoTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupElements()
        sendUsrData(email: "lindsay.ferguson@reqres.in", pass: "asdfg")

    }

    //Verifica los campos y valida que los datos son correctos, si todo esta bien la funcion devuelve nil, en otro caso devuelve mensaje de error
    func validarCampos() -> String? {
            
            //Verificamos que los campos tienen datos
           
            if nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
              || apellidoTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
              || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
              || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
                return "Por favor llena todos los campos"
            }
            
            //Verificar si la contraseña es segura
            //*Usamos trimmingCharacters(in: .whitespacesAndNewlines) para limpiar de espacios y saltos de linea la contraseña del usuario*
            let cleanPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            if Styles.isPasswordValid(cleanPassword) == false {
                //La contraseña no es suficientemente segura
                return "introduce una contraseña con: al menos 8 caracteres ,un caracter especial y un numero"
            }
            return nil
    }
    
    @IBAction func signUpBtnTapped(_ sender: Any) {
        let error = validarCampos()
        if error != nil{
            //Hubo un error en algun campo entonces mostramos mensaje de error
            showErrorMessage(error!)
        }
    }
    
    func setupElements(){
        //ocultamos el label de error mientras no haya uno
        errorLabel.alpha = 0
        //Aplicamos los estilos a los texfields
        Styles.styleTextField(nameTextField)
        Styles.styleTextField(apellidoTextField)
        Styles.styleTextField(emailTextField)
        Styles.styleTextField(passwordTextField)
        //Aplicamos los estilos a el boton
        Styles.styleFilledButton(signUpButton)
    }
    
//Función que muestra el label con un mensaje de error
    func showErrorMessage(_ message: String){
            errorLabel.text = message
            errorLabel.alpha = 1
    }
    
//Funcionpara mandar el registro del usuario a la API
    
    func sendUsrData(email: String, pass: String) {
        
        let urlString = "https://reqres.in/api/register"
        let urlToRequest = URL(string: urlString)!
        //Se crea el diccionario con parametros a enviar
        let dictionaryToSend = [
            "email" : email,
            "password": pass
        ]
        //Peticion Post
        AF.request(urlToRequest, method: .post, parameters: dictionaryToSend , encoding: JSONEncoding.default)
            .responseJSON { (response) in
            switch response.result {
                case .success:
                    debugPrint(response)
                    //print(" Respuesta a peticion POST: \(response.result)")
                case .failure(let error):
                    print(error)
            }//END SC
        }//END Alamorife
    }//END sendUsrData
    


}
