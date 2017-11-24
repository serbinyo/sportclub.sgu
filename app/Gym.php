<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Gym extends Model
{
    public function getGyms()
    {
        return DB::table('gyms')->get();
    }
}
