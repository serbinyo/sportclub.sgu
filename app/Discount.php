<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Discount extends Model
{
    public function showAll()
    {
        $entities = DB::table('discounts')->orderBy('стаж')->paginate(10);
        return $entities;
    }

    public function getAll()
    {
        return DB::table('discounts')->get();
    }
}
