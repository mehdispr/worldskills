@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        Attendee list - {{ $event->title }}
                    </div>

                    <div class="card-body content">
                        <table class="table table-hover table-striped">
                            <thead>
                            <tr>
                                <th>Firstname</th>
                                <th>Lastname</th>
                                <th>Email</th>
                                <th>Photo</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach ($event->registrations as $registration)
                                <tr class="attendee">
                                    <td class="attendee-firstname">{{ $registration->attendee->firstname }}</td>
                                    <td class="attendee-lastname">{{ $registration->attendee->lastname }}</td>
                                    <td class="attendee-email">{{ $registration->attendee->email }}</td>
                                    <td class="attendee-photo">
                                        @if ($registration->attendee->photo_path)
                                            <img class="border-info" src="{{ url('storage/app/' . $registration->attendee->photo_path) }}" width="48" height="48" style="object-fit: cover">
                                        @else
                                            <span>No Photo</span>
                                        @endif
                                    </td>
                                    <td class="attendee-actions">
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
