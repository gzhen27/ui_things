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
                                .foregroundColor(.purple.opacity(0.7))
                                .font(.title)
                        }
                    }
                    Spacer()
                }
                VStack {
                    Spacer()
                    Text("The Truth")
                        .font(.title)
                        .bold()
                    Spacer()
                }
            }
            .blur(radius: showDetail ? 1.2 : 0)
            .opacity(showDetail ? 0 : 1)
            .animation(.easeOut, value: showDetail)
            if showDetail {
                DetailView(showDetail: $showDetail)
            }
        }
        .animation(.linear, value: showDetail)
    }
}

struct DetailView: View {
    @State private var dragOffSet = CGSize.zero
    @State private var isViewOn = false
    
    @Binding var showDetail: Bool
    
    let barBgGradient = Gradient(colors: [.blue.opacity(0.3), .purple.opacity(0.6)])
    
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
            .offset(dragOffSet)
            .gesture(
                DragGesture(minimumDistance: 10)
                    .onChanged({ value in
                        dragOffSet = value.translation
                    })
                    .onEnded{ value in
                        let xOffSet = abs(value.translation.width)
                        let yOffSet = abs(value.translation.height)
                        if (xOffSet > 100 || yOffSet > 120 ) {
                            showDetail.toggle()
                        } else {
                            dragOffSet = CGSize.zero
                        }
                    }
            )
        }
        .onAppear {
            isViewOn.toggle()
        }
        .animation(.linear, value: showDetail)
    }
}

struct PopUp_Previews: PreviewProvider {
    static var previews: some View {
        PopUp()
    }
}
