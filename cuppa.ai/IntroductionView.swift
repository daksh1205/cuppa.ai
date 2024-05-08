import SwiftUI
import Combine

struct IntroductionView: View {
    private let intros = [
        "Hey there, I'm\ncuppa, your\nsidekick for coffee. Craving a boost or pick-me-up? Let's find the perfect\nbrew!",
        "Hello, cuppa here, your guide to fresh coffee flavours.\nNeed a smooth\nstart or bold finish? Let's craft your perfect cup!",
        "Hi, cuppa in the house, your\npersonal coffee companion.\nLooking for a right blend? I'll help you discover your brew!"
    ]
    
    @State private var currentIntroIndex = 0
    
    var body: some View {
        ZStack {
            AppColors.backgroundColor
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                // Using a consistent height for text ensures that it remains stable
                Text(highlightCuppaKeywords(intros[currentIntroIndex]))
                    .font(Font.custom("PlusJakartaSans-Bold", size: 35))
                    .foregroundStyle(AppColors.yellowBrown)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 25)
                    .padding(.top, 40)
                    .frame(minHeight: 250) // Adjust the height as needed
                    .animation(.easeInOut, value: currentIntroIndex)
                
                Spacer(minLength: 20) // Spacing above the slider
                
                // The slider image now has a tap gesture to switch states
                Image("slider")
                    .resizable()
                    .frame(width: 105, height: 15)
                    .padding(.horizontal, 25)
                    .scaledToFit()
                    .onTapGesture {
                        // On tapping, cycle to the next intro text
                        currentIntroIndex = (currentIntroIndex + 1) % intros.count
                    }
                
                Image("cuppahome") // Replace with the actual image name
                    .resizable()
                    .scaledToFit()
                   
                    .frame(maxWidth: .infinity, maxHeight: 287, alignment: .trailing)
                
                
                Spacer()
                // Sign in with Apple Button
                Button(action: {
                    // Implement your action here
                    print("Sign in with Apple tapped")
                }) {
                    HStack {
                        Image(systemName: "applelogo") // Apple logo
                            .font(.system(size: 20))
                        Text("Sign in with Apple")
                            .font(.headline)
                    }
                    .frame(maxWidth: .infinity, minHeight: 60) // Set dimensions
                    .padding(.horizontal, 20)
                    .background(AppColors.yellowBrown) // Apple button background color
                    .foregroundColor(.black) // White text and icon
                    .cornerRadius(20) // Rounded corners with a radius of 20
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                
              
            }
            
        }
    }
    
    // Highlights specific phrases containing "cuppa" in yellow.
    private func highlightCuppaKeywords(_ text: String) -> AttributedString {
        var attributedString = AttributedString(text)
        
        // Keywords to be highlighted.
        let keywords = ["I'm\ncuppa", "cuppa here", "cuppa in the house"]
        
        // Find and style each keyword.
        for keyword in keywords {
            if let range = attributedString.range(of: keyword) {
                attributedString[range].foregroundColor = AppColors.beige
            }
        }
        
        return attributedString
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView()
    }
}
