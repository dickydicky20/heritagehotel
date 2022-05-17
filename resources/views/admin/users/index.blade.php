@extends('layouts.admin')

@section('container')

<h1 class="h2" style="color: white">Data User</h1>

@if (session()->has('success'))
        <div class="alert alert-success col-lg-12" role="alert">
            {{ session('success') }}
        </div>
    @endif

<div class="table-responsive col-lg-12">
    <table class="table table-sm table-bordered table-white border-white text-center" style="color: white">
        <thead>
            <tr>
                <th>#</th>
                <th>Nama</th>
                <th>Username</th>
                <th>ID</th>
                <th>Role</th>
                <th>Action</th>

            </tr>
        </thead>
        <tbody>
            @foreach ($users as $user)
            <tr>
                <td>{{ ++$i }}</td>
                <td>{{ $user->name }}</td>
                <td>{{ $user->username }}</td>
                <td>{{ $user->id }}</td>
                <td>
                    @switch($user->role)
                        @case('hotel_guest')
                            Hotel Guest
                            @break
                        @case('administrator')
                            Administrator
                            @break
                        @case('receptionist')
                            Receptionist
                            @break
                        @default
                            Hotel Guest
                    @endswitch    
                </td>
                <td>
                    <a href="{{ route('users.edit', $user->id) }}" class="badge bg-dark" onclick="return confirm('Apakah Anda Yakin?')">
                        <span>Edit</span></a>

                        <form action="{{ route('users.destroy', $user->id) }}" method="post" class="d-inline">
                            
                            @method('delete')
                            @csrf

                            <button type="submit" class="badge bg-danger border-0" onclick="return confirm('Menghapus Data Ini Akan Mempengaruhi Data Lain, Anda Yakin?')"><span>Delete</span></button>

                        </form>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
    <div class="text-end">
        <a href="{{ route('users.create') }}" class="btn btn-success mb-3">Create new User</a>
    </div>

    {{ $users->links() }}
</div>

@endsection