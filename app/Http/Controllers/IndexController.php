<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Administrator;
use App\Client;
use App\Instructor;
use Illuminate\Support\MessageBag;

class IndexController extends Controller
{
    function index()
    {
        return view('index', ['admin' => $this->admin, 'client' => $this->client, 'instructor' => $this->instructor]);
    }

    public function auth(Request $request, Administrator $adminModel, Instructor $instructorModel, Client $clientModel)
    {
        $data = $request->all();
        if (array_key_exists('login', $data)) {
            if (array_key_exists('role', $data)) {
                switch ($data['role']) {
                    case 'client':
                        $clientModel->login($request);
                        break;
                    case 'instructor':
                        $instructorModel->login($request);
                        break;
                    case 'admin':
                        $adminModel->login($request);
                        break;
                }
                return redirect('/');
            } else {
                $error = new MessageBag(['Не выбрана роль (Клиент, Тренер или Администратор)']);
                return view('index', ['admin' => $this->admin, 'client' => $this->client, 'instructor' => $this->instructor, 'errors' => $error]);
            }
        } else {
            session_destroy();
            return redirect('/');
        }
    }

}
