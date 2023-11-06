import QtQuick 1.0
import "../dialog"
import "../message"
import "../control"
import "../auth"

Item {
    id: mainScreen
    state: "MENU"

    states: [
        State {
            name: "MENU"
            PropertyChanges {
                target: messagePage
                anchors.leftMargin: mainScreen.width
            }
        },
        State {
            name: "CHAT"
            PropertyChanges {
                target: messagePage
                anchors.leftMargin: mainScreen.width < 600 * kgScaling ? 0 : dialogPage.width
            }
        }
    ]

    transitions: [
        Transition {
            NumberAnimation {
                properties: "anchors.leftMargin"
                easing.type: Easing.InOutQuad
                duration: 200
            }
        }
    ]

    onStateChanged: {
        topBar.currentState = state;
        messagePage.globalState = "NO_SELECT";
    }

    Rectangle {
        color: "white"
        anchors.top: topBar.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
    }

    DialogPage {
        id: dialogPage
        anchors.top: topBar.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: parent.width < 600 * kgScaling ? parent.width : 300 * kgScaling
    }

    MessageIntroPage {
        id: messageIntroPage
        anchors.top: topBar.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: dialogPage.width
        width: messagePage.width
    }

    MessagePage {
        id: messagePage
        anchors.top: topBar.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: parent.width < 600 * kgScaling ? parent.width : parent.width - 300 * kgScaling
    }

    Rectangle {
        id: sidePanelSeparator
        anchors.top: topBar.bottom
        anchors.bottom: parent.bottom
        anchors.left: messageIntroPage.left
        width: 1 * kgScaling
        color: "#EEEEEE"
    }

    TopBar {
        id: topBar
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
    }

    Drawer {
        id: drawer
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    }

    ImageViewer {
        id: imageViewer
        anchors.fill: parent
    }
}
