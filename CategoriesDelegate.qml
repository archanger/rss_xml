import QtQuick 2.8

Rectangle {
  id: delegate
  property real itemWidth
  width: itemWidth
  height: 80

  property bool selected: ListView.isCurrentItem

  Text {
    id: title
    scale: selected ? 1.0 : 0.8
    color: selected ? "#000" : "#AAA"
    Behavior on color {
      ColorAnimation {
        duration: 300
      }
    }

    Behavior on scale {
      PropertyAnimation {
        duration: 300
      }
    }

    anchors {
      left: parent.left
      leftMargin: 10
      right: parent.right
      rightMargin: 10

      verticalCenter: delegate.verticalCenter
      }
    text: name
    font {
      pointSize: 18
      bold: true
    }

    verticalAlignment: Text.AlignVCenter
    wrapMode: Text.WordWrap
  }

  MouseArea {
    anchors.fill: delegate
    onClicked: {
      categories.currentIndex = index
      if (categories.currentUrl == url)
        newsModel.reload()
      else
        categories.currentUrl = url
    }
  }
}
