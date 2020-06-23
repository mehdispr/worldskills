<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Event extends Model
{
    protected $fillable = [
        'title',
        'description',
        'date',
        'time',
        'duration_days',
        'location',
        'standard_price',
        'capacity',
    ];

    public $timestamps = false;

    public function sessions()
    {
        return $this->hasMany(Session::class);
    }

    public function registrations()
    {
        return $this->hasMany(Registration::class);
    }
}
