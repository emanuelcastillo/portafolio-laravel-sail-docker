<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Proyecto;

class ProyectoController extends Controller
{

    public function update(Request $request,  Proyecto $proyecto)
    {
        $request->validate([
            'nombre' => 'required',
            'link' => 'required',
            'imagen' => 'required',
            'fecha' => 'required|date',
            'tecnologias' => 'required',
        ]);

        $proyecto->update($request->all());

        return redirect()->route('home')->with('success', 'Proyecto actualizado exitosamente');
    }

    public function edit(int $id)
    {
        $proyecto = Proyecto::findOrFail($id);
        return view('proyectos.edit', compact('proyecto'));
    }

    public function store(Request $request)
{
    $request->validate([
        'nombre' => 'required',
        'link' => 'required',
        'imagen' => 'required',
        'fecha' => 'required|date',
        'tecnologias' => 'required',
    ]);

    Proyecto::create($request->all());

    return redirect()->route('home')->with('success', 'Nuevo proyecto agregado exitosamente');
}
}
