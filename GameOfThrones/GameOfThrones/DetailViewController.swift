//
//  DetailViewController.swift
//  GameOfThrones
//
//  Created by J on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  @IBOutlet weak var gotImage: UIImageView!
  @IBOutlet weak var gotAirDateLabel: UILabel!
  @IBOutlet weak var gotSummaryTextView: UITextView!
  @IBOutlet weak var gotEpisodeNameLabel: UILabel!
  var gotEpisodeName:String!
  var gotSummary: String!
  var gotAirDate: String!
  var gotImageName: String!
  override func viewDidLoad() {
        super.viewDidLoad()
    gotImage.image = UIImage(named:gotImageName)
    gotAirDateLabel.text = gotAirDate
    gotSummaryTextView.text = gotSummary
    gotEpisodeNameLabel.text = gotEpisodeName
    
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
