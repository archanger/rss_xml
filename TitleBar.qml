import QtQuick 2.0

Row {
  id: titleBar
  width: parent.width
  height: 22
  layoutDirection: Qt.RightToLeft

  property point mPos: Qt.point(0,0)

  Image {
    id: closeButton
    width: 22
    height: 22
    fillMode: Image.PreserveAspectFit
    source: "qrc:/images/close.png"

    MouseArea {
      anchors.fill: parent
      onClicked: {
        Qt.quit()
      }
    }
  }

  Rectangle {
    width: titleBar.width - closeButton.width
    height: titleBar.height
    color: "#000"

    MouseArea {
      anchors.fill: parent
      onPressed: {
        mPos = Qt.point(mouseX, mouseY)
      }
      onPositionChanged: {
        mainWindow.setX(mainWindow.x + mouseX - mPos.x)
        mainWindow.setY(mainWindow.y + mouseY - mPos.y)
      }
    }
  }
}
