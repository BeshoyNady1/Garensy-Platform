<?php

namespace App\Traits;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

trait servicesTrait
{

    public function getServices($id)
    {
        $services = DB::select("WITH
                                    ServiceImages AS(
                                    SELECT
                                        service_id,
                                        src,
                                        ROW_NUMBER() OVER(
                                        PARTITION BY service_id
                                    ORDER BY
                                        id
                                    ) AS rn
                                FROM
                                    service_images)
                                    SELECT
                                        s.id,
                                        s.provider_id,
                                        s.name_ar,
                                        s.name_en,
                                        s.description_ar,
                                        s.description_en,
                                        s.price,
                                        s.category_id,
                                        s.status,
                                        si.src AS image_src,
                                        f.id AS favorite
                                    FROM
                                        services s
                                    LEFT JOIN ServiceImages si ON
                                        si.service_id = s.id AND si.rn = 1
                                    LEFT JOIN favorites f ON
                                        s.id = f.service_id AND f.user_id = :user_id
                                    WHERE
                                        s.category_id = :category_id", ['category_id' => $id, 'user_id' => auth()->user()->id ?? null]);
        return $services;
    }

    public function getService($service_id)
    {
        $services = DB::select("WITH
                                    ServiceImages AS(
                                    SELECT
                                        service_id,
                                        src,
                                        ROW_NUMBER() OVER(
                                        PARTITION BY service_id
                                    ORDER BY
                                        id
                                    ) AS rn
                                FROM
                                    service_images)
                                    SELECT
                                        s.id,
                                        s.provider_id,
                                        s.name_ar,
                                        s.name_en,
                                        s.description_ar,
                                        s.description_en,
                                        s.price,
                                        s.category_id,
                                        s.status,
                                        si.src AS image_src,
                                        f.id AS favorite
                                    FROM
                                        services s
                                    LEFT JOIN ServiceImages si ON
                                        si.service_id = s.id AND si.rn = 1
                                    LEFT JOIN favorites f ON
                                        s.id = f.service_id AND f.user_id = :user_id
                                    WHERE
                                    s.id = :id", ['id' => $service_id, 'user_id' => auth()->user()->id ?? null])[0];
        return $services;
    }

    public function checkIfServiceAleadyReserved($service_id, $start_date, $end_date)
    {
        $data = DB::select("SELECT
                                o.id,
                                o.user_id,
                                o.total_amount,
                                o.status,
                                o.payment_status,
                                oi.start_date,
                                oi.end_date
                            FROM
                                orders o
                                INNER JOIN order_items oi
                                    ON o.id = oi.order_id
                            WHERE
                                o.status = 'pending'
                                AND oi.service_id = :service_id
                                AND (
                                    :start_date <= oi.end_date
                                    AND :end_date >= oi.start_date
                                )", ['service_id' => $service_id, 'start_date' => $start_date, 'end_date' => $end_date])[0] ?? null;
        return $data;
    }
}
