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
            default:
                EmptyView()
            }
            navigationTitle("Page \(currentPage)")
        }
    }
    struct PageOneView: View {
        let onNextButtonTapped: () -> Void
        @Binding var count: Int
        var body: some View {
            VStack {
                Button("⨁") {
                    onNextButtonTapped()
                    count+=0
                }
                .font(.system(size: 100))
                .padding(.horizontal)
                
            }
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .controlSize(.extraLarge)
            
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(0..<50) {
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
                Button("0-2 stools") {
                    onNextButtonTapped()
                    count += 0
                    
                }      .frame(maxWidth: .infinity)
                    .controlSize(.large)
                    .font(.system(size: 36))
                    .padding(40)
                    .foregroundColor(.white)
                    .background(.orange)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity)
                
                
                Button("3-5 stools") {
                    onNextButtonTapped()
                    count += 5
                }     .frame(maxWidth: .infinity)
                    .controlSize(.large)
                    .font(.system(size: 36))
                    .padding(40)
                    .foregroundColor(.white)
                    .background(.orange)
                    .cornerRadius(10)
                    .controlSize(.large)
                
                Button("6-8 stools") {
                    onNextButtonTapped()
                    count += 10
                } .frame(maxWidth: .infinity)
                    .controlSize(.large)
                    .font(.system(size: 36))
                    .padding(40)
                    .foregroundColor(.white)
                    .background(.orange)
                    .cornerRadius(10)
                    .controlSize(.large)
                Button("8+ stools") {
                    onNextButtonTapped()
                    count += 15
                }   .frame(maxWidth: .infinity)
                    .controlSize(.large)
                    .font(.system(size: 36))
                    .padding(40)
                    .foregroundColor(.white)
                    .background(.orange)
                    .cornerRadius(10)
                    .controlSize(.large)
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
                Button("None") {
                    onNextButtonTapped()
                    count += 0
                }
                .frame(maxWidth: .infinity)
                .controlSize(.large)
                .font(.system(size: 36))
                .padding(40)
                .foregroundColor(.white)
                .background(.orange)
                .cornerRadius(10)
                .frame(maxWidth: .infinity)
                
                Button("Small amount only, in less than 50% of stools") {
                    onNextButtonTapped()
                    count += 10
                }
                .frame(maxWidth: .infinity)
                .controlSize(.large)
                .font(.system(size: 36))
                .padding(40)
                .foregroundColor(.white)
                .background(.orange)
                .cornerRadius(10)
                .controlSize(.large)
                Button("Small amount with most stools") {
                    onNextButtonTapped()
                    count += 20
                }
                .frame(maxWidth: .infinity)
                .controlSize(.large)
                .font(.system(size: 36))
                .padding(40)
                .foregroundColor(.white)
                .background(.orange)
                .cornerRadius(10)
                .controlSize(.large)
                Button("Large amount (50% of the stool content)") {
                    onNextButtonTapped()
                    count += 30
                }
                .frame(maxWidth: .infinity)
                .controlSize(.large)
                .font(.system(size: 36))
                .padding(40)
                .foregroundColor(.white)
                .background(.orange)
                .cornerRadius(10)
                .controlSize(.large)
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
                Button("None") {
                    onNextButtonTapped()
                    count += 0
                }
                .frame(maxWidth: .infinity)
                .controlSize(.large)
                .font(.system(size: 36))
                .padding(40)
                .foregroundColor(.white)
                .background(.orange)
                .cornerRadius(10)
                .frame(maxWidth: .infinity)
                
                Button("Pain can be ignored") {
                    onNextButtonTapped()
                    count += 5
                }
                .frame(maxWidth: .infinity)
                .controlSize(.large)
                .font(.system(size: 36))
                .padding(40)
                .foregroundColor(.white)
                .background(.orange)
                .cornerRadius(10)
                .controlSize(.large)
                Button("Pain cannot be ignored") {
                    onNextButtonTapped()
                    count += 10
                }
                .frame(maxWidth: .infinity)
                .controlSize(.large)
                .font(.system(size: 36))
                .padding(40)
                .foregroundColor(.white)
                .background(.orange)
                .cornerRadius(10)
                .controlSize(.large)
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
                Button("Formed") {
                    onNextButtonTapped()
                    count += 0
                }
                .frame(maxWidth: .infinity)
                .controlSize(.large)
                .font(.system(size: 36))
                .padding(40)
                .foregroundColor(.white)
                .background(.orange)
                .cornerRadius(10)
                .frame(maxWidth: .infinity)
                
                Button("Partially formed") {
                    onNextButtonTapped()
                    count += 5
                }
                .frame(maxWidth: .infinity)
                .controlSize(.large)
                .font(.system(size: 36))
                .padding(40)
                .foregroundColor(.white)
                .background(.orange)
                .cornerRadius(10)
                .controlSize(.large)
                Button("Not formed") {
                    onNextButtonTapped()
                    count += 10
                }
                .frame(maxWidth: .infinity)
                .controlSize(.large)
                .font(.system(size: 36))
                .padding(40)
                .foregroundColor(.white)
                .background(.orange)
                .cornerRadius(10)
                .controlSize(.large)
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
                Button("No limitation of energy") {
                    onNextButtonTapped()
                    count += 0
                }
                .frame(maxWidth: .infinity)
                .controlSize(.large)
                .font(.system(size: 36))
                .padding(40)
                .foregroundColor(.white)
                .background(.orange)
                .cornerRadius(10)
                .frame(maxWidth: .infinity)
                
                Button("A little bit tired") {
                    onNextButtonTapped()
                    count += 5
                }
                .frame(maxWidth: .infinity)
                .controlSize(.large)
                .font(.system(size: 36))
                .padding(40)
                .foregroundColor(.white)
                .background(.orange)
                .cornerRadius(10)
                .controlSize(.large)
                Button("No energy at all") {
                    onNextButtonTapped()
                    count += 10
                }
                .frame(maxWidth: .infinity)
                .controlSize(.large)
                .font(.system(size: 36))
                .padding()
                .foregroundColor(.white)
                .background(.orange)
                .cornerRadius(10)
                .controlSize(.large)
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
                Button("No nocturnal stools") {
                    onNextButtonTapped()
                    count += 0
                }
                .frame(maxWidth: .infinity)
                .controlSize(.large)
                .font(.system(size: 36))
                .padding(40)
                .foregroundColor(.white)
                .background(.orange)
                .cornerRadius(10)
                .frame(maxWidth: .infinity)
                
                Button("Yes") {
                    onNextButtonTapped()
                    count += 10
                }
                .frame(maxWidth: .infinity)
                .controlSize(.large)
                .font(.system(size: 36))
                .padding(40)
                .foregroundColor(.white)
                .background(.orange)
                .cornerRadius(10)
                .controlSize(.large)
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
                    count += 0
                }
            }
        }
        
        struct PageNineView: View {
            let onNextButtonTapped: () -> Void
            @Binding var count: Int
            var body: some View {
                VStack {
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
