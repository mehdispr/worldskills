<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Registration extends Model
{
    protected $fillable = [
        'event_id',
        'user_id',
        'registration_type',
        'registration_date',
        'calculated_price',
        'event_rating',
    ];

    public $timestamps = false;

    public function attendee()
    {
        return $this->belongsTo(Attendee::class, 'user_id', 'id');
    }
}
