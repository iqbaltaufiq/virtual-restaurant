<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInvoicesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('invoices', function (Blueprint $table) {
            $table->id();
            $table->char('invoices_id', 9); //AA1BARUSU
            $table->char('user_id', 6); // BARUSU
            $table->char('item_id', 6); //SPAG01, SPAG02, dst.
            $table->boolean('invoice_status')->default(false);
            $table->string('item_name', 255);
            $table->integer('quantity');
            $table->string('option', 255);
            $table->string('message', 255);
            $table->integer('price');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('invoices');
    }
}
