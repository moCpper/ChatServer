#ifndef CONUSERITEM_H
#define CONUSERITEM_H

#include <QWidget>
#include "listitembase.h"

namespace Ui {
class ConUserItem;
}

class ConUserItem : public ListItemBase
{
    Q_OBJECT

public:
    explicit ConUserItem(QWidget *parent = nullptr);
    ~ConUserItem();
    QSize sizeHint() const override;
    void SetInfo(QString name, QString head);
    void ShowRedPoint(bool show = false);
private:
    Ui::ConUserItem *ui;
    QString _name;
    QString _head;
};

#endif // CONUSERITEM_H
