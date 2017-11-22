<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use App\Administrator;
use App\Client;
use App\Instructor;


class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    protected $admin, $client, $instructor;

    public function __construct(Administrator $adminModel, Instructor $instructorModel, Client $clientModel)
    {
        session_start();
        $this->admin = $adminModel::findUser();
        $this->client = $clientModel::findUser();
        $this->instructor = $instructorModel::findUser();
    }
}
