<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEventsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('events', function (Blueprint $table) {
           $table->unsignedInteger('id');
            $table->string('title')->default('');
            $table->string('description')->default('');
            $table->date('date')->nullable();
            $table->time('time')->nullable();
            $table->smallInteger('duration_days')->nullable();
            $table->string('location')->default('');
            $table->double('standard_price')->default(0.0);
            $table->integer('capacity')->default(0.0);
            $table->timestamps();
            $table->primary('id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('events');
    }
}
