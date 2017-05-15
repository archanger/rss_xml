import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.0
import QtQuick.XmlListModel 2.0
import QtQuick.Controls.Styles 1.4
//import "qrc:/"

ApplicationWindow {
  id: mainWindow
  visible: true
  width: 720
  height: 400
  title: "Reader"
  flags: Qt.Window | Qt.FramelessWindowHint

  TitleBar {
    id: titleBar
  }

  Text {
    id: windowTitle
    text: qsTr("BBC New Reader")
    anchors {
      left: titleBar.left
      leftMargin: 10
      verticalCenter: titleBar.verticalCenter
    }
    color: "#FFF"
    font.pointSize: 10
  }

  BusyIndicator {
    anchors.centerIn: newsView
    running: newsModel.status == XmlListModel.Loading
  }

  Feeds {
    id: categoriesModel
  }

  ListView {
    id: categories

    orientation: ListView.Vertical
    spacing: 3

    property string currentUrl: categoriesModel.get(0).url

    model: categoriesModel
    delegate: CategoriesDelegate {
      id: categoriesDelegate
      itemWidth: categories.width
    }
  }

  ScrollView {
    id: categoriesView
    contentItem: categories
    anchors {
      left: parent.left
      top: titleBar.bottom
      bottom: parent.bottom
    }
    width: 0.2 * parent.width
    style: ScrollViewStyle {
      transientScrollBars: true
    }
  }

  XmlListModel {
    id: newsModel
    source: categories.currentUrl
    namespaceDeclarations: "declare namespace media = 'http://search.yahoo.com/mrss/'; declare namespace atom = 'http://www.w3.org/2005/Atom';"
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
      query: "media:thumbnail[1]/@url/string()"
    }
  }

  ScrollView {
    id: newsView
    anchors {
      left: categoriesView.right
      leftMargin: 10
      right: parent.right
      top: titleBar.bottom
      bottom: parent.bottom
    }
    style: ScrollViewStyle {
      transientScrollBars: true
    }

    ListView {
      id: newsList
      model: newsModel
      delegate: NewsDelegate {
        width: newsList.width
      }
    }
  }


}
