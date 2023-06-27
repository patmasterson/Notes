//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Patrick Masterson on 10/13/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Property
    @AppStorage("lineCount") var lineCount = 1
    
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""
    
    // MARK: Functions
    
    func save() {
       // dump(notes)
        do {
            // 1. Convert notes array to data using JSONEncoder
            let data = try JSONEncoder().encode(notes)
            
            // 2. Create new URL to save file using getDocumentDirectory method
            let url = getDocumentDirectory().appendingPathComponent("notes")
            
            // 3. Write data to given URL
            try data.write(to: url)
            
        } catch {
            print("saving data has failed")
        }
    }
    
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func load() {
        // grand central dispatch
        DispatchQueue.main.async {
            do {
                // 1. get notes url path
                let url = getDocumentDirectory().appendingPathComponent("notes")
                
                // 2. create new prop for data
                let data = try Data(contentsOf: url)
                
                // 3. decode data
                notes = try JSONDecoder().decode([Note].self, from: data)
                
            } catch {
                // do nothing
            }
        }
    }
    
    func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            save()
        }
    }
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            VStack {
    //            Text("Notes")
    //                .foregroundColor(.accentColor)
    //                .fontWeight(.bold)
                
                HStack(alignment: .center, spacing: 6) {
                    TextField("Add New Note", text: $text)
                    Button(action: {
                        // 1. only run action when text is not empty
                        guard text.isEmpty == false else { return }
                        
                        // 2. Create a new note item and init with the text value
                        let note = Note(id: UUID(), text: text)
                        
                        // 3. Add note to notes array
                        notes.append(note)
                        
                        // 4. Make text field empty
                        text = ""
                        
                        // 5. Save the note
                        save()
                        
                    }, label: {
                       Image(systemName: "plus.circle")
                            .font(.system(size: 42, weight: .semibold))
                    })
                    .fixedSize()
                    //.buttonStyle(BorderedButtonStyle(tint: .accentColor))
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.accentColor)
                } //: HStack
                Spacer()
                
                if notes.count >= 1 {
                    
                    List {
                        ForEach(0..<notes.count, id: \.self) { i in
                            NavigationLink(
                                destination: {
                                    DetailView(note: notes[i], count: notes.count, index: i)
                                } ,
                                label: {
                                    NoteRowView(note: notes[i], lineLimit: lineCount)
                                        .font(.title3)
                                        
                                }
                            )
                        }
                        .onDelete(perform: delete)
                    }
                    
                    Spacer()
                    
                } else {
                    Spacer()
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .opacity(0.25)
                        .padding(25)
                    Spacer()
                } // :List
                
            } //: VStack
            .navigationTitle("Notes")
            .onAppear() {
                load()
            }
        }  // : NavigationView
        //.font(.title3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
