@extends('layouts.app')

@section('resources')
    <script src="{{ asset('public/js/events/create.js') }}" defer></script>
@endsection

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header d-flex align-items-center header">
                        Event
                        <a class="btn btn-success ml-auto" href="{{ url('events/' . $event->id . '/edit') }}">edit event</a>
                    </div>

                    <div class="card-body body">
                        <table class="table table-hover table-striped">
                            <tbody>
                            <tr>
                                <th>Title</th>
                                <td class="event-title">{{ $event->title }}</td>
                            </tr>
                            <tr>
                                <th>Description</th>
                                <td class="event-description">{{ $event->description }}</td>
                            </tr>
                            <tr>
                                <th>Date</th>
                                <td class="event-date">{{ $event->date }}</td>
                            </tr>
                            <tr>
                                <th>Time</th>
                                <td class="event-time">{{ $event->time }}</td>
                            </tr>
                            <tr>
                                <th>Duration (days)</th>
                                <td class="event-duration-days">{{ $event->duration_days }}</td>
                            </tr>
                            <tr>
                                <th>Location</th>
                                <td class="event-location">{{ $event->location }}</td>
                            </tr>
                            <tr>
                                <th>Price</th>
                                <td class="event-price">{{ $event->standard_price }}</td>
                            </tr>
                            <tr>
                                <th>Capacity</th>
                                <td class="event-capacity">{{ $event->capacity }}</td>
                            </tr>
                            <tr>
                                <th>Sessions</th>
                                <td class="event-sessions">
                                    <ul>
                                        @foreach ($event->sessions as $session)
                                        <li>
                                            <span>{{ $session->title }}</span>
                                            @if ($session->room)
                                                <span> in {{ $session->room }}</span>
                                            @endif
                                            @if ($session->speaker)
                                                <span> by {{ $session->speaker }}</span>
                                            @endif
                                        </li>
                                        @endforeach
                                    </ul>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
