 /*************************************************************************
 *
 * Copyright (c) 2016-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

#ifndef VIDEOFILTERPROXYMODEL_H
#define VIDEOFILTERPROXYMODEL_H

#include <QSortFilterProxyModel>

class VideoFilterProxyModel : public QSortFilterProxyModel
{
    Q_OBJECT

    // Acceso desde QML para poder habilitar o deshabilitar el filtro
    Q_PROPERTY(bool videoFilterEnabled READ videoFilterEnabled WRITE setVideoFilterEnabled NOTIFY videoFilterEnabledChanged)

public:
    explicit VideoFilterProxyModel(QObject *parent = nullptr);

    bool videoFilterEnabled() const;

public slots:
    void setVideoFilterEnabled(bool enabled);

signals:
    void videoFilterEnabledChanged();

protected:
    bool filterAcceptsRow(int sourceRow, const QModelIndex &sourceParent) const override;

private:
    bool m_videoFilterEnabled;
};

#endif // VIDEOFILTERPROXYMODEL_H
