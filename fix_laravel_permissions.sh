#!/bin/bash

PROJECT_PATH=$1

# تغيير المالك لكل ملفات المشروع
sudo chown -R daemon:daemon $PROJECT_PATH

# إعطاء صلاحيات كاملة للمجلدات المهمة
sudo chmod -R 775 $PROJECT_PATH

echo "✔️ All permissions fixed for: $PROJECT_PATH"
