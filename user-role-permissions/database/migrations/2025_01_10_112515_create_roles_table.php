<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRolesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('roles', function (Blueprint $table) {
            $table->id();  // BIGINT(20) UNSIGNED AUTO_INCREMENT, PRIMARY KEY
            $table->string('role_name')->unique();  // VARCHAR(255), UNIQUE
            $table->text('description')->nullable();  // TEXT, NULLABLE
            $table->timestamps();  // Created_at and Updated_at (timestamp)
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('roles');
    }
}
