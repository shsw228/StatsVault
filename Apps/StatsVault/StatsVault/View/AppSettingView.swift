//
//  AppSettingView.swift
//  StatsVault
//  
//  Created by shsw228 on 2023/09/10
//


import SwiftUI
import Milepost
import LicenseList

struct AppSettingView: View {
    var body: some View {
        NavigationView {
            VStack{
                List{
                    AppInfoView()
                }
                .listStyle(.insetGrouped)
                .navigationTitle("設定")
                .navigationBarTitleDisplayMode(.automatic)
            }
        }
        .dynamicTypeSize(...DynamicTypeSize.xxLarge)
    }
}
struct CellView: View {
    var body: some View {
        HStack {
            Image(systemName: "questionmark.app.dashed")
            Text("About StatsVault")
        }
    }
}
struct AboutDeveloperView: View {
    @Environment(\.openURL) var openUrl
    
    var body: some View {
        Section() {
            Button {
                openUrl(URL(string: "https://twitter.com/shsw228")!)
            } label: {
                LabeledContent("X(Twitter)") {
                    Text("@shsw228")
                }
            }
        } header: {
            Text("私が作りました")
        }
    }
}

struct RevisionView: View {
    var body: some View {
        Section {
            if let revision = RevisionLoader.load() {
                LabeledContent("Hash") {
                    Text(revision.hash)
                        .font(.caption)
                }
                LabeledContent("Short Hash") {
                    Text(revision.shortHash)
                }
                LabeledContent("Branch") {
                    Text(revision.branch ?? "-")
                }
                LabeledContent("Last Author") {
                    VStack(alignment: .trailing) {
                        Text(revision.lastCommit.author.name)
                        Text(revision.lastCommit.author.email)
                            .font(.caption)
                    }
                }
                LabeledContent("Commit Message") {
                    Text(revision.lastCommit.subject ?? "-")
                        .font(.caption)
                }
            }
        } header: {
            Text("Revision")
        }
        
    }
}
struct LicencesView: View {
    var body: some View {
        NavigationLink {
            LicenseListView()
                .navigationTitle("License")
        } label: {
            Text("License")
        }
    }
}
struct AppInfoView: View {
    var body: some View {
        Section{
            NavigationLink(destination: {
                List{
                    AboutDeveloperView()
                    RevisionView()
                    LicencesView()
                }
                .navigationTitle("About StatsVault")
            }
            ){
                CellView()
            }
        } footer: {
            Text("version: 1.0")
                .font(.body)
                .fontWeight(.regular)
                .frame(maxWidth: .infinity,
                       alignment: .center)
            
        }
        
    }
}
struct AppSettingView_Previews: PreviewProvider {
    static var previews: some View {
        AppSettingView()
    }
}

struct AppInfoList_Previews: PreviewProvider {
    static var previews: some View {
        List{
            AboutDeveloperView()
            RevisionView()
            LicencesView()
        }
        
    }
}
