//
//  HomeView.swift
//  Wordler
//
//  Created by danilka on 06.07.2023.
//

import SwiftUI

struct HomeView: View {
    @State private var showCategory: CGFloat = .infinity
    @State private var show: CGFloat = .infinity
    
    var body: some View {
        ZStack(alignment: .top) {
            
            Color.main.colorInvert()
            
            VStack(spacing: 72) {
                Spacer()
                    .frame(height: 0)
                
                ZStack {
                    
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(0..<10) { category in
                                
                                HomeCategoryView(text: "All words", icon: "🔤")
                            }
                            
                        }
                        .frame(height: showCategory < 0 ? 0 : showCategory )
                }
                    
                Rectangle()
                        .foregroundColor(.clear)
                        .frame(height: showCategory == 0 ? showCategory + 100 : 0 )

                    
                }
                
//                Button {
//                    withAnimation {
//                        showCategory.toggle()
//                    }
//                } label: {
//                    Text("|")
//                }

                
                VStack {
                    Text("\(show)")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.lightGray)
                    
                    CardView()
                }

            }
//            .gesture(
//                DragGesture()
//                    .onChanged({ value in
//                    self.bottomState = value.translation
//                        if self.showFull {
//                            self.bottomState.height += -300
//                        }
//                        if self.bottomState.height < -300 {
//                            self.bottomState.height = -300
//                        }
//
//                })
//                    .onEnded({ _ in
//                        if self.bottomState.height > 50 {
//                            self.showCard = false
//                        }
//
//                        if (self.bottomState.height < -100 && !self.showFull) || (self.bottomState.height < -250 && self.showFull) {
//                            self.bottomState.height = -300
//                            self.showFull = true
//                        } else {
//                            self.bottomState = .zero
//                            self.showFull = false
//                        }
//
//                    })
//        )
            
        }
        .edgesIgnoringSafeArea(.all)
        .gesture(
            DragGesture()
                .onChanged({ value in
                    
                    withAnimation {
                        if showCategory > 30 {
                            self.showCategory = value.translation.height + 25
                        }
                        else{
                            self.showCategory = value.translation.height - 50
                        }
                        
                        if showCategory > 115 {
                            showCategory = 115
                        }
                    }
                    

                })
                .onEnded({ _ in
                    
                    withAnimation {
                        if showCategory <= 0 {
                            showCategory = 0

                        }
                        else if showCategory > 0 {
                            showCategory = 115
                        }
                    }
                    
                    

                })
        )
    }
}

struct CardView: View {
    
    @State private var showTranslation = false
    @State private var showNote = false
    
    var body: some View {
        
        VStack(spacing: -3) {
            Text("Car")
                .font(.system(size: 48, weight: .bold))
            
            ZStack {
                Text("Машина")
                    .font(.system(size: 32, weight: .light))
                    .opacity(showTranslation ? 100 : 0)
                    
                Text("Translate")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 60)
                    .padding(.vertical, 10)
                    .background(Color.accentColor)
                    .clipShape(Capsule())
                    .opacity(showTranslation ? 0 : 100)
                    .onTapGesture {
                        showTranslation = true
                        
                    }
                    
            }
            
            if showNote {
                VStack(alignment: .leading) {
                    
                    Spacer()
                        .frame(height: 15)
                    
                    Divider()
                        .padding(.horizontal, -16)
                    Text("Note")
                        .font(.system(size: 15))
                        .foregroundColor(.init(hex: 0xb6b6b6))
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sit amet urna vitae.")
                        .font(.system(size: 15))
                        .foregroundColor(.main.opacity(0.85))
                        .frame(alignment: .topLeading)
                }
                .padding(.horizontal, 20)
            } else {
                Rectangle()
                    .frame(height: 35)
                    .foregroundColor(.clear)
            }
            
            

        

            
            HStack {
                Spacer()
                Image(systemName: "eye.slash")
                    .font(.system(size: 15))
                    .foregroundColor(.iconGray)
                    .padding(.trailing, 15)
            }
            
            
        }
        .padding(.top, 45)
        .padding(.bottom, 10)
        .frame(width: UIScreen.main.bounds.width - 70)
        .background(Color.main.colorInvert())
        .cornerRadius(25)
        .shadow(color: .stroke, radius: 7)
        .overlay(
        RoundedRectangle(cornerRadius: 25)
        .inset(by: 1.5)
        .stroke(Color.stroke.opacity(0.5), lineWidth: 5)
        )
        .onTapGesture {
            withAnimation {
                showNote.toggle()
            }
            
        }
        
        
    }
}

struct HomeCategoryView: View {
    
    var text: String
    var icon: String
    
    var body: some View {
        VStack {
            Text(icon)
                .font(.system(size: 42))
                .padding(18)
                .background(Color.lightGray)
                .cornerRadius(20)
            
            Text(text)
                .foregroundColor(.iconGray)
        }
    }
}

let screen = UIScreen.main.bounds //границы екрана

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
