<?php

return [
    'title' => 'Text',

    //        'show_in_templates' => [ 4 ],

    //        'show_in_docs' => [ 2 ],

    //        'hide_in_docs' => [ 5 ],

    //        'order' => 1,

    'image' => 'assets/plugins/pagebuilder/images/text.jpg',

    //        'container' => 'default',

    'templates' => [
        'owner' => '
                <div class="container">
                    <div class="user-content">
                        <div>[+header+] [+icon+]</div>
                        <div>[+richtext+]</div>
                    </div>
                </div>
            ',
    ],

    'fields' => [
        'header' => [
            'caption' => 'Header',
            'type'    => 'text',
        ],
        'icon' => [
            'caption' => 'Icon',
            'type' => 'icon',
            'icons' => ['user-circle', 'cube', 'code', 'comment', 'copyright']
        ],
        'richtext' => [
            'caption' => 'Text',
            'type'    => 'richtext',
            'default' => '',
            'theme'   => 'mini',
            'options' => [
                'height' => '300px',
            ],
        ],
    ],
];
