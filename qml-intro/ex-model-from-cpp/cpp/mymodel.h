/*************************************************************************
 *
 * Copyright (c) 2010-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

#ifndef MYMODEL_H
#define MYMODEL_H

#include <QAbstractListModel>
#include <QColor>

// Define el tipo de dato del vector
struct Data {
    Data() {}
    Data( const QString& name, const QString& flag, double population )
        : name(name), flag(flag), population(population) {}
    QString name;
    QString flag;
    double population;
};

// Derivado de QAbsctractListModel
class MyModel : public QAbstractListModel
{
    Q_OBJECT

public:
    // Los roles son los campos de cada ListElement
    enum Roles {
        NameRole = Qt::UserRole, // El inicial debe ser igual a Qt::UserRole
        FlagRole,
        PopulationRole
    };

    explicit MyModel(QObject *parent = nullptr);

    int rowCount(const QModelIndex& parent) const override;
    QVariant data( const QModelIndex& index, int role = Qt::DisplayRole ) const override;
    QHash<int, QByteArray> roleNames() const override;

public slots:
    void duplicateData(int row);
    void removeData(int row);

private slots:
    void growPopulation();

private: //members
    QVector< Data > m_data; // Acá se encuentra la información almacenada
};

#endif // MYMODEL_H
