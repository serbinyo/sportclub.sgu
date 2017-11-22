<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Response;

class Administrator extends Model
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
        $user = DB::table('administrators')->where([
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

    public function login($request)
    {
        $request['passwd'] = md5($request['passwd']);
        $this->validate($request,
            [
                'login'=>[
                    'required',
                    'exists:users,login'
                ],
                'passwd'=>[
                    'required',
                    'exists:users,password'
                ]
            ],
            [
                'login.required'=>'Необходимо указать логин',
                'login.exists'=>'Неверный логин, попробуйте еще раз',
                'passwd.required'=>'Необходимо указать пароль',
                'passwd.exists'=>'Неверный пароль, попробуйте еще раз'
            ]);
        $data        = $request->all();
        $_SESSION['login'] = htmlspecialchars(trim($data['login']));
        $_SESSION['passwd'] = htmlspecialchars(trim($data['passwd']));
    }
}
