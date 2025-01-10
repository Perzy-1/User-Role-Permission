<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();  // BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY
            $table->string('full_name');  // VARCHAR(255)
            $table->string('email')->unique();  // VARCHAR(255), UNIQUE
            $table->string('password');  // VARCHAR(255)
            $table->string('role');  // VARCHAR(255)
            $table->timestamps();  // Created_at and Updated_at (timestamp)
        });

        // You can add additional indexes or constraints if needed
        Schema::table('users', function (Blueprint $table) {
            $table->unique('role');  // Add a unique constraint for the 'role' column
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
