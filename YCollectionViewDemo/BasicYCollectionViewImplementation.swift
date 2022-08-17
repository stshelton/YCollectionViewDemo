//
//  BasicYCollectionViewImplementation.swift
//  YCollectionViewDemo
//
//  Created by Spencer Shelton on 8/15/22.
//

import SwiftUI
import YCollectionView

struct BasicYCollectionViewImplementation: View {
    
    //section
    typealias Section = CollectionViewSection<AnyHashable, AnyHashable>
    
    //basic Section
    var basicSection = Section(section: BasicSectionData(), items: [BasicDemoData(title: "Test 1"), BasicDemoData(title: "Test 2"), BasicDemoData(title: "Test 3"), BasicDemoData(title: "Test 4")])
    
    
    struct BasicDemoData: Hashable{
        var id: UUID = UUID()
        var title: String
    }
    
    struct BasicSectionData: Hashable{
        var id: UUID = UUID()
        var extraSectionInfo: String = ""
    }
    
    
    var body: some View {
        CollectionView(rows: [basicSection], collectionViewBackgroundColor: UIColor.white, addPullToRefresh: true) { sectionIndex, layoutEnviroment in
            return CreateBasicLayoutSection()
        } cell: { indexPath, cellData in
            switch cellData{
            case let basicCellData as BasicDemoData:
                VStack{
                    Text(basicCellData.title)
                }
                
            default:
                EmptyView()
            }
        } supplementaryView: { kind, indexPath, sectionData in
            //header and footer views
        } loadMoreCells: { loadingSection in
            //logic to load more cells within section
        } loadMoreSections: {
            //logic to load more sections
        } clickedDetailPage: { item in
            //current cell clicked and data associated with cell
        } pullToRefresh: { refreshControl in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                refreshControl.endRefreshing()
            }
        }

    }
    
    private func CreateBasicLayoutSection()-> NSCollectionLayoutSection{
        //1
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        //2
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .fractionalHeight(0.3))
        //3
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
}

struct BasicYCollectionViewImplementation_Previews: PreviewProvider {
    static var previews: some View {
        BasicYCollectionViewImplementation()
    }
}
