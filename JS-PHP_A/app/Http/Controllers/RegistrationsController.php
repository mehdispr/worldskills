<?php

namespace App\Http\Controllers;

use App\Registration;
use Illuminate\Http\Request;

class RegistrationsController extends Controller
{
    public function list(Request $request)
    {
        return response()->json($request->attendee->registrations);
    }

    public function rate(Request $request, $id)
    {
        if (!$registration = Registration::find($id)) {
            return abort(404, 'Not found');
        }

        $registration->update([
            'event_rating' => $request->event_rating,
        ]);

        return response()->json([
            'message' => 'Rating success',
        ]);
    }
}
