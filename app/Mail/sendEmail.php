<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;
use Illuminate\Mail\Mailables\Attachment;
use Illuminate\Support\Facades\File;

class sendEmail extends Mailable
{
    use Queueable, SerializesModels;

    public $order;
    public $order_details;
    public $schedule_data;
    public $imagePath;
    public $imageName;
    public $view;
    public $subject;


    public function __construct($order, $order_details, $schedule_data, $imagePath = "//", $imageName = "//", $view, $subject)
    {
        $this->order = $order;
        $this->order_details = $order_details;
        $this->schedule_data = $schedule_data;
        $this->imagePath = $imagePath;
        $this->imageName = $imageName;
        $this->view = $view;
        $this->subject = $subject;
    }

    public function envelope()
    {
        return new Envelope(
            subject: $this->subject,
        );
    }

    public function content()
    {
        return new Content(
            view: $this->view,
            with: [
                'order' => $this->order,
                'orderDetails' => $this->order_details,
                'relatedSchedules' => $this->schedule_data,
            ],
        );
    }

    public function attachments()
    {
        // $fullPath = public_path($this->imagePath);
        // if (File::exists($fullPath)) {
        //     return [
        //         Attachment::fromPath($fullPath)
        //             ->as($this->imageName)
        //             ->withMime('image/png'),
        //     ];
        // }
        return [];
    }
}
