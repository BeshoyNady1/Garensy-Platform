<?php

namespace App\Traits;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

trait packagesTrait
{

    public function getPackages($id)
    {
        $Packages = DB::select("WITH
                                    PackageImages AS(
                                    SELECT
                                        package_id,
                                        src,
                                        ROW_NUMBER() OVER(
                                        PARTITION BY package_id
                                    ORDER BY
                                        id
                                    ) AS rn
                                FROM
                                    package_images)
                                    SELECT
                                        p.id,
                                        p.provider_id,
                                        p.name_ar,
                                        p.name_en,
                                        p.description_ar,
                                        p.description_en,
                                        p.price,
                                        p.status,
                                        pi.src AS image_src,
                                        f.id AS favorite
                                    FROM
                                        packages p
                                    LEFT JOIN PackageImages pi ON
                                        pi.package_id = p.id AND pi.rn = 1
                                    Inner JOIN favorites f ON
                                        p.id = f.package_id AND f.user_id = :user_id", ['user_id' => auth()->user()->id ?? null]);
        return $Packages;
    }

    public function getPackage($id)
    {
        $Package = DB::select("WITH
                                    PackageImages AS(
                                    SELECT
                                        package_id,
                                        src,
                                        ROW_NUMBER() OVER(
                                        PARTITION BY package_id
                                    ORDER BY
                                        id
                                    ) AS rn
                                FROM
                                    package_images)
                                    SELECT
                                        p.id,
                                        p.provider_id,
                                        p.name_ar,
                                        p.name_en,
                                        p.description_ar,
                                        p.description_en,
                                        p.price,
                                        p.status,
                                        pi.src AS image_src,
                                        f.id AS favorite
                                    FROM
                                        packages p
                                    LEFT JOIN PackageImages pi ON
                                        pi.package_id = p.id AND pi.rn = 1
                                    LEFT JOIN favorites f ON
                                        p.id = f.package_id AND f.user_id = :user_id
                                    WHERE p.id = :id", ['user_id' => auth()->user()->id ?? null, 'id' => $id]);
        return $Package;
    }

    public function checkIfPackageAleadyReserved($package_id, $start_date, $end_date)
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
                                AND oi.package_id = :package_id
                                AND (
                                    :start_date <= oi.end_date
                                    AND :end_date >= oi.start_date
                                )", ['package_id' => $package_id, 'start_date' => $start_date, 'end_date' => $end_date])[0] ?? null;
        return $data;
    }
}
