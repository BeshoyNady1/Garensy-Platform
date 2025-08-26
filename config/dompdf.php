<?php

return [
    /*
    |-----------------------------------------------------
    | Settings
    |-----------------------------------------------------
    |
    | Configuration for dompdf to support Arabic text rendering with proper fonts.
    | Ensure font files (Amiri-Regular.ttf, Amiri-Bold.ttf, NotoSansArabic-Regular.ttf, NotoSansArabic-Bold.ttf)
    | are in storage/app/fonts/.
    |
    */
    'show_warnings' => true, // Enable warnings temporarily for debugging font issues

    'public_path' => public_path(), // Reference Laravel's public directory

    /*
     * Disable entity conversion to ensure special characters render correctly.
     */
    'convert_entities' => false,

    'options' => [
        /**
         * Font directory for storing font files
         */
        'font_dir' => storage_path('app/fonts/'), // Fonts stored in storage/app/fonts/

        /**
         * Font cache directory
         */
        'font_cache' => storage_path('app/fonts/'), // Cache in the same directory

        /**
         * Temporary directory for dompdf
         */
        'temp_dir' => sys_get_temp_dir(),

        /**
         * Restrict file access to the application root for security
         */
        'chroot' => realpath(base_path()),

        /**
         * Allowed protocols for external resources
         */
        'allowed_protocols' => [
            'file://' => ['rules' => []],
            'http://' => ['rules' => []],
            'https://' => ['rules' => []],
        ],

        /**
         * Enable font subsetting to reduce PDF file size
         */
        'enable_font_subsetting' => true,

        /**
         * PDF rendering backend
         */
        'pdf_backend' => 'CPDF',

        /**
         * Default media type for rendering
         */
        'default_media_type' => 'screen',

        /**
         * Default paper size
         */
        'default_paper_size' => 'a4',

        /**
         * Default paper orientation
         */
        'default_paper_orientation' => 'portrait',

        /**
         * Default font for Arabic text
         */
        'default_font' => 'amiri',

        /**
         * Font data for Arabic support
         */
        'font_data' => [
            'amiri' => [
                'R' => 'Amiri-Regular.ttf',
                'B' => 'Amiri-Bold.ttf',
                'useOTL' => 0xFF,    // Enable OpenType Layout for Arabic text shaping
                'useKashida' => 75,  // Improve Arabic text justification
            ],
            'noto_sans_arabic' => [
                'R' => 'NotoSansArabic-Regular.ttf',
                'B' => 'NotoSansArabic-Bold.ttf',
                'useOTL' => 0xFF,
                'useKashida' => 75,
            ],
        ],

        /**
         * Image DPI for sharper text rendering
         */
        'dpi' => 300, // Increased for better clarity

        /**
         * Enable PHP execution in Blade templates
         */
        'enable_php' => true,

        /**
         * Enable JavaScript (if needed)
         */
        'enable_javascript' => true,

        /**
         * Allow remote file access for external resources
         */
        'enable_remote' => true,

        /**
         * Font height ratio for better Arabic text alignment
         */
        'font_height_ratio' => 0.9, // Adjusted for Arabic text

        /**
         * Enable HTML5 parser for modern HTML support
         */
        'enable_html5_parser' => true,
    ],
];
