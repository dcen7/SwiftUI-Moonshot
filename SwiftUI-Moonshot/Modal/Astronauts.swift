//
//  Astronauts.swift
//  SwiftUI-Moonshot
//
//  Created by Mehmet Deniz Cengiz on 10/17/20.
//  Copyright © 2020 Deniz Cengiz. All rights reserved.
//

import Foundation

struct Astronauts {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
}
