@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            @if (session('status'))
            <div class="alert alert-success" role="alert">

                <h1>Panel de Administración</h1>

                <p>Bienvenido al panel de administración.</p>

            </div>
        @endif
        </div>
    </div>

    <div class="container">
        <h2>Lista de Proyectos</h2>
        <ul class="list-group">
            @foreach ($proyectos as $proyecto)
                <li class="list-group-item">
                    <a href="{{ route('proyectos.edit', $proyecto->id) }}">{{ $proyecto->nombre }}</a>
                </li>
            @endforeach
        </ul>
    </div>

    <div class="container">
        <h2>Agregar Nuevo Proyecto</h2>

        <form method="post" action="{{ route('proyectos.store') }}">
            @csrf
            @method('POST')

            <div class="form-group">
                <label for="nombre">Nombre del Proyecto:</label>
                <input type="text" class="form-control" id="nombre" name="nombre">
            </div>

            <div class="form-group">
                <label for="link">Enlace:</label>
                <input type="text" class="form-control" id="link" name="link">
            </div>

            <div class="form-group">
                <label for="imagen">URL de la Imagen:</label>
                <input type="text" class="form-control" id="imagen" name="imagen">
            </div>

            <div class="form-group mb-3">
                <label for="fecha">Fecha:</label>
                <input type="date" class="form-control" id="fecha" name="fecha" <div class="form-group">
                <label for="tecnologias">Tecnologías:</label>
                <input type="text" class="form-control" id="tecnologias" name="tecnologias">
            </div>

            <button type="submit" class="btn btn-primary">Agregar Proyecto</button>
        </form>
    </div>
@endsection
