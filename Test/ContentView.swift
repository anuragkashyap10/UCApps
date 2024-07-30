//
//  ContentView.swift
//  Test
//
//  Created by Anurag Kashyap on 6/17/24.
//
import SwiftUI
import SwiftData

class UserProgress: ObservableObject {
    @Published var pucaiScore = 0
    @Published var numStools = ""
    @Published var rectalBleeding = ""
    @Published var pain = ""
    @Published var stool = ""
    @Published var energy = ""
    @Published var nocturnal = ""
}

struct ContentView: View {
    @State private var currentPage: Int = 1
    @StateObject var progress = UserProgress()
    @Environment(\.modelContext) var modelContext
    @Query var scores :[DailyScore]
    
    var body: some View {
        NavigationView {
            
            switch currentPage {
            case 1:
                PageOneView(onNextButtonTapped: { currentPage += 1 }, progress:progress,dailyScores:scores)
            case 2:
                PageTwoView(onNextButtonTapped: { currentPage += 1 }, progress:progress)
            case 3:
                PageThreeView(onNextButtonTapped: { currentPage += 1 }, progress:progress)
            case 4:
                PageFourView(onNextButtonTapped: { currentPage += 1 }, progress:progress)
            case 5:
                PageFiveView(onNextButtonTapped: { currentPage += 1 }, progress:progress)
            case 6:
                PageSixView(onNextButtonTapped: { currentPage += 1 }, progress:progress)
            case 7:
                PageSevenView(onNextButtonTapped: { currentPage += 1 },progress:progress)
            case 8:
                PageEightView(onNextButtonTapped: { currentPage += 1 },progress:progress)
                    .onAppear {
                        let dailyScore = DailyScore(score: progress.pucaiScore, numStools: progress.numStools, rectalBleeding: progress.rectalBleeding, pain: progress.pain, stool: progress.stool, energy: progress.energy, nocturnal: progress.nocturnal)
                        modelContext.insert(dailyScore)
                    }
            case 9:
                PageOneView(onNextButtonTapped: { currentPage = 1 },progress:progress,dailyScores:scores)
            default:
                EmptyView()
            }
            navigationTitle("Page \(currentPage)")
        }
    }
    
    
    struct MyButton: View {
      let label: String
      let action: () -> Void

