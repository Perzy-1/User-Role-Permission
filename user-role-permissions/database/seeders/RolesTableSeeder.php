<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use DB;

class RolesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('roles')->insert([
            ['role_name' => 'Admin', 'description' => 'Full access to system', 'created_at' => now(), 'updated_at' => now()],
            ['role_name' => 'Moderator', 'description' => 'Limited Access', 'created_at' => now(), 'updated_at' => now()],
        ]);
    }
}
