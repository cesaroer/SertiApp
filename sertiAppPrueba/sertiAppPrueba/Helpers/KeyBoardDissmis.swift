//
//  KeyBoardDissmis.swift
//  sertiAppPrueba
//
//  Created by Cesar on 28/03/20.
//  Copyright © 2020 CesarVargas. All rights reserved.
//

import UIKit

//Añadimos extension para configurar el Gesture
extension UIViewController {
    //Funciones para ocultar los keyboards
    
    func hideKeyboard(){
        let tap: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector (dissmissKeyboard))
    
        view.addGestureRecognizer(tap)
    
    }

    @objc func dissmissKeyboard(){
        view.endEditing(true)
    }
    
}
