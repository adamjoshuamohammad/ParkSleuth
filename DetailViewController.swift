//
//  DetailViewController.swift
//  ParkSleuth
//
//  Created by Ashley Gong on 4/24/21.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var parkImage: UIImageView!
    @IBOutlet weak var parkName: UILabel!
    @IBOutlet weak var parkAddress: UILabel!
    @IBOutlet weak var hoursOpen: UILabel!
    @IBOutlet weak var popularTimes: UILabel!
    
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
