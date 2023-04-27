//
//  MovieListView.swift
//  WorkingWithList
//
//  Created by Khuyen Dang T.T. VN.Danang on 27/04/2023.
//

import SwiftUI

struct MovieListView: View {

    @State private var isEditing = EditMode.inactive
    @State private var movies = MovieListViewModel().dummyData()
    @State private var inputMovieText = ""
    @State private var isShowAddInput = false
    @State private var isShowAlert = false
    @State private var count: Int = 0
    @State private var timer: Timer?

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    VStack {
                        if isEditing == .active {
                            if isShowAddInput {
                                inputMovieTextField
                            } else {
                                addButton
                            }
                        }
                    }

                    List {
                        ForEach(movies, id: \.name) { movie in
                            Text(movie.name)
                                .listRowSeparator(.hidden)
                                .gesture(tapGesture)

                        }
                            .onMove(perform: move)
                            .onDelete(perform: delete)
                    }
                        .navigationTitle("My favorite movies")
                        .navigationBarTitleDisplayMode(.inline)
                        .listStyle(.plain)
                        .toolbar { EditButton() }
                    //            .toolbar {
                    //                ToolbarItem(placement: .navigationBarTrailing) {
                    //                    editButton
                    //                }
                    //            }
                    .environment(\.editMode, $isEditing)
                }

                if isShowAlert {
                    showAlert(count: count)
                }
            }
        }
    }

    private var editButton: some View {
        switch isEditing {
        case .inactive:
            return AnyView(
                Button(action: {
                    isEditing = .active
                },
                    label: {
                        Image(systemName: "square.and.pencil")
                    })
            )
        case .active:
            return AnyView(
                Button(action: {
                    isEditing = .inactive
                },
                    label: {
                        Text("Done")
                    })
            )
        default:
            return AnyView(EmptyView())
        }
    }

    private var addButton: some View {
        return AnyView(
            HStack {
                Button(action: {
                    isShowAddInput = true
                }, label: {
                        Image(systemName: "plus.circle")
                        Text("Add a new movie")
                    })
                    .foregroundColor(.red)
            }
        )
    }

    private var inputMovieTextField: some View {
        return AnyView(
            HStack {
                TextField("Enter your film", text: $inputMovieText)
                    .padding(.all, 5)
                    .padding(.leading, 5)
                    .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.green)
                )
                Button(action: {
                    addMovie(name: inputMovieText)
                    isShowAddInput = false
                    inputMovieText = ""
                },
                    label: {
                        Text("Save")
                            .padding(.all, 5)
                    })
                    .foregroundColor(.white)
                    .background(.green)
                    .cornerRadius(5)
            }
                .padding(.horizontal)
        )
    }

    private var tapGesture: some Gesture {
        TapGesture(count: 2)
            .onEnded {
            count = 2
            isShowAlert = true
            dismisAlert()
        }
            .exclusively(before: TapGesture().onEnded {
                count = 1
                isShowAlert = true
                dismisAlert()
            })
    }

    fileprivate func showAlert(count: Int) -> some View {
        return RoundedRectangle(cornerRadius: 10)
            .foregroundColor(count == 1 ? Color(red: 0.941, green: 0.983, blue: 0.951) : Color(red: 1.0, green: 0.986, blue: 0.926))
            .frame(width: 200, height: 120)
            .overlay(
            Text("You taped \(count) time(s)")
        )
    }

    private func dismisAlert() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
            isShowAlert = false
            count = 0
        }
    }

    func move(from source: IndexSet, to destination: Int) {
        movies.move(fromOffsets: source, toOffset: destination)
    }

    func delete(at offsets: IndexSet) {
        movies.remove(atOffsets: offsets)
    }

    func addMovie(name: String) {
        if !name.isEmpty {
            movies.insert(Movie(name: name), at: 0)
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView().previewDevice("iPhone 11")
    }
}
