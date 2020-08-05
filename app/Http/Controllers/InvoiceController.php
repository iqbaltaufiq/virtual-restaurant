<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Invoice;
use App\Menu;

class InvoiceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = [];

        // untuk halaman checkout ketika dibuka secara langsung
        $invoice_items = Invoice::where([
            ['user_id', 'BARUSU'],
            ['invoice_status', 0]
        ])->get();


        // ambil kode menu_id
        $item_codename = [];
        $posters = [];
        $total_payment = 0;
        foreach ($invoice_items as $data){
            $item_id = substr($data->item_id, 0, 4);
            array_push($item_codename, $item_id);
            $total_payment += $data->price;
        }
        $item_codename = array_unique($item_codename);

        foreach($item_codename as $codename) {
            array_push($posters, [
                'menu_id' => $codename,
                'url' => Menu::where('menu_id', $codename)->value('poster')
            ]);
        }
        // dd($result);
        
        return view('contents.checkout', [
            'invoices' => $invoice_items,
            'total_payment' => $total_payment,
            'posters' => $posters
            ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $letters = ['A','B','C','D'];
        // $letters = ['A','B','C','D','E','F','G','H'];
        // generate 6-digits user_id
        $user_id = 'BARUSU'; // dari cookies login
        $invoice_db = Invoice::where('user_id', $user_id)
                            ->orderBy('invoices_id', 'desc')
                            ->first(); // query ke tabel invoice
        

        // ambil tiga digit pertama dari invoice_id terakhir
        if ($invoice_db && $invoice_db->invoice_status){
            // buat invoice baru
            $invoice_db_arr = str_split($invoice_db->invoices_id);
            
            // cek apakah digit terakhir sudah menyentuh batas
            if ($invoice_db_arr[2] != $letters[3]) {
                $ind = array_search($invoice_db_arr[2], $letters);
                $invoice_db_arr[2] = $letters[++$ind];
            } else {
                // reset digit terakhir menjadi 'A'
                $invoice_db_arr[2] = $letters[0];

                // cek apakah digit kedua sudah menyentuh batas
                if ($invoice_db_arr[1] != $letters[3]) {
                    $ind = array_search($invoice_db_arr[1], $letters);
                    $invoice_db_arr[1] = $letters[++$ind];
                } else {
                    // reset digit kedua menjadi 'A'
                    $invoice_db_arr[1] = $letters[0];
                    
                    // cek apakah digit pertama sudah menyentuh batas
                    if ($invoice_db_arr[0] != $letters[3]) {
                        $ind = array_search($invoice_db_arr[1], $letters);
                        $invoice_db_arr[0] = $letters[++$ind];
                    } else {
                        // tampilkan FULL
                        $invoice_db_arr = ['FULL'];
                    }
                }
            }

            // generate 3-digits invoice_id
            $invoice_id = implode('', $invoice_db_arr);

        } else if ($invoice_db && !$invoice_db->status) {
            // kalo ada tapi belum dibayar, jangan ganti invoice
            $invoice_id = $invoice_db->invoices_id;
        } else {
            // generate invoice baru dengan kode AAA
            $invoice_id = 'AAA' . $user_id;
        }


        // generate item_id
        // menu_id + 2-digit numbers (e.g. MPEK)
        $incompleted_invoice = Invoice::where('invoices_id', $invoice_id)
                                    ->where('item_id', 'like', $request->menu_id.'%')
                                    ->where('invoice_status', 0)
                                    ->orderBy('item_id', 'desc')
                                    ->first();

        // jika ada, maka:
        if ($incompleted_invoice){
            // @TODO
            // ambil 4-digit awal dari item_id
            $item_codename = substr($incompleted_invoice->item_id, 0, 4);
            $item_number = substr($incompleted_invoice->item_id, 4, 2);
            $first_number = $item_number[0];
            $second_number = $item_number[1];
            // jika sama (ada menu tsb di invoice), ambil dua angka dibelakang kemudian increment
            if ($second_number < 9) {
                ++$second_number;
            } else {
                $second_number = 0;
                ++$first_number;
            }
            // gabungkan item_id dengan kode nomor yang baru
            $item_id = $item_codename . $first_number . $second_number;
            
        } else {
            // jika tidak ada, buat kode baru dengan angka 01 dibelakang kode menu_id
            $item_id = $request->menu_id . '01';
        }

        // jika tidak ada pesan tambahan
        if ($request->message == '') {
            $request->message = '-';
        }
        

        // ambil data dari form method post
        // insert ke tabel invoice
        Invoice::create([
            'invoices_id' => $invoice_id,
            'user_id' => $user_id,
            'item_id' => $item_id,
            'item_name' => $request->item_name,
            'quantity' => $request->quantity,
            'option' => $request->option,
            'message' => $request->message,
            'price' => $request->total_price
        ]);
        // selesai
        return redirect('/all')->with('status', 'An item has been added to your foodcart.');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($invoice)
    {
        // 
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Invoice $invoice)
    {
        // 
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($item)
    {
        // untuk menghapus item dari daftar checkout
        $item_id = substr($item, 0, 6);
        $invoice_id = substr($item, 6, 9);
        Invoice::where('invoices_id', $invoice_id)
        ->where('item_id', $item_id)
        ->delete();
        return redirect('/checkout')->with('status', 'Item deleted successfully.');
    }

}
