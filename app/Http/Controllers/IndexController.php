<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;

class IndexController extends Controller
{
    function index()
    {
        return view('index', ['admin'=>$this->admin,'client'=>$this->client,'instructor'=>$this->instructor]);
    }

    public function auth(Request $request)
    {
        $data = $request->all();
        if (array_key_exists('login-client',$data))
        {
            return redirect('/');
        }
        elseif (array_key_exists('login-instructor',$data))
        {
            return redirect('/');
        }
        else
        {
            return redirect('/');
        }
    }

}
