import QtQuick 2.8
import QtQuick.Layouts 1.1

Column {
  id: news
  spacing: 8

  Item {
    height: news.spacing
    width: news.width
  }

  Row {
    width: parent.width
    height: children.height
    spacing: news.spacing

    Image {
      id: titleimage
      Layout.preferredHeight: 100
      Layout.maximumWidth: 100
      width: sourceSize.width/sourceSize.height * 50
      height: 50
      source: thumbnail
    }

    Text {
      width: parent.width - titleimage.width
      wrapMode: Text.WordWrap
      font {
        pointSize: 20
        bold: true
      }

      text: title
    }
  }

  Text {
    width: parent.width
    font {
      pointSize: 9
      italic: true
    }
    text: pubDate = " (<a href=\"" + link + "\">Details</a>)"
    onLinkActivated: {
      Qt.openUrlExternally(link)
    }
  }

  Text {
    width: parent.width
    wrapMode: Text.WordWrap
    font.pointSize: 10.5
    horizontalAlignment: Qt.AlignLeft
    text: description
  }
}
