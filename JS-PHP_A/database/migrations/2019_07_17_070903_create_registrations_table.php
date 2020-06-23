<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRegistrationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('registrations', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('event_id')->default(0);
            $table->unsignedInteger('user_id')->default(0);
            $table->enum('registration_type', [
                'early_bird',
                'general',
                'vip'
            ])->default('general');
            $table->dateTime('registration_date');
            $table->decimal('calculated_price')->default(0.0);
            $table->tinyInteger('event_rating')->nullable();

            $table->foreign('event_id')
                ->references('id')
                ->on('events')
                ->onDelete('cascade');

            $table->foreign('user_id')
                ->references('id')
                ->on('attendees')
                ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('registrations');
    }
}
