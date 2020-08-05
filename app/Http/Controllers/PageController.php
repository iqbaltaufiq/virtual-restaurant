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

    public function payment ()
    {
        // cari semua orderan dari username BARUSU yang belum dibayar
        $total_price = 0;
        $invoice_number = '';
        $user_id = 'BARUSU'; // please retrieve 'user_id' from cookies
        $uncompleted_order = Invoice::where('user_id', $user_id)
                                    ->where('invoice_status', 0)
                                    ->get();
        if (count($uncompleted_order) > 1) {
            for ($i = 0; $i < count($uncompleted_order); $i++) {
                // sum all the prices
                $total_price += $uncompleted_order[$i]->price;
                // check whether if there are different invoices in the collection
                if ($i > 0) {
                    if($uncompleted_order[$i]->invoices_id != $uncompleted_order[$i - 1]->invoices_id){
                        dump('Different invoice found.');
                    } else if ($i == count($uncompleted_order) - 1) {
                        $invoice_number = $uncompleted_order[$i]->invoices_id;
                    }
                }
            }
        } else if (count($uncompleted_order) == 1) {
            $total_price = $uncompleted_order[0]->price;
            $invoice_number = $uncompleted_order[0]->invoices_id;
        }

        return view('contents.payment', [
            'user_id' => $user_id,
            'invoice_number' => $invoice_number,
            'total_price' => $total_price
        ]);
    }

    public function finalize($invoice)
    {
        $user_id = 'BARUSU'; // please retrieve 'user_id' from cookies
        Invoice::where('invoices_id', $invoice)
        ->where('user_id', $user_id)
        ->where('invoice_status', 0)
        ->update([
            'invoice_status' => 1
        ]);

        return redirect('/')->with('status', 'Payment completed.');
    }

    public function cancel($invoice)
    {
        $user_id = 'BARUSU'; // please retrieve 'user_id' from cookies
        Invoice::where('invoices_id', $invoice)
                ->where('user_id', $user_id)
                ->where('invoice_status', 0)
                ->delete();

        return redirect('/')->with('status', 'Your order has been canceled.');
    }

}
