<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Administrator;
use App\Gym;
use Response;

class AdministratorsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     * @param \App\Administrator $administratorModel
     * @param \App\Gym $gymModel
     */
    public function index(Administrator $administratorModel, Gym $gymModel)
    {
        $entities = $administratorModel->showAll();
        $gyms = $gymModel->getGyms();
        return view('administrators', ['admin' => $this->admin, 'entities' => $entities, 'gyms' => $gyms]);
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
     * @param \App\Administrator $administratorModel
     * @param \App\Gym $gymModel
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, Administrator $administratorModel, Gym $gymModel)
    {
        $gyms = $gymModel->getGyms();
        $data = $request->except('_token');
        if (array_key_exists('entity_id', $data))
        {
            $response = $administratorModel->updateEntity($data['entity_id'], $data);


            foreach ($gyms as $gym)
            {

                if($gym->id == $response['entity']['gym_id'])
                {
                    $response['entity']['gym'] = $gym->название;
                }
            }
            return Response::json($response);
        }
        else
        {
            $response = $administratorModel->saveEntity($data);
            if(is_array($response))
            {
                if (array_key_exists('error',$response))
                {
                    return Response::json(['error'=>$response['error']]);
                }
            }
            else
            {
                $view_one_entity = view('common.one_administrator',['entity' => $response, 'gyms' => $gyms])->render();
                return Response::json(['success'=>true, 'entity'=>$view_one_entity]);
            }
        }
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
     * @param \App\Administrator $administratorModel
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Administrator $administratorModel)
    {
        $administratorModel->kill($id);
        return redirect('administrators');
    }
}
