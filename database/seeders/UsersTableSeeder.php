<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::statement("SET foreign_key_checks = 0");
        DB::table('users')->truncate();

        User::create([
            'name' => "Administrator",
            'phone' => null,
            'profile_image' => null,
            'role_id' => 1,
            'status' => 1,
            'email' => "admin@gmail.com",
            'email_verified_at' => date('Y-m-d H:i:s'),
            'password' => Hash::make('12345678'),
            'remember_token' => null,

        ]);

    }
}
