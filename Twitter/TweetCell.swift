//
//  TweetCell.swift
//  Twitter
//
//  Created by Erik Villavera on 10/8/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let tobeFavorited = !favorited
        if tobeFavorited {
            TwitterAPICaller.client?.favoriteTweet(tweetID: tweetID, success: {
                self.setFavorite(true)
            }, failure: { (Error) in
                print("Favorite did not succeed: \(Error)")
            })
        }else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetID: tweetID, success: {
                self.setFavorite(false)
            }, failure: { (Error) in
                print("Unfavorite did not succeed: \(Error)")
            })
        }
    }
    
    
    @IBAction func retweet(_ sender: Any) {
        let tobeRetweeted = !retweeted
        if tobeRetweeted {
            TwitterAPICaller.client?.retweet(tweetID: tweetID, success: {
                self.setRetweeted(true)
            }, failure: { (Error) in
                print("Retweet did not succeed: \(Error)")
            })
        }else{
            TwitterAPICaller.client?.unretweet(tweetID: tweetID, success: {
                self.setRetweeted(false)
            }, failure: { (Error) in
                print("Unretweet did not succeed: \(Error)")
            })
        }
    }
    
    var retweeted:Bool = false
    var favorited:Bool = false
    var tweetID:Int = -1
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if(favorited){
            favButton.setImage(UIImage(named:"heart-icon-red"), for: UIControl.State.normal)
        }else{
            favButton.setImage(UIImage(named:"heart-icon"), for: UIControl.State.normal)
        }
    }
    
    func setRetweeted(_ isRetweeted:Bool){
        retweeted = isRetweeted
        if(retweeted){
            retweetButton.setImage(UIImage(named:"retweet-icon-blue"), for: UIControl.State.normal)
        }else{
            retweetButton.setImage(UIImage(named:"retweet-icon"), for: UIControl.State.normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
