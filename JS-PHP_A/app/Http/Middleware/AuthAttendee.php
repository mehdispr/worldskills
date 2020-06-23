<?php

namespace App\Http\Middleware;

use App\Attendee;
use Closure;

class AuthAttendee
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (!$attendee = Attendee::where('token', $request->token)->first()) {
            return abort(401, 'Unauthorized user');
        }

        $request->merge(compact('attendee'));
        return $next($request);
    }
}
