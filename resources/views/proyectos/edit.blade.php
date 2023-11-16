@extends('layouts.app')

@section('content')
<div class="container">
    <h2>Editar Proyecto</h2>

    <form method="post" action="{{ route('proyectos.update', $proyecto) }}">
        @csrf
        @method('PUT')

        <div class="form-group">
            <label for="nombre">Nombre del Proyecto:</label>
            <input type="text" class="form-control" id="nombre" name="nombre"
                value="{{ $proyecto->nombre }}">
        </div>

        <div class="form-group">
            <label for="link">Enlace:</label>
            <input type="text" class="form-control" id="link" name="link" value="{{ $proyecto->link }}">
        </div>

        <div class="form-group">
            <label for="imagen">URL de la Imagen:</label>
            <input type="text" class="form-control" id="imagen" name="imagen"
                value="{{ $proyecto->imagen }}">
        </div>

        <div class="form-group">
            <label for="fecha">Fecha:</label>
            <input type="date" class="form-control" id="fecha" name="fecha" value="{{ $proyecto->fecha }}">
        </div>

        <div class="form-group">
            <label for="tecnologias">Tecnologías:</label>
            <input type="text" class="form-control" id="tecnologias" name="tecnologias"
                value="{{ $proyecto->tecnologias }}">
        </div>

        <button type="submit" class="btn btn-primary">Actualizar Proyecto</button>
    </form>
</div>



@if ($errors->any())
<div class="alert alert-danger">
    <ul>
        @foreach ($errors->all() as $error)
            <li>{{ $error }}</li>
        @endforeach
    </ul>
</div>
@endif
@endsection
