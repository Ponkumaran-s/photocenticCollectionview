//
//  PhotoCentricViewController.swift
//  checkphotocentric
//
//  Created by Ponkumar's Mac on 10/12/19.
//  Copyright © 2019 Ponkumar's Mac. All rights reserved.
//

import UIKit

class PhotoCentricViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}

extension PhotoCentricViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "table" , for:    indexPath) as! PhotoCenticTableViewCell
               return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        500
    }
    
    
}