      var body: some View {
        Button(label) {
          action()
        }
        .buttonStyle(MyButtonStyle())
      }
    }
    struct MyButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
            .controlSize(.large)
            .font(.system(size: 20))
            .frame(width: 200)
            .padding(40)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(30)
            .frame(maxWidth: .infinity)
        }
    }
    struct RoundButton: View {
        var body: some View {
            ZStack {
                Circle()
                    .fill(.blue)
                    .frame(width: 90, height: 90)
                    .shadow(color: .gray.opacity(0.5), radius: 10, x: 7, y: 7)
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .font(.system(size: 50, weight: .semibold))
            }
        }
    }
    struct PageOneView: View {
        let onNextButtonTapped: () -> Void
        @ObservedObject var progress: UserProgress
        var dailyScores :[DailyScore]
        

        var body: some View {
            RoundButton()
            .onTapGesture {
                    onNextButtonTapped()
            }
            .padding(10)
            
    
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(dailyScores) { dailyScore in
                        VStack(alignment: .leading) {
                            Text("The score is: \(dailyScore.pucaiScore)")
                                .font(.headline)
                            Text(dailyScore.nocturnal)
                            Text(dailyScore.numStools)
                            Text(dailyScore.pain)
                            Text(dailyScore.rectalBleeding)
                            Text(dailyScore.stool)
                                
                        }
                    }
                }
            }
        }
    }
    struct PageTwoView: View {
        let onNextButtonTapped: () -> Void
        
        @ObservedObject var progress: UserProgress
        
        var body: some View {
            VStack {
                Text("#stools in 24 hours")
                    .font(.system(size: 36))
                MyButton(label:"0-2 stools") {
                    onNextButtonTapped()
                    progress.pucaiScore += 0
                    progress.numStools = "0-2"
                }
                MyButton(label:"3-5 stools") {
                    onNextButtonTapped()
                    progress.pucaiScore += 5
                    progress.numStools = "3-5"
                }
                MyButton(label:"6-8 stools") {
                    onNextButtonTapped()
                    progress.pucaiScore += 10
                    progress.numStools = "6-8"
                }
                MyButton(label:"8+ stools") {
                    onNextButtonTapped()
                    progress.pucaiScore += 15
                    progress.numStools = "8+"
                }
            }
        }
    }
    struct PageThreeView: View {
        let onNextButtonTapped: () -> Void
        
        @ObservedObject var progress: UserProgress
        
        var body: some View {
            VStack {
                Text("Rectal Bleeding")
                    .font(.system(size: 36))
                MyButton(label:"None") {
                    onNextButtonTapped()
                    progress.pucaiScore += 0
                    progress.rectalBleeding = "None"
                }
                MyButton(label:"Small amount only, in less than 50% of stools") {
                    onNextButtonTapped()
                    progress.pucaiScore += 10
                    progress.rectalBleeding = "Small amount only, in less than 50% of stools"
                }
                MyButton(label: "Small amount with most stools") {
                    onNextButtonTapped()
                    progress.pucaiScore += 20
                    progress.rectalBleeding = "Small amount with most stools"
                }
                MyButton(label:"Large amount (50% of the stool content)") {
                    onNextButtonTapped()
                    progress.pucaiScore += 30
                    progress.rectalBleeding = "Large amount (50% of the stool content)"
                }
            }
        }
    }
    
     struct PageFourView: View {
        let onNextButtonTapped: () -> Void
        
        @ObservedObject var progress: UserProgress
        
        var body: some View {
            VStack {
                Text("Abdominal Pain")
                    .font(.system(size: 36))
                MyButton(label: "None") {
                    onNextButtonTapped()
                    progress.pucaiScore += 0
                    progress.pain = "No Pain"
                }
                
                MyButton(label: "Pain can be ignored") {
                    onNextButtonTapped()
                    progress.pucaiScore += 5
                    progress.pain = "Pain can be ignored"
                }
                MyButton(label: "Pain cannot be ignored") {
                    onNextButtonTapped()
                    progress.pucaiScore += 10
                    progress.pain = "Pain Cannot be ignored"
                }
            }
        }
    }
    struct PageFiveView: View {
        let onNextButtonTapped: () -> Void
        
        @ObservedObject var progress: UserProgress

        var body: some View {
            VStack {
                Text("Stool Consistency")
                    .font(.system(size: 36))
                MyButton(label:"Formed") {
                    onNextButtonTapped()
                    progress.pucaiScore += 0
                    progress.stool = "Formed"
                }
                
                MyButton(label:"Partially formed") {
                    onNextButtonTapped()
                    progress.pucaiScore += 5
                    progress.stool = "Partially Formed"
                }
                MyButton(label:"Not formed") {
                    onNextButtonTapped()
                    progress.pucaiScore += 10
                    progress.stool = "Not Formed"
                }
            }
        }
    }
    struct PageSixView: View {
        let onNextButtonTapped: () -> Void
        
        @ObservedObject var progress: UserProgress


        var body: some View {
            VStack {
                Text("Energy Level")
                    .font(.system(size: 36))
                MyButton(label:"No limitation of energy") {
                    onNextButtonTapped()
                    progress.pucaiScore += 0
                    progress.energy = "No Limitation of energy"
                }
                
                MyButton(label:"A little bit tired") {
                    onNextButtonTapped()
                    progress.pucaiScore += 5
                    progress.energy = "A littlbe bit tired"
                }
                MyButton(label:"No energy at all") {
                    onNextButtonTapped()
                    progress.pucaiScore += 10
                    progress.energy = "No Energy at all"
                }
            }
        }
    }
    struct PageSevenView: View {
        let onNextButtonTapped: () -> Void
        
        @ObservedObject var progress: UserProgress

        var body: some View {
            VStack {
                Text("Nocturnal Stools")
                    .font(.system(size: 36))
                MyButton(label:"No nocturnal stools") {
                    onNextButtonTapped()
                    progress.pucaiScore += 0
                    progress.nocturnal = "No"
                }
                
                MyButton(label:"Yes") {
                    onNextButtonTapped()
                    progress.pucaiScore += 10
                    progress.nocturnal = "Yes"
                }
            }
        }
    }
    struct PageEightView: View {
        let onNextButtonTapped: () -> Void
        
        @ObservedObject var progress: UserProgress

        var body: some View {
            VStack {
                Text("Thank you for your response")
                    .font(.system(size: 36))
                    .padding(40)
                Text("#Stools: \(progress.numStools)")
                    .font(.system(size: 15))
                Text("Rectal Bleeding: \(progress.rectalBleeding)")
                    .font(.system(size: 15))
                Text("Your abdonimnal pain is \(progress.pain)")
                    .font(.system(size: 15))
                Text("Stool Consistency: \(progress.stool)")
                    .font(.system(size: 15))
                Text("Your energy level is \(progress.energy)")
                    .font(.system(size: 15))
                Text("Nocturnal Stools: \(progress.nocturnal)")
                    .font(.system(size: 15))

                Text("Your score is \(progress.pucaiScore)")
                    .font(.system(size: 60))
                
                Button ("Back") {
                    onNextButtonTapped()
                    progress.pucaiScore = 0
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        do {
                let config = ModelConfiguration(isStoredInMemoryOnly: true)
                let container = try ModelContainer(for: DailyScore.self, configurations: config)

                let example = DailyScore(score: 10, numStools: "", rectalBleeding: "", pain: "", stool: "", energy: "", nocturnal: "")
                return ContentView()
                    .modelContainer(container)
            } catch {
                fatalError("Failed to create model container.")
            }
    }
}
