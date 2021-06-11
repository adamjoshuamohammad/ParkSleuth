//
//  CategoriesViewController.swift
//  ParkSleuth
//
//  Created by Ashley Gong on 4/24/21.
//

import UIKit

class CategoriesViewController: UIViewController {

    
    @IBAction func skateParkBtn(_ sender: Any) {
      performSegue(withIdentifier: "toSkateparkSegue", sender: self)
    }
    @IBAction func basketballBtn(_ sender: Any) {
        performSegue(withIdentifier: "toBasketballSegue", sender: self)
    }
    @IBAction func tennisCourtBtn(_ sender: Any) {
        performSegue(withIdentifier: "toTennisSegue", sender: self)
    }
    @IBAction func rollerRinkBtn(_ sender: Any) {
        performSegue(withIdentifier: "toRollerRinkSegue", sender: self)
    }
    @IBAction func soccerFieldBtn(_ sender: Any) {
        performSegue(withIdentifier: "toSoccerSegue", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
