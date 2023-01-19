//
//  SwidgetBundle.swift
//  Swidget
//
//  Created by Safio on 2023/1/18.
//

import WidgetKit
import SwiftUI

@main
struct SwidgetBundle: WidgetBundle {
    var body: some Widget {
        Swidget()
        SwidgetLiveActivity()
    }
}
