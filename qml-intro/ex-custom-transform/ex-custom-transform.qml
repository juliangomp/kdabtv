/*************************************************************************
 *
 * Copyright (c) 2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.0

Rectangle {
    id: root
    color: "lightgrey"
    width: 500
    height: 500

    Item {
        /*Escalado para que no se deforme al estirar la ventana,
        es por eso que se usa un item. Dentro del item
        trabaja con las coordenadas normalmente sin problema*/
        property int _minSide: Math.min(root.width,root.height)
        x: 10 + (root.width - _minSide)/2
        y: 10 + (root.height - _minSide)/2
        width: _minSide - 20
        height: _minSide - 20

         scale: Math.min(width / background.sourceSize.width,
                        height / background.sourceSize.height)
        transformOrigin: Item.TopLeft

        /*Imagen de fondo*/
        Image {
            id: background
            source: "background.png"
        }

        Image {
            // The 914 is the anchor point of the arm, measured in the file itself
            id: smallArm
            source: "smallArm.png"
            /*Centra el centro en la imagen del fondo*/
            x: background.width/2 - width/2
            y: background.height/2 - 914

            /*Transformada personalizada, se utiliza para
            poder cambiar el centro de giro*/
            transform: Rotation {
                origin.x: smallArm.width/2
                origin.y: 914

                /*Trabaja sobre la propiedad angle
                de la transformada rotation, es decir
                del objeto padre en este caso*/
                RotationAnimation on angle {
                    from:0
                    to: 360*2 // two round trips in a day
                    duration: 60000 // duracion en milisegundos
                    loops: Animation.Infinite // loop infinito
                }
            }
        }

        //--> slide
        Image {
            // The 1255 is the anchor point of the arm, measured in the file itself
            id: largeArm
            source: "largeArm.png"
            x: background.width/2 - width/2
            y: background.height/2 - 1255


            /*Transformada personalizada*/
            transform: Rotation {
                origin.x: largeArm.width/2
                origin.y: 1255
                angle: 0 // Likely a calculation from other properties

                //--> hide
                // Anngle above is just for the slides :-)
                RotationAnimation on angle {
                    from:0
                    to: 360*24 // 24 hours in a day
                    duration: 60000 // run through a complete day in one minute.
                    loops: Animation.Infinite
                }
                //<-- hide
            }
        }
        //<-- slide
    }
}
