@extends('layouts.app')

@section('resources')
    <script src="{{ asset('public/js/chart.js') }}" defer></script>
    <script src="{{ asset('public/js/events/rating-diagram.js') }}" defer></script>
@endsection

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        Rating diagram - {{ $event->title }}
                    </div>

                    <div class="card-body content">
                        <p>Total ratings: {{ $bad + $average + $excellent }}</p>
                        <input id="bad" type="hidden" value="{{ $bad }}">
                        <input id="average" type="hidden" value="{{ $average }}">
                        <input id="excellent" type="hidden" value="{{ $excellent }}">
                        <canvas id="reportDiagram"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
