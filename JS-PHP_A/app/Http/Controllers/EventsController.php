<?php

namespace App\Http\Controllers;

use App\Event;
use Illuminate\Http\Request;
use function PHPSTORM_META\type;

class EventsController extends Controller
{
    public function list()
    {
        return response()->json(Event::with('sessions')->get());
    }

    public function register(Request $request)
    {
        if (!$event = Event::find($request->event_id)) {
            return abort(404, 'Not found');
        }

        if (!$registration = $event->registrations->firstWhere('user_id', $request->attendee->id)) {
            $registration = $event->registrations()->create([
                'user_id' => $request->attendee->id,
                'registration_date' => date('Y-m-d H:i:s'),
            ]);
        }

        $calculated_prices = [
            'early_bird' => $event->standard_price * 0.85,
            'general' => $event->standard_price,
            'vip' => $event->standard_price * 1.2,
        ];
        $registration->update([
            'registration_type' => $request->registration_type,
            'calculated_price' => $calculated_prices[$request->registration_type],
        ]);

        return response()->json([
            'message' => 'Registration success',
        ]);
    }

    public function index()
    {
        return view('events.index', [
            'events' => Event::with('sessions')->get(),
        ]);
    }

    public function create()
    {
        return view('events.create');
    }

    public function store(Request $request)
    {
        $event = Event::create($request->all());

        foreach ($request->sessions ?? [] as $session) {
            $session['title'] .= ' at ' . $session['time'];
            $event->sessions()->create($session);
        }

        return redirect('events')->with([
            'success' => 'Event successfully created',
        ]);
    }

    public function detail($id)
    {
        return view('events.detail', [
            'event' => Event::with('sessions')->find($id),
        ]);
    }

    public function edit($id)
    {
        return view('events.edit', [
            'event' => Event::with('sessions')->find($id),
        ]);
    }

    public function update(Request $request, $id)
    {
        $event = Event::find($id);

        $event->update($request->all());

        $event->sessions()->delete();

        foreach ($request->sessions ?? [] as $session) {
            $session['title'] .= ' at ' . $session['time'];
            $event->sessions()->create($session);
        }

        return redirect('events')->with([
            'success' => 'Event successfully saved',
        ]);
    }

    public function attendeeList($id)
    {
        return view('events.attendee-list', [
            'event' => Event::with('registrations.attendee')->find($id),
        ]);
    }

    public function ratingDiagram($id)
    {
        $event = Event::with('registrations')->find($id);
        $bad = $event->registrations->filter(function ($registration) {
            return 0 === $registration->event_rating;
        })->count();
        $average = $event->registrations->filter(function ($registration) {
            return 1 === $registration->event_rating;
        })->count();
        $excellent = $event->registrations->filter(function ($registration) {
            return 2 === $registration->event_rating;
        })->count();

        return view('events.rating-diagram', compact('event', 'bad', 'average', 'excellent'));
    }
}
