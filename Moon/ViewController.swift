//
//  ViewController.swift
//  Moon
//
//  Created by Kaunteya Suryawanshi on 19/01/16.
//  Copyright © 2016 Kaunteya Suryawanshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // TO hide the under line of naviagation bar
//        navigationController?.navigationBar.shadowImage = UIImage();
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)

        //        self.navigationController?.navigationBar.clipsToBounds = true


        (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize = {
            let screenRect = UIScreen.mainScreen().bounds
            let width = screenRect.width / 7
            let height = collectionView.bounds.height / 4
            return CGSize(width: width, height: height)
            }()

    }

    var startDate: NSDate {
        var startDate = NSDate()
        startDate = startDate.dateAtTheStartOfMonth()
        startDate = startDate.dateBySubtractingDays(80)
        startDate = startDate.dateAtTheStartOfMonth()
        return startDate.dateAtStartOfDay()
    }

    var endDate: NSDate {
        let endDate = NSDate(fromString:  "2016-12-31", format: .ISO8601(nil))
        return endDate.dateAtStartOfDay()
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return startDate.daysBeforeDate(endDate)
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

        let index: Int = indexPath.indexAtPosition(1)
        let date = startDate.dateByAddingDays(index)
        print("Date \(index)  \(date.toString(format: .Custom("dd MMM yyyy HH:mm:ss")))")

        if date.day() == 1 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("firstDayCell", forIndexPath: indexPath) as! FirstDayCell
            cell.month.text = date.shortMonthToString()
            return cell
        } else {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("dateCell", forIndexPath: indexPath) as! DateCell
            let text: String = "\(date.day())"
            cell.textField.text = text

            return cell
        }
    }
}

