<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Schedule extends Model
{
    public function show()
    {
        return $schedules = DB::table('schedules')->paginate(20);
    }
}
