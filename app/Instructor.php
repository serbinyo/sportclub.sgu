<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Instructor extends Model
{
    public $timestamps = false;

    public function showAll()
    {
        $entities = DB::table('instructors')->orderBy('id')->paginate(10);
        return $entities;
    }
}
