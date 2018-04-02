<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Validator;

class Client extends Model
{
    public $timestamps = false;

    public function showAll()
    {
        $entities = DB::table('clients')->orderBy('id')->paginate(10);
        return $entities;
    }

    public function showClient($data)
    {
        $validator = Validator::make($data,
            [
                'lastname' => [
                    'required',
                    'regex:/^[а-яА-Я_]+$/ui',
                    'exists:clients,фамилия'
                ],
            ],
            [
                'lastname.required' => 'Необходимо указать фамилию',
                'lastname.regex' => 'Фамилия должна состоять из 1-ого слова кириллицей',
                'lastname.exists' => 'Персона не найдена'
            ]);

        if ($validator->fails()) {
            return ['errors' => $validator->errors()];
        }
        $lastname = htmlspecialchars(trim($data['lastname']));
        $result = DB::table('clients')->where('фамилия', $lastname)->get();

        return $result;
    }
}
