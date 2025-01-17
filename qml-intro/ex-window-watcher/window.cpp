/*************************************************************************
 *
 * Copyright (c) 2017-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

#include "window.h"

#include <QMoveEvent>

void Window::moveEvent(QMoveEvent *event)
{
    QWindow::moveEvent(event); // Llama al método de la clase base

    emit positionChanged(event->pos()); // Y luego emite la señal
}
