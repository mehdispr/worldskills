<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Session extends Model
{
    protected $fillable = [
        'event_id',
        'title',
        'room',
        'speaker',
    ];

    public $timestamps = false;
}
