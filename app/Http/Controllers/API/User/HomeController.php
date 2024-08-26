<?php

namespace App\Http\Controllers\API\User;

use App\Http\Controllers\Controller;
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

    public function viewUserDetails()
    {

        try {

            $user = Auth::user();

            $response = [
                'status' => 200,
                'message' => 'Logged user details.',
                'payload' => $user
            ];

            return response()->json($response, 201);
        } catch (\Exception $ex) {

            return response()->json(['error' => $ex->getMessage()], 500);
        }
    }


    //Update users
    public function updateLoggedUser(Request $request)
    {

        try {

            DB::beginTransaction();

            $user = Auth::user();

            $request->validate([
                'name' => 'required|string|max:255',
                'phone' => 'required',
                'status' => 'required',
                // 'role_id' => 'required',
                'email' => 'required|string|email|max:255|unique:users,email,' . $user->id,
                'password' => 'string|min:6|confirmed',
            ]);

            $user->name = $request->name;
            $user->email = $request->email;
            $user->phone = $request->phone;
            $user->password = Hash::make($request->password);
            // $user->role_id = $request->role_id;
            $user->status = $request->status;

            if ($request->image) {

                $imageName = time() . '.' . $request->image->extension();
                $request->image->move(public_path('images/uploads/users/'), $imageName);
                $imageUrl = 'images/uploads/users/' . $imageName;

                $user->profile_image = $imageUrl;
            }

            $user->save();

            DB::commit();

            $response = [
                'status' => 200,
                'message' => 'User is updated',
                'payload' => $user
            ];

            return response()->json($response, 201);
        } catch (\Exception $ex) {

            DB::rollback();
            return response()->json(['error' => $ex->getMessage()], 500);
        }
    }
}
