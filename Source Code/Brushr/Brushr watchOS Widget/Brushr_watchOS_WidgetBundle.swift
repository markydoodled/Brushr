//
//  Brushr_watchOS_WidgetBundle.swift
//  Brushr watchOS WidgetExtension
//
//  Created by Mark Howard on 01/08/2023.
//

import WidgetKit
import SwiftUI

//Bundle All Types Of watchOS Complications Into One Package
@main
struct Brushr_watchOS_WidgetBundle: WidgetBundle {
    var body: some Widget {
        Brushr_watchOS_Widget()
        Brushr_30_watchOS_Widget()
        Brushr_1_watchOS_Widget()
        Brushr_2_watchOS_Widget()
        Brushr_3_watchOS_Widget()
        Brushr_4_watchOS_Widget()
        Brushr_5_watchOS_Widget()
    }
}
