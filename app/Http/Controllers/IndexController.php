<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class IndexController extends Controller
{
    function index()
    {
        $coaches = DB::table('Тренер')->get();
        return view('welcome', ['coaches'=>$coaches]);
    }
}
