//
//  AppSettingView.swift
//  StatsVault
//
//  Created by shsw228 on 2023/09/10
//


import SwiftUI
import Milepost
import LicenseList

struct AppSettingRootView: View {
    let viewName: String = Resources.Setting.title
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var body: some View {
        NavigationStack {
            List{
                // TODO:ルーティングをもう少し改良する
                Section {
                    GeneralSettingCell()
                }
                Section {
                    AppInfomationCell()
                }
                VersionView()
            }
            .labelStyle(AppSettingCellLabelStyle())
            .listStyle(.insetGrouped)
            .navigationTitle(viewName)
            .navigationBarTitleDisplayMode(.large)
        }
        .dynamicTypeSize(...DynamicTypeSize.xxLarge)
    }
}

struct AppSettingCellLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing:10) {
            configuration.icon
                .scaledToFit()
                .foregroundStyle(.white)
                .frame(width: 30)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.gray))
            configuration.title
                .font(.body)
                .frame(maxWidth: .infinity,alignment: .leading)
        }
    }
}

/// General
struct GeneralSettingCell: View {
    var body: some View {
        NavigationLink(
            destination: {
                GeneralSettingRootView()
            },
            label: {
                Label(
                    title: {
                        Text("General")
                    },
                    icon: {
                        Image(systemName: "gear")
                            .resizable()
                            .padding(5)
                    }
                )
            })
    }
}

struct GeneralSettingRootView: View {
    var body: some View {
        Text("UnderConstruction")
            .navigationTitle("General")
            .navigationBarTitleDisplayMode(.inline)
    }
}
/// StatsVaultについて
struct AppInfomationCell: View {
    var body: some View {
        NavigationLink(
            destination: {
                AboutAppRootView()
            },
            label: {
                Label(
                    title: {
                        Text(Resources.Setting.aboutApp)
                    },
                    icon: {
                        //TODO: アプリアイコンに差し替え
                        Image(systemName: "questionmark.app.dashed")
                            .resizable()
                            .padding(5)
                    }
                )
            }
        )
    }
}

struct AboutAppRootView: View {
    let viewName:String = Resources.Setting.aboutApp
    var body: some View {
        List{
            AboutDeveloperView()
            RevisionView()
            LicencesView()
        }
        .navigationTitle(viewName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SettingCell: View {
    var body: some View {
        HStack {
            Image(systemName: "questionmark.app.dashed")
            Text(Resources.Setting.aboutApp)
        }
    }
}
struct AboutDeveloperView: View {
    @Environment(\.openURL) var openUrl
    var body: some View {
        Section() {
            Button {
                openUrl(Constants.twitterUrl)
            } label: {
                LabeledContent("X(Twitter)") {
                    Text(String(localized: "about-app-about-me-x_accounts", defaultValue: "@shsw228"))
                }
            }
        } header: {
            Text(String(localized: "about-app-about-me-title", defaultValue: "I made this app"))
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
                        .font(.caption)
                }
                LabeledContent("Branch") {
                    Text(revision.branch ?? "-")
                        .font(.caption)
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
        Section {
            NavigationLink {
                LicenseListView()
                    .navigationTitle("License")
            } label: {
                Text("License")
            }
        }
    }
}
struct VersionView: View {
    var body: some View {
        let version: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "-"
        let build = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "-"
        LabeledContent {
            Text("\(version)(\(build))")
                .font(.body)
        } label: {
            Label(
                title: {
                    Text(String(
                        localized: "about-app-version",
                        defaultValue: "Version")
                    )},
                icon: { Image(systemName: "number")
                        .resizable()
                        .padding(5)
                }
            )
        }


    }
}
//--- MARK: Previews
struct AppSettingView_Previews: PreviewProvider {
    static var previews: some View {
        AppSettingRootView()
            .previewLayout(.sizeThatFits)
    }

}

struct AppInfoList_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            List{AboutDeveloperView()}
            List{RevisionView()}
            List{LicencesView()}
        }
        .previewLayout(.sizeThatFits)
    }
}
