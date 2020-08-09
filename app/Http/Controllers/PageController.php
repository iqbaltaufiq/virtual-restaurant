<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Menu;
use App\Invoice;

class PageController extends Controller
{
    public function index ()
    {
        return view('contents.home');
    }

    public function showAll()
    {
        $all_menu = Menu::all();
        return view('contents.category', ['menus' => $all_menu]);
    }

    public function filterMenuByCategory($category)
    {
        $menus = Menu::where('category', $category)->get();
        return view('contents.category', ['menus' => $menus, 'label' => $category]);
    }

    public function detail($item)
    {
        $name = str_replace('-', ' ', $item);
        $menu = Menu::where('name', $name)->first();
        $options = Str::of($menu['options'])->title()->split('/[,]/');
        return view('contents.detail', ['menu' => $menu, 'options' => $options]);
    }
}
