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
        Schema::create('courses', function (Blueprint $table) {
            $table->id();
            $table->string('course_name');
            $table->text('description')->nullable();
            $table->integer('user_id');
            $table->integer('is_class')->default(0)->comment('1 => class, 0 => other');
            $table->integer('category')->default(0)->comment('1 => available, 0 => upcoming');
            $table->string('duration')->nullable();
            $table->decimal('old_price')->nullable();
            $table->decimal('new_price')->nullable();
            $table->string('image')->nullable();
            $table->string('url')->nullable();
            $table->string('start_time')->nullable();
            $table->integer('status')->default(0)->comment('1 => active, 0 => inactive');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('courses');
    }
};
