<?php

namespace App\Http\Controllers;

use App\Models\Proyecto;

class PortafolioController extends Controller
{

  public function download()
  {
    $file_path = public_path('cv/CVJoséEmanuelCulajayCastillo.pdf');
    return response()->file($file_path,  [
      'Content-Type' => 'application/pdf'
    ]);
  }

  public function portafolio()
  {
    $proyectos = Proyecto::all();
    return view('portafolio', compact('proyectos'));
  }
}
