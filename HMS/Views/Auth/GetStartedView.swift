import SwiftUI

struct GetStartedView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack(alignment: .top) {
                    LinearGradient(
                        colors: [
                            Color(red: 0/255, green: 99/255, blue: 172/255),
                            Color(red: 13/255, green: 146/255, blue: 244/255)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(width: geometry.size.width, height: 500)
                    .clipShape(CustomRoundedShape(radius: 150))
                    .position(x: geometry.size.width / 2, y: 250)

                    LinearGradient(
                        colors: [
                            Color(red: 0/255, green: 99/255, blue: 172/255),
                            Color(red: 71/255, green: 177/255, blue: 255/255)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(width: geometry.size.width, height: 470)
                    .clipShape(CustomRoundedShape(radius: 120))
                    .position(x: geometry.size.width / 2, y: 200)

                    LinearGradient(
                        colors: [
                            Color(red: 0/255, green: 99/255, blue: 172/255),
                            Color(red: 127/255, green: 201/255, blue: 255/255)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(width: geometry.size.width, height: 440)
                    .clipShape(CustomRoundedShape(radius: 90))
                    .position(x: geometry.size.width / 2, y: 150)

                    Text("Logo")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 100, height: 100)
                        .background(Color(red: 33/255, green: 122/255, blue: 255/255))
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color(red: 119/255, green: 205/255, blue: 255/255), lineWidth: 1)
                        )
                        .position(x: geometry.size.width / 2, y: 500)
                }
                .frame(width: geometry.size.width, height: 500)

                Spacer()

                Text("APP NAME")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(Color(red: 8/255, green: 85/255, blue: 142/255))
                    .bold()
                    .padding(.top, 60)

                Text("Track, Manage, Heal")
                    .font(.system(size: 22, weight: .medium))
                    .foregroundColor(Color(red: 62/255, green: 62/255, blue: 62/255))
                    .padding(.top, 20)

                Spacer()

                Button(action: {
                    print("Get Started Tapped")
                }) {
                    Text("Get Started →")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: geometry.size.width * 0.8, height: 50)
                        .background(Color(red: 13/255, green: 146/255, blue: 244/255))
                        .cornerRadius(10)
                }
                .padding(.bottom, 70)
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CustomRoundedShape: Shape {
    var radius: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height - radius))

        path.addQuadCurve(
            to: CGPoint(x: rect.width - radius, y: rect.height),
            control: CGPoint(x: rect.width, y: rect.height)
        )

        path.addLine(to: CGPoint(x: radius, y: rect.height))
        path.addQuadCurve(
            to: CGPoint(x: 0, y: rect.height - radius),
            control: CGPoint(x: 0, y: rect.height)
        )

        path.closeSubpath()
        return path
    }
}

#Preview {
    GetStartedView()
}
