@extends('layouts.home')

@section('container')
<div class="py-5">
    <div class="row flex-lg-row-reverse align-items-center g-5 py-5">
        <div class="col-10 col-sm-8 col-lg-6">
            <img src="assets/app-img/home02.jpg" class="d-block mx-lg-auto img-fluid" alt="Hotel Image 02" width="700" height="500" loading="lazy">
        </div>
        <div class="col-lg-6">
            <h2 class="display-5 fw-bold lh-1 mb-3">Tentang Kami</h2>
            <p class="lead">Heritage Hotels adalah operator hotel dan rekreasi terkenal di dunia yang bisa dibilang menyediakan petualangan 'pantai-dan-semak' terlengkap dan terluas di seluruh Afrika Timur. Dengan tujuh properti mulai dari Voyager Beach Resort bertema kapal 'semenit' di Mombasa dan kamp safari saudaranya di Tsavo, hingga sirkuit unik menarik dari kamp dan resor safari mewah di bawah payung Intrepids yang terkenal di dunia, hingga retret bintang lima di Ara.</p>
            <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                <a href="register" class="btn btn-primary btn-lg px-4 me-md-2">Daftar</a>
                <a href="login" class="btn btn-primary btn-lg px-4 me-md-2" >Login</a>
            </div>
      </div>
    </div>
</div>
@endsection
