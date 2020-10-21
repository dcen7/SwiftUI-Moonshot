//
//  ContentView.swift
//  SwiftUI-Moonshot
//
//  Created by Mehmet Deniz Cengiz on 10/13/20.
//  Copyright © 2020 Deniz Cengiz. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let missions: [Mission] = Missions.missions
    let astronauts: [Astronaut] = Astronauts.astronauts

    @State var showDate = true

    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)

                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                 
                        if self.showDate {
                            Text(mission.formattedLaunchDate)
                                .font(.subheadline)
                        }
                        else {
                            Text(mission.crewNames(astronauts: self.astronauts))
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showDate.toggle()
                }, label: {
                    Text("Show \(self.showDate ? "crew" : "date")")
                })
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
