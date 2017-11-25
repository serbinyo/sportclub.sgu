<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Sportsmanship extends Model
{
    public function showAll()
    {
        $entities = DB::table('sportsmanships')->orderBy('id')->paginate(10);
        return $entities;
    }
}
