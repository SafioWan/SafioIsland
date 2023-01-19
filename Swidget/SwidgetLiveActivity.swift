//
//  SwidgetLiveActivity.swift
//  Swidget
//
//  Created by Safio on 2023/1/18.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct SwidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ZKWidgetAttributes.self) { context in

            // 小技巧：使用该方式进行日志打印
            let _ = debugPrint("context: \(context.attributes)")
            let _=debugPrint("左边图片: \(context.attributes.rightImage)")
            // 锁屏之后，显示的桌面通知栏位置，这里可以做相对复杂的布局

        } dynamicIsland: { context in
            // 灵动岛的布局代码
            DynamicIsland {
                /*
                 这里是长按灵动岛区域后展开的UI
                 有四个区域限制了布局，分别是左、右、中间（硬件下方）、底部区域
                 这里采取左边为App的Icon、右边为上下布局（商品名称+商品图标）、
                 中间为立即购买按钮，支持点击deeplink传参唤起App、
                 底部为价格和倒计时区域
                 */
                
                DynamicIslandExpandedRegion(.leading) {
                    Image("pic_1").resizable().frame(width: 32, height: 32)
                }
                DynamicIslandExpandedRegion(.trailing) {
//                    Text("Trailing")
                    Text(context.attributes.leftImage).font(.subheadline).multilineTextAlignment(.center)
                    Spacer(minLength: 8)
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom")
                    // more content
                }
            } compactLeading: {
                // 这里是灵动岛未被展开左边的布局，这里用来展示App的Icon
//                Text(context.attributes.leftImage)
//                Image(context.attributes.rightImage).resizable().frame(width: 32, height: 32)

//                Image("pic_1").resizable().frame(width: 32, height: 32)
                Image(context.attributes.leftImage).frame(width: 32, height: 32)

//                Spacer(minLength: 8)
            } compactTrailing: {
                // 这里是灵动岛未被展开右边的布局，这里用来商品的名称
//                Image(systemName:context.attributes.rightImage).resizable().frame(width: 32, height: 32)
//                Spacer(minLength: 8)
//                Text("T")
                Text(context.attributes.rightImage).frame(width: 32, height: 32)
            } minimal: {
                // 这里是灵动岛有多个任务的情况下，展示优先级高的任务，位置在右边的一个圆圈区域
                // 这用户展示商品的图标
                Text("Min")
                Image("pic_1").resizable().frame(width: 32, height: 32)
            }
            // 点击整个区域，通过deeplink将数据传递给主工程，做相应的业务
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}
