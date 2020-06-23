@extends('layouts.app')

@section('resources')
    <script src="{{ asset('public/js/events/edit.js') }}" defer></script>
@endsection

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header header">
                        Edit event
                    </div>

                    <div class="card-body body">
                        <form method="POST" action="{{ url('events', $event->id) }}">
                            @csrf

                            <div class="form-group row">
                                <label for="title" class="col-md-4 col-form-label text-md-right">Title</label>

                                <div class="col-md-6">
                                    <input id="title" type="text" class="form-control{{ $errors->has('title') ? ' is-invalid' : '' }}" name="title" value="{{ old('title', $event->title) }}" required autofocus>

                                    @if ($errors->has('title'))
                                        <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('title') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="description" class="col-md-4 col-form-label text-md-right">Description</label>

                                <div class="col-md-6">
                                    <textarea id="description" class="form-control{{ $errors->has('description') ? ' is-invalid' : '' }}" name="description" required>{{ old('description', $event->description) }}</textarea>

                                    @if ($errors->has('description'))
                                        <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('description') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="date" class="col-md-4 col-form-label text-md-right">Date</label>

                                <div class="col-md-6">
                                    <input id="date" type="date" class="form-control{{ $errors->has('date') ? ' is-invalid' : '' }}" name="date" value="{{ old('date', $event->date) }}" required>

                                    @if ($errors->has('date'))
                                        <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('date') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="time" class="col-md-4 col-form-label text-md-right">Time</label>

                                <div class="col-md-6">
                                    <input id="time" type="time" class="form-control{{ $errors->has('time') ? ' is-invalid' : '' }}" name="time" value="{{ old('time', $event->time) }}" required>

                                    @if ($errors->has('time'))
                                        <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('time') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="duration_days" class="col-md-4 col-form-label text-md-right">Duration (days)</label>

                                <div class="col-md-6">
                                    <input id="duration_days" type="number" class="form-control{{ $errors->has('duration_days') ? ' is-invalid' : '' }}" name="duration_days" min="1" value="{{ old('duration_days', $event->duration_days, 1) }}" required>

                                    @if ($errors->has('duration_days'))
                                        <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('duration_days') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="location" class="col-md-4 col-form-label text-md-right">Location</label>

                                <div class="col-md-6">
                                    <input id="location" class="form-control{{ $errors->has('location') ? ' is-invalid' : '' }}" name="location" min="1" value="{{ old('location', $event->location) }}" required>

                                    @if ($errors->has('location'))
                                        <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('location') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="standard_price" class="col-md-4 col-form-label text-md-right">Price</label>

                                <div class="col-md-6">
                                    <input id="standard_price" type="number" class="form-control{{ $errors->has('standard_price') ? ' is-invalid' : '' }}" name="standard_price" min="1" value="{{ old('standard_price', $event->standard_price) }}" required>

                                    @if ($errors->has('standard_price'))
                                        <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('standard_price') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="capacity" class="col-md-4 col-form-label text-md-right">Capacity</label>

                                <div class="col-md-6">
                                    <input id="capacity" type="number" class="form-control{{ $errors->has('capacity') ? ' is-invalid' : '' }}" name="capacity" min="1" value="{{ old('capacity', $event->capacity) }}" required>

                                    @if ($errors->has('capacity'))
                                        <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('capacity') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>

                            <div>
                                <div class="my-3 d-flex align-items-center">
                                    <label>Sessions</label>
                                    <button class="btn btn-primary ml-auto" id="add-session" type="button">Add session</button>
                                </div>
                                <div>
                                    <table class="table table-hover table-striped">
                                        <thead>
                                        <tr>
                                            <th>Title</th>
                                            <th>Time</th>
                                            <th>Location</th>
                                            <th>Speaker</th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        @foreach ($event->sessions as $index => $session)
                                            @php
                                            $title = '';
                                            $time = '';
                                            list($title, $time) = explode(' at ', $session->title)
                                            @endphp
                                            <tr class="session">
                                                <td>
                                                    <input class="form-control" type="text" name="sessions[{{ $index }}][title]" value="{{ $title }}" required>
                                                </td>
                                                <td>
                                                    <input class="form-control" type="text" name="sessions[{{ $index }}][time]" value="{{ $time }}" required>
                                                </td>
                                                <td>
                                                    <input class="form-control" type="text" name="sessions[{{ $index }}][room]" value="{{ $session->room }}" required>
                                                </td>
                                                <td>
                                                    <input class="form-control" type="text" name="sessions[{{ $index }}][speaker]" value="{{ $session->speaker }}" required>
                                                </td>
                                                <td>
                                                    <button class="btn btn-danger btn-delete-session">&times;</button>
                                                </td>
                                            </tr>
                                        @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="form-group row mb-0">
                                <div class="col-md-8 offset-md-4">
                                    <button type="submit" id="create-event" class="btn btn-success">
                                        save event
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
