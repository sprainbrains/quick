import QtQuick 1.0

Rectangle {
    height: 40
    width: 240
    color: "#FFFFFF"

    Item {
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: height
        id: attachButton

        Image {
            anchors.centerIn: parent
            width: 20
            height: 20
            smooth: true
            source: "../../img/attachment.svg"
            rotation: 135
        }
    }

    Item {
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: height
        id: sendButton

        Image {
            anchors.centerIn: parent
            width: 20
            height: 20
            smooth: true
            source: "../../img/send.svg"
        }
    }

    Flickable {
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: attachButton.right
        anchors.right: sendButton.left
        anchors.margins: 2
        clip: true
        id: innerFlick

        function ensureVisible(r)
        {
            if (contentX >= r.x)
                contentX = r.x;
            else if (contentX+width <= r.x+r.width)
                contentX = r.x+r.width-width;
            if (contentY >= r.y)
                contentY = r.y;
            else if (contentY+height <= r.y+r.height)
                contentY = r.y+r.height-height;
        }

        TextEdit {
            id: innerEdit
            anchors.fill: parent
            font.family: "Open Sans"
            font.pixelSize: 12
            focus: true
            wrapMode: TextEdit.Wrap
            anchors.topMargin: Math.max((parent.height - paintedHeight) / 2, 0)
            onCursorRectangleChanged: innerFlick.ensureVisible(cursorRectangle)
        }

        Text {
            anchors.top: innerEdit.top
            anchors.left: parent.left
            font.family: "Open Sans"
            font.pixelSize: 12
            color: "#8D8D8D"
            visible: innerEdit.text.length == 0
            text: "Write a message..."
        }
    }
}
