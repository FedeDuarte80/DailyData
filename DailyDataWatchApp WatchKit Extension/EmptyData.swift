//  Created by Fede Duarte on 31/5/22.

import SwiftUI

struct EmptyData: View {
    var body: some View {
        VStack {
            Text("Add your data from your iPhone first!!!").padding(.top, 40)
            Image(systemName: "apps.iphone.badge.plus")
                .resizable()
                .scaledToFill()
                .frame(width: 35, height: 35)
                .padding()
        }
    }
}

struct EmptyData_Previews: PreviewProvider {
    static var previews: some View {
        EmptyData()
    }
}
