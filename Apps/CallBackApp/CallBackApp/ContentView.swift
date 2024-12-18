//
//  ContentView.swift
//  CallBackApp
//
//  Created by Ashish Awasthi on 29/06/23.
//

import SwiftUI
import Combine

struct ContentView: View {

    @State var viewModel: ContentView.ViewModel = ContentView.ViewModel()

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")

            Button("Basic Sample Furture Call") {
                viewModel.futureBasicSample()
            }

            Button("Delay Main") {
                viewModel.createFuture().sink(receiveValue: { value in
                  print(value)
                })
            }
        }
        .padding()
        .onAppear() {

        }
    }
}

extension ContentView {

    class ViewModel: ObservableObject {

        func createFuture() -> Future<Int, Never> {
          return Future { promise in
            promise(.success(42))
          }
        }
        func futureBasicSample() {

            let future = Future<Int, Never> { promise in
                promise(.success(1))
            }
            future.sink(receiveCompletion: { print($0) },
            receiveValue: { print($0) })
        }

        func futureMainDelaySample() {

            let futurePublisher = Future<Int, Never> { promise in
                print("🔮 Future began processing")
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    let number = Int.random(in: 1...10)
                    print("🔮 Future emitted number: \(number)")
                    promise(Result.success(number))
                }
            }
                .print("🔍 Publisher event")


        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
