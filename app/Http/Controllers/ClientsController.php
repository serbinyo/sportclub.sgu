<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Client;

class ClientsController extends Controller
{

    private $found_clients = '';

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Client $clientModel)
    {
        $clients = $clientModel->showAll();
        return view('clients', ['admin' => $this->admin, 'clients' => $clients, 'found_clients' => $this->found_clients]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, Client $clientModel)
    {
        $data = $request->all();

        if (array_key_exists('lastname', $data)) {
            $response = $clientModel->showClient($data);
            if (is_array($response) && array_key_exists('errors', $response)) {
                return back()->withInput()->withErrors($response['errors']);
            }
            $this->found_clients = $response;
        }
        $clients = $clientModel->showAll();
        return view('clients', ['admin' => $this->admin, 'clients' => $clients, 'found_clients' => $this->found_clients]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
