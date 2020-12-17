//
//  WritingPetitionViewController.swift
//  GSMfestival
//
//  Created by 김유진 on 2020/11/14.
//

import UIKit



class PetitionViewController: UIViewController{
    var petitionContent: String!
    var petitionTitle: String!
    
    @IBOutlet weak var profileButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        profileButton.contentVerticalAlignment = .fill
        profileButton.contentHorizontalAlignment = .fill
        profileButton.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    @IBOutlet weak var petitionTextview: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let  vc = segue.destination as? WritingPetitionViewController {
            vc.delegate = self
        }
    }
}

extension PetitionViewController: WritingPetitionDelegate {
    func submitBtn(title: String, content: String) {
        petitionTextview.text = "청원제목 : \(title)\n\n청원내용 : \(content)"
    }
    
}
