//
//  CourseBannerSection.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 25/03/2025.
//

import SwiftUI
import PhotosUI

struct CourseBannerSection: View {
    @State private var photoItem: PhotosPickerItem?
    @State private var banner: ImageState = .empty

    enum ImageState {
        case empty, loading(Progress), success(Image), failure(Error)
    }
    
    private func loadTransferable(from photoItem: PhotosPickerItem) -> Progress {
        return photoItem.loadTransferable(type: Image.self) { result in
            DispatchQueue.main.async {
                guard photoItem == self.photoItem else { return }
                switch result {
                case .success(nil):
                    self.banner = .empty
                case .success(let image?):
                    self.banner = .success(image)
                case .failure(let error):
                    self.banner = .failure(error)
                    break
                }
            }
        }
    }
    var body: some View {
        PhotosPicker(selection: $photoItem, matching: .not(.videos)) {
            Group {
                if case .success(let image) = banner {
                    image
                        .resizable()
                        .scaledToFill()
                } else {
                    ZStack {
                        Color.appGreyContent
                        if case .empty = banner {
                            VStack {
                                Image(systemName: "photo.badge.plus")
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(.primary, .gray)
                                    .imageScale(.large)
                                    .padding(.bottom, 4)
                                
                                Text("Upload Course Banner")
                                    .font(.caption.weight(.medium))
                                    .foregroundStyle(.appFontSubheadline)
                            }
                        } else if case .loading(let progress) = banner {
                            ProgressView(progress)
                        } else if case .failure = banner {
                            Text("Couldn't display image")
                                .font(.title.weight(.medium))
                                .foregroundStyle(.appFontSubheadline)
                        }
                    }
                }
            }
            .frame(height: 125)
            .clipShape(.rect(cornerRadius: 8))
        }
        .onChange(of: photoItem) { oldValue, newValue in
            guard let newValue else {return}
            Task {
                let progress = loadTransferable(from: newValue)
                banner = .loading(progress)
            }
        }
    }
}

#Preview {
    CourseBannerSection()
}
