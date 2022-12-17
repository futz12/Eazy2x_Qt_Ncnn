#include <QDebug>
#include <QMetaObject>
#include "ui.h"
#include "ncnn/gpu.h"
#include "opencv2/opencv.hpp"

using namespace ncnn;

void ui::about()
{
    for(int i=0;i<get_gpu_count();i++)
    {
        QVariant returnedValue;
        QVariant msg = get_gpu_info(i).device_name();
        QMetaObject::invokeMethod(_engine->rootObjects().first()->findChild<QObject*>("myfunc"), "insert2list",Q_RETURN_ARG(QVariant, returnedValue),Q_ARG(QVariant, msg));
    }

}
