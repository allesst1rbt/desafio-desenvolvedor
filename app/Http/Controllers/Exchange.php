<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class Exchange extends Controller
{
    public function index(Request $request)
    {
        $response = Http::get('https://economia.awesomeapi.com.br/json/last/BRL-USD');
        $bid = $response->json()['BRLUSD']['bid'];
        $value = intval($request['value'])*$bid;
        return response()->json( $value);
    }
}
