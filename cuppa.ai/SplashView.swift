import SwiftUI

struct SplashView: View {
    @State private var navigateToIntroduction = false

    var body: some View {
        NavigationStack {
            ZStack {
                // Background color
                AppColors.backgroundColor
                    .ignoresSafeArea()
                
                // Main vertical stack
                VStack(spacing: 0) {
                    // Image with text inside
                    ZStack {
                        Image("cuppahome") // Replace with the actual image name
                            .resizable()
                            .scaledToFit()
                            .frame(width: 400, height: 287)
                        
                        // Text inside the image, 20 points from the top
                        Text("cuppa.ai")
                            .font(Font.custom("PlusJakartaSans-Bold", size: 50))
                            .foregroundColor(AppColors.lightBrown)
                            .padding(.bottom, 180)
                            .padding(.trailing, 80)
                            .frame(maxWidth: .infinity, alignment: .top)
                    }
                    .padding(.leading, 100)
                }
                
                // Invisible NavigationLink triggered by a tap
                NavigationLink(destination: IntroductionView().navigationBarBackButtonHidden(true), isActive: $navigateToIntroduction) {
                    EmptyView()
                }
            }
            .contentShape(Rectangle()) // Makes the entire ZStack tappable
            .onTapGesture {
                // Navigate to IntroductionView when tapping anywhere on the SplashView
                withAnimation(.easeInOut(duration: 0.5)) {
                    navigateToIntroduction = true
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
