<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('enrollments', function (Blueprint $table) {
            $table->id();
            $table->integer('item_type')->comment('1 => course, 2 => book, 3 => video');
            $table->integer('item_id');
            $table->integer('user_id');
            $table->dateTime('enrollment_date');
            $table->integer('payment_status')->default(0)->comment('1 => paid, 0 => unpaid');
            $table->integer('status')->default(0)->comment('1 => active, 0 => inactive');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('enrollments');
    }
};
