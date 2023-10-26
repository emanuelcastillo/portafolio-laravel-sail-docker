<?php

namespace App\Http\Controllers;

class DownloadsController extends Controller
{

  public function download()
  {
    $file_path = public_path('cv/CVJoséEmanuelCulajayCastillo.pdf');
    return response()->file($file_path,  [
      'Content-Type' => 'application/pdf'
    ]);
  }
}
