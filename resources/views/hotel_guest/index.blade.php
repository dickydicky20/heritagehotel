@extends('layouts.hotel_guest')

@section('container')

    <h1 class="" style="color: rgb(255, 255, 255)">Data Reservasi Saya</h1>

    @foreach (auth()->user()->bookings as $reservation)
    <div class="card mb-3 col-md-5">
        <div class="card-header">
            <a href="{{ route('detail-reservation', $reservation->id) }}">{{ 'ID Registrasi : ' . $reservation->id }}</a>
            <p class="card-text">
                Waktu Registrasi : {{ $reservation->created_at->formatLocalized('%A, %d %B %Y Pukul : %H.%M '); }}
            </p>
            <style>
                body {
                    background-image: url('../assets/app-img/bg8.jpg');
                }

                .active {
                    border-bottom: 3px solid rgb(0, 0, 0);
                }
            </style>
        </div>
    </div>
    @endforeach
@endsection

