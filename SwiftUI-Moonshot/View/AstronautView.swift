//
//  AstronautView.swift
//  SwiftUI-Moonshot
//
//  Created by Mehmet Deniz Cengiz on 10/14/20.
//  Copyright © 2020 Deniz Cengiz. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
  
    let missions: [Mission]

    init(astronaut: Astronaut) {
        self.astronaut = astronaut

        var matches = [Mission]()

        let missions = Missions.missions
        for mission in missions {
            if mission.crew.first(where: { $0.name == astronaut.id }) != nil {
                matches.append(mission)
            }
        }

        self.missions = matches
    }

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)

                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)

                    ForEach(self.missions) { mission in
                        HStack {
                            Image(mission.image)
                                .resizable()
                            .scaledToFit()
                                .frame(width: 75, height: 75)

                            Text(mission.displayName)
                                .font(.headline)

                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Astronauts.astronauts

    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
