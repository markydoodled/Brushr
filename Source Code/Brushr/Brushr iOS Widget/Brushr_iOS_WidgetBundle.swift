//
//  Brushr_iOS_WidgetBundle.swift
//  Brushr iOS Widget
//
//  Created by Mark Howard on 31/07/2023.
//

import WidgetKit
import SwiftUI

//Bundle All Types Of iOS Widgets Into One Package
@main
struct Brushr_iOS_WidgetBundle: WidgetBundle {
    var body: some Widget {
        Brushr_iOS_Widget()
        Brushr_30_iOS_Widget()
        Brushr_1_iOS_Widget()
        Brushr_2_iOS_Widget()
        Brushr_3_iOS_Widget()
        Brushr_4_iOS_Widget()
        Brushr_5_iOS_Widget()
    }
}
