import SwiftUI

struct EditProfileView: View {
    @StateObject var viewModel: EditProfileViewModel
    @Environment(\.dismiss) var dismiss
    @State var showActionSheet: Bool = false
    @State var showImagePicker: Bool = false
    @State var sourceType: UIImagePickerController.SourceType = .camera

    var body: some View {
        VStack(spacing: 25) {
            Spacer()
                .frame(height: 28)
            Image(uiImage: viewModel.image)
                .resizable()
                .scaledToFill()
                .background(Color.gray1)
                .clipShape(Circle())
                .frame(width: 100, height: 100)
            Button {
                self.showActionSheet = true
            } label: {
                Text("프로필 사진 변경")
                    .font(.button300)
                    .foregroundColor(.orange1)
            }.actionSheet(isPresented: $showActionSheet) {
                .init(
                    title: Text("이미지"),
                    message: nil,
                    buttons: [
                        .default(Text("라이브러리에서 가져오기"), action: {
                            self.showImagePicker = true
                            self.sourceType = .photoLibrary
                        }),
                        .default(Text("삭제")),
                        .default(Text("카메라"), action: {
                            self.showImagePicker = true
                            self.sourceType = .camera
                        }),
                        .cancel(Text("취소"))
                    ])
            }
            AuthTextField(
                title: "이름",
                placeholder: "이름",
                text: $viewModel.name
            )
            .padding(.horizontal, 46)
            AuthTextField(
                title: "한 줄 소개",
                placeholder: "한 줄 소개",
                text: $viewModel.introduce
            )
            .padding(.horizontal, 46)
            AuthTextField(
                title: "링크",
                placeholder: "링크",
                text: $viewModel.link
            ).padding(.horizontal, 46)
            Spacer()
        }.sheet(isPresented: $showImagePicker) {
            ImagePicker(sourceType: self.sourceType) { image in
                    viewModel.image = image
                }
        }
        .setNavigationBackButton()
        .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    viewModel.editProfile()
                } label: {
                    Text("완료")
                        .foregroundColor(.orange1)
                        .font(.button300)
                }
            }
            .onChange(of: viewModel.isSuccess) {
                if $0 {
                    dismiss()
                }
            }
            .onAppear(perform: viewModel.fetchProfile)
    }
}
