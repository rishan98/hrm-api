<?php

namespace Database\Seeders;

use App\Models\Role;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RolesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::statement("SET foreign_key_checks = 0");
        DB::table('roles')->truncate();

        Role::insert([
            [
                'role_name' => "admin",
                'status' => 1
            ],
            [
                'role_name' => "user",
                'status' => 1
            ],
        ]);
    }
}
