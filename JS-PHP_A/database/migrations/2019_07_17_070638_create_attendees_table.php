<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAttendeesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('attendees', function (Blueprint $table) {
             $table->increments('id');
            $table->string('firstname')->default('');
            $table->string('lastname')->default('');
            $table->string('username')->unique()->default('');
            $table->string('email')->unique()->default('');
            $table->string('photo_path')->default('');
            $table->string('linkedin_url')->default('');
            $table->string('password_hash')->default('');
            $table->string('token')->default('')->collation('utf8mb4_bin');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('attendees');
    }
}
