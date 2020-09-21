import SwiftUI

struct MessageView: View {

    var message: String
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom, spacing: 0) {
                drawTriangleMessage()
                    .zIndex(0.1)
                    .clipped()
                    .padding(.trailing, -1)
                    .padding(.bottom, 12)
                
                Text(message)
                    .padding(10)
                    .lineLimit(nil)
                    .background(messageShadow)
            }
        }
    }
    
    private var messageShadow: some View {
      RoundedRectangle(cornerRadius: 6)
        .foregroundColor(.white)
        .shadow(color: .gray, radius: 2, x: 0, y: 1)
    }
    
    func drawTriangleMessage() -> some View {
        Path { path in
          path.move(to: CGPoint(x: 0, y: 12 * 0.5))
          path.addLine(to: CGPoint(x: 12, y: 12))
          path.addLine(to: CGPoint(x: 12, y: 0))
          path.closeSubpath()
        }
        .fill(Color.white)
        .frame(width: 12, height: 12)
        .shadow(color: .gray, radius: 2, x: 0, y: 1)
    }
}

struct MessageViewRow_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: dialogues[0].line)
    }
}
