//
//  ContentView.swift
//  Bit Packing
//
//  Created by Dimka Novikov on 02.12.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var number: UInt8 = .zero
    @State private var lastReadNumber: UInt8?

    @State private var position: Int = .zero

    var body: some View {
        Color.black
            .ignoresSafeArea()
            .overlay(alignment: .top) {
                Text("Bit Packing")
                    .font(.system(size: 50, weight: .heavy, design: .monospaced))
                    .padding(.top, 100)
            }
            .overlay {
                VStack(spacing: 50) {
                    HStack(spacing: 10) {
                        let array = number.asString.array

                        ForEach(array.indices, id: \.self) { index in
                            Text("\(array[index])")
                                .background {
                                    if index == position {
                                        Color.white.opacity(0.2)
                                            .clipShape(.rect(cornerRadius: 5))
                                            .padding(.horizontal, -5)
                                    }
                                }
                                .onTapGesture {
                                    position = index
                                }
                        }
                        .font(.system(size: 40, weight: .bold, design: .monospaced))
                    }
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .topTrailing) {
                        Text(" \(number)")
                            .font(.system(size: 20, weight: .bold, design: .monospaced))
                    }

                    VStack(spacing: 50) {
                        VStack(spacing: 25) {
                            Group {
                                if let lastReadNumber {
                                    let state = Bool(lastReadNumber)

                                    Text("Read State: \(state.description)")
                                } else {
                                    Text("Read State: ?")
                                }
                            }
                            .font(.system(size: 20, weight: .bold, design: .monospaced))
                            .frame(maxWidth: .infinity, alignment: .leading)

                            Text("Position: \(position)")
                                .font(.system(size: 20, weight: .bold, design: .monospaced))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }

                        VStack(spacing: 40) {
                            HStack(spacing: 10) {
                                Button("Clear", action: clear)
                                Button("Read", action: read)
                                Button("Set", action: `set`)
                                Button("Toggle", action: toggle)
                            }

                            Button("Reset", role: .destructive, action: reset)
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
                .padding(.top, 100)
                .padding(.horizontal)
            }
    }

    private func mirrorPosition(_ position: Int) -> UInt8 {
        let position = (UInt8.bitWidth - 1) - position

        return .init(position)
    }

    private func clear() {
        let mirroredPosition = mirrorPosition(position)

        number = BitPackingOperations.clear(number, at: mirroredPosition)
    }

    private func read() {
        let mirroredPosition = mirrorPosition(position)

        lastReadNumber = BitPackingOperations.read(number, at: mirroredPosition)
    }

    private func set() {
        let mirroredPosition = mirrorPosition(position)

        number = BitPackingOperations.set(number, at: mirroredPosition)
    }

    private func toggle() {
        let mirroredPosition = mirrorPosition(position)

        number = BitPackingOperations.toggle(number, at: mirroredPosition)
    }

    private func reset() {
        number = .zero
        lastReadNumber = nil
        position = .zero
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
