/*************************************************************************
 *
 * Copyright (c) 2013-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.0

Rectangle {
    width: 150; height: 300; color: "white"

    ListModel {
        id: nameModel
        /*Agregado de elementos, para cada uno se
        especifica la propiedad "team" que servirá
        para organizar la lista*/
        ListElement { name: "Alice"; team: "Crypto" }
        ListElement { name: "Bob"; team: "Crypto" }
        ListElement { name: "Jane"; team: "QA" }
        ListElement { name: "Victor"; team: "QA" }
        ListElement { name: "Wendy"; team: "Graphics" }
    }

    /*Clásico elemento de la lista*/
    Component {
        id: nameDelegate
        Text {
            readonly property ListView __lv: ListView.view
            width: parent.width
            text: model.name;
            font.pixelSize: 24

            MouseArea {
                anchors.fill: parent
                onClicked: __lv.currentIndex = index
            }
        }
    }
    //--> slide
    ListView {
        model: nameModel
        delegate: nameDelegate9
        //--> hide
        anchors.fill: parent
        focus: true
        clip: true
        //<-- hide
        highlight: Rectangle {//--> collapse
            color: "lightblue"
            width: parent.width
        }//<-- collapse
        section.property: "team" // Propiedad de la seccion
        /*Diferentes formas de mostrar la sección*/
        section.criteria: ViewSection.FullString

        section.delegate: Rectangle {
            color: "#b0dfb0"
            width: parent.width
            implicitHeight: text.implicitHeight + 4
            Text {
                id: text
                anchors.centerIn: parent
                font.pixelSize: 16
                font.bold: true
                text: section
            }
        }
    }
    //<-- slide
}
