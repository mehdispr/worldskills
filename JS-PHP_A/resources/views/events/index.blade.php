@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header d-flex align-items-center header">
                        Events
                        <a class="btn btn-success ml-auto" href="{{ url('events/create') }}">add event</a>
                    </div>

                    <div class="card-body content">
                        @if (session('success'))
                            <div class="alert alert-success" role="alert">
                                {{ session('success') }}
                            </div>
                        @endif

                        <table class="table table-hover table-striped">
                            <thead>
                            <tr>
                                <th>Event</th>
                                <th>Date</th>
                                <th>Price</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach ($events as $event)
                                <tr class="event">
                                    <td class="event-title">
                                        <a href="{{ url('events', $event->id) }}">{{ $event->title }}</a>
                                    </td>
                                    <td class="event-date">{{ $event->date }}</td>
                                    <td class="event-price">{{ $event->standard_price }}</td>
                                    <td class="event-actions">
                                        <a class="btn btn-primary event-participants" href="{{ url('events/' . $event->id . '/attendee-list') }}">Attendee list</a>
                                        <a class="btn btn-primary event-ratings" href="{{ url('events/' . $event->id . '/rating-diagram') }}">Rating diagram</a>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
