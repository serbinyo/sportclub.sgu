<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Response;
use Validator;

class Administrator extends Model
{
    public $timestamps = false;

    protected $fillable = ['id_спортзал', 'фамилия', 'имя', 'отчество', 'снилс', 'улица', 'дом', 'квартира', 'телефон', 'дата_приема_на_работу'];

    public static function findUser()
    {
        $login = '';
        $passwrd = '';
        if (array_key_exists('login', $_SESSION) && array_key_exists('passwd', $_SESSION)) {
            $login = $_SESSION['login'];
            $passwrd = $_SESSION['passwd'];
        }
        $user = DB::table('administrators')->where([
            ['login', $login],
            ['pswd', $passwrd]
        ])->first();
        if (!empty($user)) {
            return $user;
        } else {
            return false;
        }
    }

    public function login($data)
    {
        if (!empty($data['passwd'])) {
            $data['passwd'] = md5($data['passwd']);
        }
        $validator = Validator::make($data,
            [
                'login' => [
                    'required',
                    'exists:administrators,login'
                ],
                'passwd' => [
                    'required',
                    'exists:administrators,pswd'
                ]
            ],
            [
                'login.required' => 'Необходимо указать логин',
                'login.exists' => 'Неверный логин, попробуйте еще раз',
                'passwd.required' => 'Необходимо указать пароль',
                'passwd.exists' => 'Неверный пароль, попробуйте еще раз'
            ]);
        if ($validator->fails()) {
            return ['errors' => $validator->errors()];
        }
        $_SESSION['login'] = $data['login'];
        $_SESSION['passwd'] = $data['passwd'];
    }

    public function showAll()
    {
        $entities = DB::table('administrators')->orderBy('id', 'desc')->paginate(10);
        return $entities;
    }

    public function updateEntity($id, $data)
    {
        if ($err = $this->validateEntity($data)) {
            return $err;
        }
        $entity = self::find($id);
        $entity->фамилия = $data['lastname'];
        $entity->имя = $data['firstname'];
        $entity->отчество = $data['middlename'];
        $entity->снилс = $data['snils'];
        $entity->улица = $data['street'];
        $entity->дом = $data['house'];
        $entity->квартира = $data['apartment'];
        $entity->телефон = $data['tel'];
        $entity->id_спортзал = $data['gym_id'];

        $entity->save();

        return ['success' => true, 'entity' => $data];
    }

    public function saveEntity($data)
    {
        if ($err = $this->validateEntity($data)) {
            return $err;
        }

        $this->id_спортзал = $data['gym_id'];
        $this->фамилия = $data['lastname'];
        $this->имя = $data['firstname'];
        $this->отчество = $data['middlename'];
        $this->снилс = $data['snils'];
        $this->улица = $data['street'];
        $this->дом = $data['house'];
        $this->квартира = $data['apartment'];
        $this->телефон = $data['tel'];
        $this->дата_приема_на_работу = date("Y-m-d");
        $this->save();
        return $this;
    }

    public function validateEntity($data)
    {
        $validator = Validator::make($data,
            [
                'lastname' => 'required',
                'firstname' => 'required',
                'middlename' => 'required',
                'gym_id' => ['required', 'integer'],
                'snils' => 'required',
                'street' => 'required',
                'house' => 'required',
                'apartment' => 'required',
                'tel' => 'required'
            ]);
        if ($validator->fails()) {
            return ['error' => $validator->errors()->all()];
        }
    }

    public function kill($id)
    {
        $entity = self::find($id);
        $entity->delete();
    }


}
