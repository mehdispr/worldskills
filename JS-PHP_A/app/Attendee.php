<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Attendee extends Model
{
    protected $fillable = [
        'firstname',
        'lastname',
        'username',
        'email',
        'photo_path',
        'linkedin_url',
        'password_hash',
        'token',
    ];

    public $timestamps = false;

    public function setPasswordHashAttribute($value)
    {
        $this->attributes['password_hash'] = bcrypt($value);
    }

    public function registrations()
    {
        return $this->hasMany(Registration::class, 'user_id', 'id');
    }
}
