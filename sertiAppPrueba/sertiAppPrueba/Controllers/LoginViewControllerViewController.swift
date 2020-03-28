//
//  LoginViewControllerViewController.swift
//  sertiAppPrueba
//
//  Created by Cesar on 27/03/20.
//  Copyright © 2020 CesarVargas. All rights reserved.
//

import UIKit

class LoginViewControllerViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
    }
    
    func setupElements(){
     
        //ocultamos el label de error mientras no haya uno
        errorLabel.alpha = 0
        //Aplicamos los estilos a los texfields
        Styles.styleTextField(emailTextField)
        Styles.styleTextField(passwordTextField)
        //Aplicamos los estilos a el boton
        Styles.styleFilledButton(loginButton)
     
     }



}
