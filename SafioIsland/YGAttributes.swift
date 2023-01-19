//
//  YGAttributes.swift
//  SafioIsland
//
//  Created by Safio on 2023/1/18.
//

import Foundation
import ActivityKit

struct ZKWidgetAttributes: ActivityAttributes {
    
    public typealias YGWidgetState = ContentState
    
    public struct ContentState: Codable, Hashable {
        var actionType: Bool
    }

    let leftImage: String
    let rightImage: String

    init(leftImage: String, rightImage: String) {
        self.leftImage = leftImage
        self.rightImage = rightImage
    }
}

@available(iOS 16.1, *)
public class YGActivityManager : NSObject{
        
    static let defaultManager: YGActivityManager = YGActivityManager()
    
    @objc public class func defaultManage() -> YGActivityManager
    {
        return YGActivityManager.defaultManager
    }
    
    @objc public func startActivity(leftPic:String,rightPic:String){
        let attributes = ZKWidgetAttributes(leftImage: leftPic, rightImage: rightPic)
        
        let initialConetntState = ZKWidgetAttributes.YGWidgetState(actionType: true)
        
        do {
            let activity = try Activity<ZKWidgetAttributes>.request(attributes: attributes, contentState: initialConetntState, pushType: nil)
            print("开始显示图片了 \(activity.id)")
        } catch (let error) {
            print("Error ！！开始显示图片\(error.localizedDescription)")
        }
        
    }
    
    @objc public func stopActivity (){
        
        Task {
            for activity in Activity<ZKWidgetAttributes>.activities{
                await activity.end(dismissalPolicy: .immediate)
            }
        }
    }
}
