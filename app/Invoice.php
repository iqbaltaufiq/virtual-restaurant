<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    //
    protected $fillable = ['invoices_id', 'user_id', 'item_id', 'invoice_status', 'item_name', 'quantity', 'option', 'message', 'price'];
}
