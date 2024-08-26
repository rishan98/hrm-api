<?php

namespace App\Http\Controllers\API\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function viewUsers()
    {

        try {

            $users = User::paginate(env('RECORDS_PER_PAGE'));

            $response = [
                'status' => 200,
                'message' => 'Users are retrived',
                'payload' => $users
            ];

            return response()->json($response, 201);
        } catch (\Exception $ex) {

            return response()->json(['error' => $ex->getMessage()], 500);
        }
    }

}
