

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            
            backgroundView(isNight: $isNight)
            
            VStack {
                CityTextView(cityName: "서울")
                
                mainWeatherImageView(weatherImage: isNight ? "moon.fill" : "cloud.drizzle.fill", temperature: 5)
                //이번주 날씨
                HStack(spacing: 20){
                    weatherInfo(dayOfWeek: "월", weatherImage: "cloud.heavyrain.fill", temperature: 5)
                    weatherInfo(dayOfWeek: "화", weatherImage: "cloud.fog.fill", temperature: 7)
                    weatherInfo(dayOfWeek: "수", weatherImage: "cloud.sun.rain.fill", temperature: 10)
                    weatherInfo(dayOfWeek: "목", weatherImage: "sun.max.fill", temperature: 15)
                    weatherInfo(dayOfWeek: "금", weatherImage: "sun.max.fill", temperature: 14)
                    
                }
                
                Spacer()
                
                Button(action: {
                    self.isNight.toggle()
                }) {
                    if(self.isNight) {
                        weatherButtonTitle(title: "라이트 모드로 전환", backgroundColor: .gray, textColor: .white)
                    } else {
                        weatherButtonTitle(title: "다크 모드로 전환", backgroundColor: .white, textColor: .blue)
                    }
                    
                }
                
                
                Spacer()
            }
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct weatherInfo: View {
    
    var dayOfWeek: String
    var weatherImage: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(.white)
                .padding()
            
            VStack(spacing: 20) {
                Image(systemName: weatherImage)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                Text("\(temperature)°")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
            }
        }
    }
}

struct backgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightblue")]), startPoint: .topTrailing, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
            .animation(.easeIn)
    }
}

struct CityTextView: View {
    
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 30, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

struct mainWeatherImageView: View {
    
    var weatherImage: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: weatherImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

struct weatherButtonTitle: View {
    var title: String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 300, height: 60)
            .background(backgroundColor)
            .cornerRadius(20)
            .font(.system(size: 23, weight: .bold))
            .foregroundColor(textColor)
    }
}
