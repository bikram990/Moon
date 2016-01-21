//
//  CollectionViewCells.swift
//  CollectionTry
//
//  Created by Kaunteya Suryawanshi on 20/01/16.
//  Copyright © 2016 Kaunteya Suryawanshi. All rights reserved.
//


import UIKit

class DateCell: UICollectionViewCell {

    @IBOutlet weak var dateField: UILabel!
    @IBOutlet weak var backgroundCircle: UIView!

    func makeCellForDate(date: NSDate) {
        dateField.text = "\(date.day())"

        let today = NSDate.yesterday().dateByAddingDays(1)
        if date.compare(today) == .OrderedAscending {
            self.backgroundColor = Color.lightGray
        } else {
            self.backgroundColor = UIColor.whiteColor()
        }
        if date.isToday() {
            dateField.font = UIFont.boldSystemFontOfSize(dateField.font.pointSize)
        } else {
            dateField.font = UIFont.systemFontOfSize(dateField.font.pointSize)
        }
        if self.selected {
            notifyCellSelected()
        }
    }

    override func prepareForReuse() {
        self.notifyCellDeselected()
    }

    override func awakeFromNib() {
        backgroundCircle.layer.backgroundColor = Color.backgroundBlue.CGColor
        backgroundCircle.layer.cornerRadius = (backgroundCircle.bounds.height / 2) * 1.11
    }

    func notifyCellSelected() {
        backgroundCircle.hidden = false
        dateField.textColor = UIColor.whiteColor()
    }

    func notifyCellDeselected() {
        backgroundCircle.hidden = true
        dateField.textColor = UIColor.blackColor()
    }
}

class FirstDayCell: DateCell {
    @IBOutlet weak var monthField: UILabel!

    override func makeCellForDate(date: NSDate) {
        super.makeCellForDate(date)
        self.monthField.text = date.shortMonthToString()
        if self.selected {
            notifyCellSelected()
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.notifyCellDeselected()
    }

    override func notifyCellSelected() {
        super.notifyCellSelected()
        monthField.hidden = true
    }

    override func notifyCellDeselected() {
        backgroundCircle.hidden = true
        monthField.hidden = false
        dateField.textColor = Color.orange
        monthField.textColor = Color.orange
    }
}

