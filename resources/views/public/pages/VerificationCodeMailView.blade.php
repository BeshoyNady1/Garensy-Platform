<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>كود التحقق</title>
        <style>
            * {
                text-align: center;
            }

            body {
                font-family: Arial, sans-serif;
                line-height: 1.6;
                color: #333;
                direction: rtl;
                text-align: center;
            }

            .container {
                max-width: 600px;
                margin: 0 auto;
                padding: 20px;
                background-color: #f9f9f9;
                border-radius: 8px;
            }

            .header {
                background-color: #007bff;
                color: #fff;
                padding: 15px;
                text-align: center;
                border-radius: 8px 8px 0 0;
            }

            .code {
                font-size: 24px;
                font-weight: bold;
                background-color: #e9ecef;
                padding: 10px;
                text-align: center;
                margin: 20px 0;
                border-radius: 5px;
            }

            .footer {
                font-size: 14px;
                color: #666;
                margin-top: 20px;
                text-align: center;
            }

            @media only screen and (max-width: 600px) {
                .container {
                    padding: 10px;
                }
            }
        </style>
    </head>

    <body>
        <div class="container">
            <div class="header">
                <h2>كود التحقق لإعادة تعيين كلمة المرور</h2>
            </div>
            <p>مرحبًا،</p>
            <p>لقد طلبت إعادة تعيين كلمة المرور. استخدم الكود التالي للتحقق:</p>
            <div class="code">{{ $code }}</div>
            <p>هذا الكود صالح لمدة دقيقة فقط. إذا لم تطلب هذا الإجراء، يرجى تجاهل هذا البريد.</p>
            <div class="footer">
                <p>شكرًا،<br>فريق Garensy</p>
            </div>
        </div>
    </body>

</html>
