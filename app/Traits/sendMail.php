<?php

namespace App\Traits;

use App\Mail\sendEmail;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\OrderDetailsHasEmployeeAndTime;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Log;

trait sendMail
{
    public function sendEmail($orderId, $email, $mailType)
    {
        // Fetch order data
        $order = Order::select('id', 'client_name', 'date', 'phone', 'email', 'total_amount')
            ->where('id', $orderId)
            ->first();

        if (!$order) {
            return response()->json(['error' => 'الطلب غير موجود'], 404);
        }

        // Fetch order details with service information
        $orderDetails = OrderDetail::join('services', 'order_details.service_id', '=', 'services.id')
            ->select(
                'order_details.id',
                'order_details.service_id',
                'services.name_ar as service_name_ar',
                'services.name_en as service_name_en',
                'services.price as service_price',
                'order_details.count'
            )
            ->where('order_details.order_id', $orderId)
            ->get();

        Log::info('Fetched Order Details for order ID ' . $orderId . ': ', ['count' => $orderDetails->count(), 'data' => $orderDetails->toArray()]);

        if ($orderDetails->isEmpty()) {
            Log::warning('No order details found for order ID: ' . $orderId);
        }

        // Fetch schedule data
        $scheduleData = OrderDetailsHasEmployeeAndTime::join('employee_has_times', 'order_details_has_employee_and_times.employee_and_times_id', '=', 'employee_has_times.id')
            ->join('employees', 'employee_has_times.employee_id', '=', 'employees.id')
            ->join('times', 'employee_has_times.time_id', '=', 'times.id')
            ->select(
                'order_details_has_employee_and_times.order_details_id',
                'employee_has_times.id as employee_has_time_id',
                'employees.name_ar as employee_name_ar',
                'employees.name_en as employee_name_en',
                'times.name as time'
            )
            ->whereIn('order_details_has_employee_and_times.order_details_id', $orderDetails->pluck('id')->all())
            ->get();

        Log::info('Fetched Schedule Data for order ID ' . $orderId . ': ', ['count' => $scheduleData->count(), 'data' => $scheduleData->toArray()]);

        if ($scheduleData->isEmpty()) {
            Log::warning('No schedule data found for order ID: ' . $orderId);
        }

        // Set the view and subject based on the mail type
        $view = "backOffice.project.email.confirmBooking";
        $subject = "YoureChic Booking";
        if ($mailType == "Invoice") {
            $view = "backOffice.project.email.confirmInvoice";
            $subject = "YoureChic Invoice";
        }


        try {
            // Send email without attachment
            Mail::to($email)->send(new sendEmail(
                $order,
                $orderDetails,
                $scheduleData,
                null, // imagePath is null
                null, // imageName is null
                $view,
                $subject
            ));

            Log::info('Email sent successfully to: ' . $email . ' for order ID ' . $orderId);
            return ['message' => "email sent successfully ...!"];
        } catch (\Exception $e) {
            Log::error('Failed to send email to ' . $email . ' for order ID ' . $orderId . ': ' . $e->getMessage());
            return response()->json(['error' => 'فشل إرسال البريد الإلكتروني: ' . $e->getMessage()], 500);
        }
    }
}
