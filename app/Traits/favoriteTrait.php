<?php

namespace App\Traits;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

trait favoriteTrait
{

    public function getPackagesAndServicesFavorites()
    {
        $data = DB::select("WITH
                            PackageImages AS (
                                SELECT
                                    package_id,
                                    src,
                                    ROW_NUMBER() OVER (PARTITION BY package_id ORDER BY id) AS rn
                                FROM package_images
                            ),
                            ServiceImages AS (
                                SELECT
                                    service_id,
                                    src,
                                    ROW_NUMBER() OVER (PARTITION BY service_id ORDER BY id) AS rn
                                FROM service_images
                            )

                        SELECT
                            p.id,
                            p.provider_id,
                            p.name_ar,
                            p.name_en,
                            p.description_ar,
                            p.description_en,
                            p.price,
                            '0' AS category_id,
                            p.status,
                            pi.src AS image_src,
                            f.id AS favorite,
                            'package' AS type
                        FROM
                            packages p
                        LEFT JOIN PackageImages pi
                            ON pi.package_id = p.id AND pi.rn = 1
                        INNER JOIN favorites f
                            ON p.id = f.package_id AND f.user_id = :p_user_id

                        UNION


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
                            f.id AS favorite,
                            'service' AS type
                        FROM
                            services s
                        LEFT JOIN ServiceImages si
                            ON si.service_id = s.id AND si.rn = 1
                        INNER JOIN favorites f
                            ON s.id = f.service_id AND f.user_id = :s_user_id;
                                ", ['p_user_id' => auth()->user()->id ?? null, 's_user_id' => auth()->user()->id ?? null]);
        return $data;
    }
}
