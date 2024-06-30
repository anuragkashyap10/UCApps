//
//  ContentView.swift
//  Test
//
//  Created by Anurag Kashyap on 6/17/24.
//
import SwiftUI

struct ContentView: View {
    @State private var currentPage: Int = 1
    @State public var count: Int = 0
    @MainActor @preconcurrency
    
    var body: some View {
        NavigationView {
            
            switch currentPage {
            case 1:
                PageOneView(onNextButtonTapped: { currentPage += 1 }, count: $count)
            case 2:
                PageTwoView(onNextButtonTapped: { currentPage += 1 }, count: $count)
                
            case 3:
                PageThreeView(onNextButtonTapped: { currentPage += 1 }, count: $count)
                
            case 4:
                PageFourView(onNextButtonTapped: { currentPage += 1 }, count: $count)
                
            case 5:
                PageFiveView(onNextButtonTapped: { currentPage += 1 }, count: $count)
            case 6:
                PageSixView(onNextButtonTapped: { currentPage += 1 }, count: $count)
            case 7:
                PageSevenView(onNextButtonTapped: { currentPage += 1 },count: $count)
            case 8:
                PageEightView(onNextButtonTapped: { currentPage += 1 },count: $count)
            case 9:
                PageOneView(onNextButtonTapped: { currentPage = 1 },count:$count)
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
        @Binding var count: Int
        var body: some View {
            RoundButton()
            .onTapGesture {
                    onNextButtonTapped()
            }
            .padding(10)
    
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(0..<100) {
                        Text("Your score is \($0)")
                    }
                }
            }
        }
        
    }
    
    struct PageTwoView: View {
        let onNextButtonTapped: () -> Void
        @Binding var count: Int
        var body: some View {
            VStack {
                Text("#stools in 24 hours")
                    .font(.system(size: 36))
                MyButton(label:"0-2 stools") {
                    onNextButtonTapped()
                    count += 0
                }
                MyButton(label:"3-5 stools") {
                    onNextButtonTapped()
                    count += 5
                }
                MyButton(label:"6-8 stools") {
                    onNextButtonTapped()
                    count += 10
                }
                MyButton(label:"8+ stools") {
                    onNextButtonTapped()
                    count += 15
                }
            }
        }
    }
    
    struct PageThreeView: View {
        let onNextButtonTapped: () -> Void
        @Binding var count: Int
        
        var body: some View {
            VStack {
                Text("Rectal Bleeding")
                    .font(.system(size: 36))
                MyButton(label:"None") {
                    onNextButtonTapped()
                    count += 0
                }
                MyButton(label:"Small amount only, in less than 50% of stools") {
                    onNextButtonTapped()
                    count += 10
                }
                MyButton(label: "Small amount with most stools") {
                    onNextButtonTapped()
                    count += 20
                }
                MyButton(label:"Large amount (50% of the stool content)") {
                    onNextButtonTapped()
                    count += 30
                }
            }
        }
    }
    
    struct PageFourView: View {
        let onNextButtonTapped: () -> Void
        @Binding var count: Int
        
        var body: some View {
            VStack {
                Text("Abdominal Pain")
                    .font(.system(size: 36))
                MyButton(label: "None") {
                    onNextButtonTapped()
                    count += 0
                }
                
                MyButton(label: "Pain can be ignored") {
                    onNextButtonTapped()
                    count += 5
                }
                MyButton(label: "Pain cannot be ignored") {
                    onNextButtonTapped()
                    count += 10
                }
            }
        }
    }
    
    struct PageFiveView: View {
        let onNextButtonTapped: () -> Void
        @Binding var count: Int
        var body: some View {
            VStack {
                Text("Stool Consistency")
                    .font(.system(size: 36))
                MyButton(label:"Formed") {
                    onNextButtonTapped()
                    count += 0
                }
                
                MyButton(label:"Partially formed") {
                    onNextButtonTapped()
                    count += 5
                }
                MyButton(label:"Not formed") {
                    onNextButtonTapped()
                    count += 10
                }
            }
        }
    }
    struct PageSixView: View {
        let onNextButtonTapped: () -> Void
        @Binding var count: Int
        var body: some View {
            VStack {
                Text("Energy Level")
                    .font(.system(size: 36))
                MyButton(label:"No limitation of energy") {
                    onNextButtonTapped()
                    count += 0
                }
                
                MyButton(label:"A little bit tired") {
                    onNextButtonTapped()
                    count += 5
                }
                MyButton(label:"No energy at all") {
                    onNextButtonTapped()
                    count += 10
                }
            }
        }
    }
    struct PageSevenView: View {
        let onNextButtonTapped: () -> Void
        @Binding var count: Int
        var body: some View {
            VStack {
                Text("Nocturnal Stools")
                    .font(.system(size: 36))
                MyButton(label:"No nocturnal stools") {
                    onNextButtonTapped()
                    count += 0
                }
                
                MyButton(label:"Yes") {
                    onNextButtonTapped()
                    count += 10
                }
            }
        }
    }
    
    struct PageEightView: View {
        let onNextButtonTapped: () -> Void
        @Binding var count: Int
        var body: some View {
            VStack {
                Text("Thank you for your response")
                    .font(.system(size: 36))
                    .padding(40)
                Text("Your score is \(count)")
                    .font(.system(size: 60))
                Button ("Back") {
                    onNextButtonTapped()
                    count = 0
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
