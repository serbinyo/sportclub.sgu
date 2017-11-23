<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Administrator;

class IndexController extends Controller
{
    function index()
    {
        return view('index', ['admin' => $this->admin]);
    }

    public function auth(Request $request, Administrator $adminModel)
    {
        $data = $request->all();
        if (array_key_exists('login', $data)) {
            $adminModel->login($request);
            return redirect('/');
        } else {
            session_destroy();
            return redirect('/');
        }
    }

}
