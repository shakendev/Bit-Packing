//
//  ContentView.swift
//  Bit Packing
//
//  Created by Dimka Novikov on 02.12.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var byte: UInt8 = .zero
    @State private var lastReadByte: UInt8?

    @State private var position: UInt8 = .zero

    var body: some View {
        VStack(spacing: 50) {
            Text("Bit Packing")
                .font(.system(size: 40))
                .bold()

            VStack(spacing: 50) {
                VStack(spacing: 20) {
                    HStack {
                        Text("Byte:  ")

                        Text(byte.asString)

                        Spacer()

                        HStack(spacing: 10) {
                            Text("|")

                            Spacer()

                            Text("\(byte)")
                        }
                        .frame(width: 120)
                    }

                    HStack {
                        Text("State (at \(position))")

                        Spacer()

                        HStack(spacing: 10) {
                            Text("|")

                            Spacer()

                            if let lastReadByte {
                                let state = Bool(lastReadByte)

                                Text(state.description)
                            } else {
                                Text("?")
                            }
                        }
                        .frame(width: 120)
                    }
                }
                .font(.system(size: 20, weight: .bold, design: .monospaced))

                Stepper("Position: \(position)", value: $position, in: 0 ... 7, step: 1)
                    .font(.system(size: 20, weight: .bold, design: .monospaced))

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
            .padding(.horizontal)
        }
    }

    private func clear() {
        byte = BitField.clear(byte, at: position)
    }

    private func read() {
        lastReadByte = BitField.read(byte, at: position)
    }

    private func set() {
        byte = BitField.set(byte, at: position)
    }

    private func toggle() {
        byte = BitField.toggle(byte, at: position)
    }

    private func reset() {
        byte = .zero
    }
}

extension UInt8 {
    var asString: String {
        let leadingZeroBitString = String(repeating: "0", count: leadingZeroBitCount)

        guard leadingZeroBitCount < bitWidth else {
            return leadingZeroBitString
        }

        return leadingZeroBitString + .init(self, radix: 2)
    }
}

extension Bool {
    init(_ byte: UInt8) {
        self = byte != .zero
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
