<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use DB;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
            'full_name' => 'John Doe',
            'email' => 'john.doe@example.com',
            'password' => bcrypt('password123'),  // Use bcrypt for hashing passwords
            'role' => 'Admin',
            'created_at' => now(),
            'updated_at' => now(),
        ]);
    }
}
