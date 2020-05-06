//
//  ViewController.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 22/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import Foundation

class ViewsManager: ObservableObject {
    @Published var selected: Int? = nil
    @Published var switchToBasketTab = false
}
