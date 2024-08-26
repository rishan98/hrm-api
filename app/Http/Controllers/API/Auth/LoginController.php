<?php

namespace App\Http\Controllers\API\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class LoginController extends Controller
{
    public function login(Request $request)
    {
        try {
            // Validate the request data
            $request->validate([
                'email' => 'required|email',
                'password' => 'required|min:6',
            ]);

            $credentials = $request->only('email', 'password');

            if (Auth::attempt($credentials)) {
                $user = Auth::user();

                if ($user->status != 1) {
                    return response()->json([
                        'status' => 403,
                        'error' => 'Your account is inactive. Please contact support.'
                    ], 403);
                }

                // Check the user's role and generate a token accordingly
                switch ($user->role_id) {
                    case 1:
                        // Admin role
                        $token = $user->createToken('AdminToken')->plainTextToken;

                        return response()->json([
                            'status' => 200,
                            'role' => 'admin',
                            'token' => $token,
                            'user' => $user
                        ], 200);

                    case 2:
                        // User role
                        $token = $user->createToken('UserToken')->plainTextToken;

                        return response()->json([
                            'status' => 200,
                            'role' => 'user',
                            'token' => $token,
                            'user' => $user
                        ], 200);

                    default:
                        return response()->json([
                            'status' => 401,
                            'error' => 'Unauthorized'
                        ], 401);
                }
            }

            // If credentials are invalid
            return response()->json([
                'status' => 401,
                'error' => 'Invalid credentials'
            ], 401);
        } catch (\Exception $ex) {
            return response()->json(['error' => $ex->getMessage()], 500);
        }
    }

    //Register function
    public function register(Request $request)
    {

        try {

            $request->validate([
                'name' => 'required|string|max:255',
                'phone' => 'required',
                // 'status' => 'required',
                'role_id' => 'required',
                'image' => 'mimes:jpg,png,jpeg,gif,svg|max:2048',
                'email' => 'required|string|email|max:255|unique:users',
                'password' => 'required|string|min:6',
            ]);

            DB::beginTransaction();

            $user = new User();

            $user->name = $request->name;
            $user->email = $request->email;
            $user->phone = $request->phone;
            $user->password = Hash::make($request->password);
            $user->role_id = $request->role_id;
            $user->status = 1;

            if ($request->image) {

                $imageName = time() . '.' . $request->image->extension();
                $request->image->move(public_path('images/uploads/users/'), $imageName);
                $imageUrl = 'images/uploads/users/' . $imageName;

                $user->profile_image = $imageUrl;
            }

            $user->save();

            // Generate an API token
            if ($request->role_id == 1) {

                $token = $user->createToken('AdminToken')->plainTextToken;
            } else {
                $token = $user->createToken('UserToken')->plainTextToken;
            }

            DB::commit();

            $response = [
                'status' => 200,
                'message' => 'User is created.',
                'token' => $token,
                'user' => $user
            ];

            return response()->json($response, 201);
        } catch (\Exception $ex) {

            DB::rollback();
            return response()->json(['error' => $ex->getMessage()], 500);
        }
    }
}
