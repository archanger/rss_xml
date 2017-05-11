import QtQuick 2.8

Rectangle {
  id: delegate
  property real itemWidth
  width: itemWidth
  height: 80

  Text {
    id: title
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
}
