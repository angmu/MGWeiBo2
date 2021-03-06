//
//  Status.swift
//  MGWeiBo2
//
//  Created by MGBook on 2020/9/17.
//  Copyright © 2020 穆良. All rights reserved.
//

import UIKit

@objcMembers
class Status: NSObject {

    //MARK: 属性
    var created_at: String? //创建时间
    var source: String?     //来源
    var text: String?       //正文
    var mid: Int = 0        //ID
    var pic_urls: [[String : String]]?   //配图
    var user: User?
    var retweeted_status: Status?   //转发微博
    
    //MARK: 自定义构造函数
    init(dict: [String: Any]) {
        super.init()
        setValuesForKeys(dict)
        
        // 1.将用户字典转成 用户模型
        if let userDict = dict["user"] as? [String: Any] {
            user = User(dict: userDict)
        }
        
        // 2. 将转发微博数据 转成 微博模型
        if let retweetedStatusDict = dict["retweeted_status"] as? [String: Any] {
            retweeted_status = Status(dict: retweetedStatusDict)
        }
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
}

/**
 "mid": "4550086426629221",
 "created_at": "Thu Sep 17 10:10:03 +0800 2020",
 "source": "<a href=\"http://app.weibo.com/t/feed/6vtZb0\" rel=\"nofollow\">微博 weibo.com</a>",
 "text": "#琉璃视效# 终极揭秘！"
 
 */
