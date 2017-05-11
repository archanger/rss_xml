import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.XmlListModel 2.0
//import "qrc:/"

ApplicationWindow {
  visible: true
  width: 720
  height: 400
  title: "Reader"

  Feeds {
    id: categoriesModel
  }

  ListView {
    id: categories

    width: 150
    height: parent.height
    orientation: ListView.Vertical
    anchors.top: parent.top
    spacing: 3

    property string currentUrl: categoriesModel.get(0).url

    model: categoriesModel
    delegate: CategoriesDelegate {
      id: categoriesDelegate
      itemWidth: categories.width
    }
  }

  XmlListModel {
    id: newsModel
    source: categories.currentUrl
    namespaceDeclarations: "declare namespace media = 'http://search.yahoo.com/mrss'; declare namespace atom = 'http://www.w3.org/2005/Atom';"
    query: "/rss/channel/item"

    XmlRole {
      name: "title"
      query: "title/string()"
    }
    XmlRole {
      name: "description"
      query: "description/string()"
    }
    XmlRole {
      name: "link"
      query: "link/string()"
    }
    XmlRole {
      name: "pubDate"
      query: "pubDate/string()"
    }
    XmlRole {
      name: "thumbnail"
      query: "media:thumbnail/@url/string()"
    }
  }

  ListView {
    id: newsList

    anchors {
      left: categories.right
      leftMargin: 10
      right: parent.right
      rightMargin: 10
      top: parent.top
      bottom: parent.bottom
    }
    model: newsModel
    delegate: NewsDelegate {
      width: newsList.width
    }
  }
}
