//
//  SlideInTransition.swift
//  sertiAppPrueba
//
//  Created by Cesar on 30/03/20.
//  Copyright © 2020 CesarVargas. All rights reserved.
//

import UIKit

class SlideInTransition: NSObject, UIViewControllerAnimatedTransitioning {
    //Añadimos una bandera
    var isPresenting = false
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 3.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from) else {return}
        
        let containerView = transitionContext.containerView
        
        let finalWidth = toViewController.view.bounds.width * 0.8
        let finalHeight = fromViewController.view.bounds.height
        
        if isPresenting{
            //Añadimos la vista Menu a la viewContainer
            containerView.addSubview(toViewController.view)
            
            //configurando tamaño sobre la pantalla
            toViewController.view.frame = CGRect(x: -finalWidth, y: 0, width: finalWidth, height: finalHeight)
            
        }
        
        //Animacion de presentacion en la pantalla
        let tranform = {
            toViewController.view.transform = CGAffineTransform(translationX: finalWidth, y: 0)
        }
        
        //Animacion de regreso en dissmis
        let identity = {
            fromViewController.view.transform = .identity
        }
        
        //Animacion de la transicion
        let duration = transitionDuration(using: transitionContext)
        let isCanceled = transitionContext.transitionWasCancelled
        UIView.animate(withDuration: duration, animations: {
            self.isPresenting ? tranform() : identity()
        }) { (_) in
            transitionContext.completeTransition(!isCanceled)
        }

    }
    
    

}
