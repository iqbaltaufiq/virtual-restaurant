<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{
    protected $fillable = ['menu_id', 'name', 'category', 'price', 'options', 'rating', 'description', 'poster'];
}
