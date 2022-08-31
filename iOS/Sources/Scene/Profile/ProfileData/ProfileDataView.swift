import SwiftUI
import Service

struct ProfileDataView: View {
    var editProfileView: EditProfileView
    let profile: Profile

    var body: some View {
        HStack(spacing: 28) {
            AsyncImage(
                url: URL(string: profile.image)
            ) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    Color.gray2
                }
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(profile.name)
                    .font(.body100)
                Text(profile.introduce)
                    .font(.small200)
                if profile.link != "" {
                    Link(
                        "\(profile.link)",
                        destination: URL(string: profile.link)!
                    ).font(.small200)
                }
                NavigationLink(
                    destination: editProfileView
                ) {
                    Text("프로필 수정")
                        .font(.button500)
                        .foregroundColor(.orange2)
                }
                .frame(width: 170, height: 24)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(lineWidth: 1)
                        .foregroundColor(.orange2)
                )
            }
        }
    }
}
