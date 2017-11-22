<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Instructor extends Model
{
    public $timestamps = false;

    public static function findUser()
    {
        $login   = '';
        $passwrd = '';
        if(array_key_exists('login', $_SESSION) && array_key_exists('passwd', $_SESSION))
        {
            $login   = $_SESSION['login'];
            $passwrd = $_SESSION['passwd'];
        }
        $user = DB::table('instructors')->where([
            ['login',$login],
            ['pswd',$passwrd]
        ])->first();
        if(!empty($user))
        {
            return $user;
        }
        else
        {
            return false;
        }
    }
}
