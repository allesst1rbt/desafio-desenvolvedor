<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class Exchange extends Controller
{
    public function index(Request $request)
    {
        $value = intval($request['value']);
        $paymentMethodTax = match ($request['paymentMethod']) {
            'slip' => (1.45/100)* $value,
            'credit' => (7.63/100)* $value,
        };
        $conversionTax = match (true) {
            $value <=3000=> (3/100)* $value,
            $value > 3000=>(1/100)* $value,
        };
        
        $value = $value - ($paymentMethodTax + $conversionTax);
        $response = Http::get('https://economia.awesomeapi.com.br/json/last/BRL-USD');

        $bid = $response->json()['BRLUSD']['bid'];
        $value = intval($value * $bid);
        return response()->json($value);
    }
}
