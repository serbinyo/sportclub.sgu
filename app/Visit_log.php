<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Visit_log extends Model
{
    public function showAll()
    {
        return $visitlogs = DB::table('visit_logs')->orderBy('дата')->paginate(25);
    }
}
