//
//  Home.swift
//  UI-483
//
//  Created by nyannyan0328 on 2022/02/27.
//

import SwiftUI

struct Home: View {
    
    @State var progress : CGFloat = 0.5
    @State var startAnimation : CGFloat = 0
    var body: some View {
        VStack{
            
            
            Image("p1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .padding(10)
                .background(.white,in: Circle())
            
            
            Text("King")
                .fontWeight(.bold)
                .foregroundColor(.gray)
            
            
            GeometryReader{proxy in
                
                
                let size = proxy.size
                ZStack{
                    
                    Image(systemName: "drop.fill")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .scaleEffect(x:1.2,y:1)
                        .offset(y: -1)
                    
                    
                  
                    
                    
                    
                    
                    WaterWave(progress: progress, waveHeight: 0.1, offset: startAnimation)
                        .fill(Color("Blue"))
                        .overlay {
                            
                            
                           
                                
                                
                                
                                Circle()
                                    .fill(.white.opacity(0.3))
                                    .frame(width: 16, height: 16)
                                    .offset(x: 10, y: 30)
                            
                            
                            Circle()
                                .fill(.white.opacity(0.1))
                                .frame(width: 15, height: 15)
                                .offset(x: 40,y: 30)
                            
                            Circle()
                                .fill(.white.opacity(0.1))
                                .frame(width: 15, height: 15)
                                .offset(x: 40,y: 30)
                            
                            Circle()
                                .fill(.white.opacity(0.1))
                                .frame(width: 15, height: 15)
                                .offset(x: -30,y: 80)
                            
                            
                            Circle()
                                .fill(.white.opacity(0.1))
                                .frame(width: 25, height: 25)
                                .offset(x: 50,y: 70)
                            
                            Circle()
                                .fill(.white.opacity(0.1))
                                .frame(width: 15, height: 15)
                                .offset(x: 40,y: 100)
                            
                            Circle()
                                .fill(.white.opacity(0.1))
                                .frame(width: 15, height: 15)
                                .offset(x: -40,y: 50)
                                
                           
                            
                        
                            
                        }
                        .mask {
                            
                            Image(systemName: "drop.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(20)
                            
                        }
                        .overlay(alignment: .bottom) {
                            
                            
                            
                            Button {
                                
                                progress += 0.01
                                
                            } label: {
                                
                                Image(systemName: "plus")
                                    .font(.title)
                                    .foregroundColor(.black)
                                    .padding(20)
                                    .background(.white,in: Circle())
                                    .offset(y: 30)
                                
                            }

                            
                        }
                
                    
                    
                    
                    
                    
                    
                }
                .frame(width: size.width, height: size.height)
                .onAppear {
                    
                    
                    withAnimation(.linear(duration: 2).repeatForever(autoreverses: true)){
                        
                        
                        startAnimation = size.width
                    }
                }
                
                
            }
            .frame(height:300)
            
            
            
            Slider(value: $progress)
                .padding(.horizontal)
                .offset(y: 200)
            
        
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top)
        .background(Color("BG"))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct WaterWave : Shape{
    
    
    var progress : CGFloat
    var waveHeight : CGFloat
    
    
    var offset : CGFloat
    
    var animatableData: CGFloat{
        
        get{offset}
        set{offset = newValue}
        
    }
    func path(in rect: CGRect) -> Path {
        
        return Path{path in
            
            
            path.move(to: .zero)
            
            let progressHeight : CGFloat = (1 - progress) * rect.height
            
            let height = waveHeight * rect.height
            
            
            for value in stride(from: 0, to: rect.width, by: 2){
                
                let x : CGFloat = value
                let sine = sin(Angle(degrees: value + offset).radians)
                
                let y : CGFloat = (progressHeight + (height * sine))
                
                path.addLine(to: CGPoint(x: x, y: y))
                
                
            }
            
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
        }
    }
}
