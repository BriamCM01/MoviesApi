//
//  PerfilViewController.swift
//  MyMoviesD
//
//  Created by Briam Cano on 22/11/24.
//

import UIKit

class PerfilViewController: UIViewController {

    @IBOutlet weak var imgUserName: UIImageView!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var btnUpdate: UIButton!
    @IBOutlet weak var txtFavoriteMovie: UITextField!
    @IBOutlet weak var btnClose: UIButton!
    
    let alert = GenericCustomAlertViewController(nibName: "GenericCustomAlertViewController", bundle: .main)
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        guard let userName = UserDefaults.standard.string(forKey: "userName") else {return}
//        let index: String.Index = userName.index(userName.startIndex, offsetBy: 2)
//        var result: String = userName.substring(to: index)
//
//        let firstLetters = result.toImage()
        imgUserName.image = UIImage(systemName: "person.fill")
        txtUserName.placeholder = UserDefaults.standard.string(forKey: "userName")
        txtFavoriteMovie.placeholder = UserDefaults.standard.string(forKey: "favoriteMovie")
        imgUserName.tintColor = .appColor900
    }
    
    @IBAction func didTouchClose(_ sender: Any) {
        self.dismiss(animated: true)
    }

    @IBAction func didTouchUpdate(_ sender: Any) {
        if txtUserName.text?.count == 0 || txtFavoriteMovie.text?.count == 0 {
            alert.setupViewModel(CustomGenericAlertViewModel(title: "Upss!", img: "bubble.left.and.exclamationmark.bubble.right.fill", overview: "Por favor realiza algun cambio para poder actualizar tu perfil."), isFromHome: true)
            alert.modalPresentationStyle = .overCurrentContext
            self.present(alert, animated: true)
        } else {
            self.dismiss(animated: true, completion: { [self] in
            UserDefaults.standard.setValue(txtUserName.text, forKey: "userName")
            UserDefaults.standard.setValue(txtFavoriteMovie, forKey: "favoriteMovie")
                self.alert.setupViewModel(CustomGenericAlertViewModel(title: "¡Actualizado!", img: "person.fill.checkmark", overview: "Tu nombre de perfil ha sido actualizado."), isFromHome: true)
                self.alert.modalPresentationStyle = .overCurrentContext
                self.present(self.alert, animated: true)
            })
        }
    }
}
