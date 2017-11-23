<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Visit_log extends Model
{
    public function show()
    {
        return $visitlogs = DB::table('visit_logs')->paginate(25);
    }
}
