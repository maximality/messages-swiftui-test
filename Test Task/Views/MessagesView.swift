import SwiftUI

struct MessagesView: View {
    
    @State var messageList = [Dialogue]()
    @State var allLoaded = false
    @State var count = 0
    
    var body: some View {
        NavigationView {
            List(messageList.indices.reversed(), id: \.self) { index in
                MessageView(message: dialogues[index].line)
                    .padding(.trailing)
                    .scaleEffect(x: 1, y: -1, anchor: .center)
                    .animation(nil)
                    .opacity(loadedChecker(messageListCount: messageList.count,
                                           index: index))
            }.scaleEffect(x: 1, y: -1, anchor: .center)
                .navigationBarTitle(Text("Dialogue"), displayMode: .inline)
                .onAppear {
                    addNewMessage()
            }
            .animation(.default)
        }
    }
    
    private func addNewMessage() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            guard self.count < dialogues.count else {
                self.allLoaded = true
                return
            }
            self.messageList.append(dialogues[self.count])
            self.count += 1
        })
    }
    
    private func loadedChecker(messageListCount: Int, index: Int) -> Double {
        if allLoaded {
            return 1
        } else {
            if messageListCount - 1 == index {
                return 0.5
            } else {
                return 1
            }
        }
    }
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().tableFooterView = UIView()
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
