//
//  ContentView.swift
//  UI_Things
//
//  Created by G Zhen on 5/20/23.
//

import SwiftUI

struct PopUp: View {
    @State private var showDetail = false
    
    var body: some View {
        ZStack {
            ZStack {
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            showDetail.toggle()
                        }) {
                            Image(systemName: "exclamationmark.circle")
                                .padding()
                                .foregroundColor(.pink)
                                .font(.title)
                        }
                    }
                    Spacer()
                }
                VStack {
                    Spacer()
                    Text("Truth")
                        .font(.title)
                        .bold()
                    Spacer()
                }
            }
            .blur(radius: showDetail ? 1.2 : 0)
            if showDetail {
                DetailView(showDetail: $showDetail)
            }
        }
    }
}

struct DetailView: View {
    @Binding var showDetail: Bool
    
    let barBgGradient = Gradient(colors: [.pink.opacity(0.3), .red.opacity(0.6)])
    
    var body: some View {
        
        ZStack {
            Color.black
                .opacity(0.5)
                .ignoresSafeArea()
                .onTapGesture {
                    showDetail.toggle()
                }
            VStack {
                HStack {
                    ZStack {
                        Text("Detail View")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                        HStack {
                            Spacer()
                            Button(action: {
                                showDetail.toggle()
                            }) {
                                Image(systemName: "xmark")
                                    .font(.body)
                                    .padding()
                            }
                        }
                    }
                }
                .background(barBgGradient)
                Spacer()
                Text("The truth is ... you failed")
                Spacer()
            }
            .frame(height: 300)
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(16)
            .padding(.horizontal)
            .foregroundColor(.black)
        }
    }
}

struct PopUp_Previews: PreviewProvider {
    static var previews: some View {
        PopUp()
    }
}
