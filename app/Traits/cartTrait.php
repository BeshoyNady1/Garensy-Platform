<?php

namespace App\Traits;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

trait cartTrait
{

    public function getCartItems()
    {
        $carts = DB::select(DB::raw("
                                WITH ServiceImages AS (
                                        SELECT
                                            service_id,
                                            src,
                                            ROW_NUMBER() OVER (PARTITION BY service_id ORDER BY id) AS rn
                                        FROM
                                            service_images
                                    ),
                                    PackageImages AS (
                                        SELECT
                                            package_id,
                                            src,
                                            ROW_NUMBER() OVER (PARTITION BY package_id ORDER BY id) AS rn
                                        FROM
                                            package_images
                                    )
                                    SELECT
                                        c.id,
                                        c.user_id,
                                        COALESCE(c.service_id, c.package_id) AS service_id,
                                        c.package_id IS NOT NULL AS is_package,
                                        c.city_id,
                                        c.qty,
                                        c.price,
                                        c.start_date,
                                        c.end_date,
                                        COALESCE(si.src, pi.src) AS image_src,
                                        COALESCE(s.name_ar, p.name_ar) AS item_name_ar,
                                        COALESCE(s.name_en, p.name_en) AS item_name_en
                                    FROM
                                        carts c
                                    LEFT JOIN
                                        ServiceImages si ON c.service_id = si.service_id AND si.rn = 1
                                    LEFT JOIN
                                        PackageImages pi ON c.package_id = pi.package_id AND pi.rn = 1
                                    LEFT JOIN
                                        services s ON c.service_id = s.id
                                    LEFT JOIN
                                        packages p ON c.package_id = p.id
                                    WHERE
                                        c.user_id = :user_id
                                        AND (c.service_id IS NOT NULL OR c.package_id IS NOT NULL)
                            "), ['user_id' => auth()->user()->id]);
        return $carts;
    }
}
