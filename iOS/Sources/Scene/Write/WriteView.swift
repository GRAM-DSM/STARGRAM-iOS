import SwiftUI

import PhotosUI

struct WriteView: View {
    @StateObject var viewModel: WriteViewModel
    @State var showPhotoPicker: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                    .frame(height: 30)
                DropdownSelector(
                    selectedOption: $viewModel.major,
                    placeholder: "분야 선택"
                )
                .background(
                    VStack(spacing: 0) {
                        Spacer()
                            .frame(height: 60)
                        TextField(
                            "제목을 입력해주세요.",
                            text: $viewModel.title
                        )
                        .font(.body300)
                        .padding(.vertical, 6)
                        .border(
                            width: 1,
                            edges: [.bottom],
                            color: .gray2
                        )
                        .padding(.horizontal, 33)

                        Spacer()
                            .frame(height: 28)

                        PostImageView(
                            images: $viewModel.images,
                            showImagePicker: $showPhotoPicker
                        )
                        .padding(.horizontal, 33)

                        Spacer()
                            .frame(height: 13)

                        ZStack(alignment: .topLeading) {
                            TextEditor(text: $viewModel.content)
                                .font(.body500)
                                .padding(.horizontal, 30)
                                .frame(
                                    minHeight: 340,
                                    maxHeight: .infinity
                                )
                            if viewModel.content.isEmpty {
                                Text("내용을 입력하세요.")
                                    .font(.body500)
                                    .foregroundColor(.gray1)
                                    .padding(.top, 7)
                                    .padding(.leading, 33)
                            }
                        }
                    },
                    alignment: .top
                )
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    print("게시")
                } label: {
                    Text("게시")
                        .foregroundColor(.orange1)
                        .font(.body700)
                        .padding()
                }
            }
        }
    }
}

struct WriteView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = WriteViewModel()
        WriteView(viewModel: viewModel)
    }
}
