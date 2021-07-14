#ifndef CIRCULARINDICATOR_H
#define CIRCULARINDICATOR_H

#include <QQuickPaintedItem>
#include <QPainter>

class CircularIndicator : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(int startAngle READ startAngle WRITE setStartAngle NOTIFY startAngleChanged)
    Q_PROPERTY(int endAngle READ endAngle WRITE setEndAngle NOTIFY endAngleChanged)
    Q_PROPERTY(qreal minimumValue READ minimumValue WRITE setMinimumValue NOTIFY minimumValueChanged)
    Q_PROPERTY(qreal maximumValue READ maximumValue WRITE setMaximumValue NOTIFY maximumValueChanged)
    Q_PROPERTY(qreal value READ value WRITE setValue NOTIFY valueChanged)
    Q_PROPERTY(int lineWidth READ lineWidth WRITE setLineWidth NOTIFY lineWidthChanged)
    Q_PROPERTY(QColor progressColor READ progressColor WRITE setProgressColor NOTIFY progressColorChanged)
    Q_PROPERTY(QColor backgroundColor READ backgroundColor WRITE setBackgroundColor NOTIFY backgroundColorChanged)
    Q_PROPERTY(int padding READ padding WRITE setPadding NOTIFY paddingChanged)

public:
    CircularIndicator(QQuickItem *parent = 0);
    ~CircularIndicator();

    int startAngle() const;
    int endAngle() const;
    qreal minimumValue() const;
    qreal maximumValue() const;
    qreal value() const;
    int lineWidth() const;
    QColor progressColor() const;
    QColor backgroundColor() const;
    int padding() const;

public slots:
    void setStartAngle(int angle);
    void setEndAngle(int angle);
    void setMinimumValue(qreal value);
    void setMaximumValue(qreal value);
    void setValue(qreal value);
    void setLineWidth(int width);
    void setProgressColor(QColor color);
    void setBackgroundColor(QColor color);
    void setPadding(int padding);

signals:
    void startAngleChanged(int);
    void endAngleChanged(int);
    void minimumValueChanged(qreal);
    void maximumValueChanged(qreal);
    void valueChanged(qreal);
    void lineWidthChanged(int);
    void progressColorChanged(QColor);
    void backgroundColorChanged(QColor);
    void paddingChanged(int);

protected:
    void paint(QPainter *painter);

private:
    int mStartAngle;
    int mEndAngle;
    qreal mMinimumValue;
    qreal mMaximumValue;
    qreal mValue;
    int mLineWidth;
    QColor mProgressColor;
    QColor mBackgroundColor;
    int mPadding;
};

#endif // CIRCULARINDICATOR_H
