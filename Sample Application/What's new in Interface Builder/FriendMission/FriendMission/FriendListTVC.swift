//
//  FriendListTVC.swift
//  FriendMission
//
//  Created by csnguyen on 7/18/14.
//  Copyright (c) 2014 csnguyen. All rights reserved.
//

import UIKit
import FriendKit

struct FriendInfo {
    var name:String
    var thumbnail:UIImage
    var fullImageName:String
    var meetingTimes:UInt
    var description:String
}

class FriendListTVC: UITableViewController {
    
    lazy var datalist:Array<FriendInfo> = []
    var selectedIndex:NSIndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
    override func viewDidAppear(animated: Bool)  {
        super.viewDidAppear(animated)
        // in case in collpase mode then have to reselect selected index
        if let svc = splitViewController {
            if svc.collapsed {
                tableView.selectRowAtIndexPath(selectedIndex, animated: false, scrollPosition: UITableViewScrollPosition.Top)
            }
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.identifier == "detailVC" {
            let indexPath = self.tableView.indexPathForSelectedRow()
            let friendVC = segue.destinationViewController as FriendDetailVC
            friendVC.friendInfo = datalist[indexPath.row]
            selectedIndex = indexPath // backup selected index for case from collapse to separate
        }
    }
    
    //MARK: Helper functions
    func setupData(){
        datalist = []
        for (i, name) in enumerate(["Bean", "Theron", "Jolie", "Watson", "Lawrence", "Depp", "Stone", "Dicaprio"]) {
            datalist += FriendInfo(name: name, thumbnail: UIImage(named: name+".jpg"), fullImageName: name+"_Full.jpg", meetingTimes: UInt(i+2), description: "Description\(i)")
        }
    }
    
    //MARK: Table view
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return datalist.count
    }

    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell? {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as FriendListCell
        var friendInfo = datalist[indexPath.row]
        
        cell.tileView.portraitImage = friendInfo.thumbnail
        cell.tileView.meetingTimes = CGFloat(friendInfo.meetingTimes)
        cell.nameLbl.text = friendInfo.name
        cell.meetingTimesLbl.text = "Met \(friendInfo.meetingTimes) times"

        return cell
    }
}
