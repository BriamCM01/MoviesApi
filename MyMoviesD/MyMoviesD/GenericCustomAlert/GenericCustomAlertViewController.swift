//
//  GenericCustomAlertViewController.swift
//  MyMoviesD
//
//  Created by Briam Cano on 22/11/24.
//

import UIKit

class GenericCustomAlertViewController: UIViewController {

    @IBOutlet weak var imgAlert: UIImageView!
    @IBOutlet weak var lblTitleAlert: UILabel!
    @IBOutlet weak var txtOverviewAlert: UITextView!
    @IBOutlet weak var btnAceptar: UIButton!
    
    var viewModel: CustomGenericAlertViewModel!
    
    var isFromHome: Bool!
    override func viewDidLoad() {
        super.viewDidLoad()

        imgAlert.image = UIImage(systemName: viewModel.img)
        lblTitleAlert.text = viewModel.title
        txtOverviewAlert.text = viewModel.overview
        if isFromHome {
            UserDefaults.standard.set(true, forKey: "hasShowedAlert")
        } else {
            UserDefaults.standard.set(false, forKey: "hasShowedAlert")
        }
        
    }
    
    func setupViewModel(_ viewModel: CustomGenericAlertViewModel, isFromHome: Bool) {
        self.viewModel = viewModel
        self.isFromHome = isFromHome
    }

    @IBAction func didTouchAccept(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
