<?php

namespace App\Http\Controllers\API\Auth;

use App\Http\Controllers\Controller;
use Auth;
use Illuminate\Http\Request;

class LoginController extends Controller
{
    public function login(Request $request)
    {

        try {

            $credentials = $request->only('email', 'password');

            if (Auth::attempt($credentials)) {

                $user = Auth::user();

                // Check the user's role
                switch ($user->role_id) {
                    case 1:
                        // Admin role
                        $token = $user->createToken('AdminToken')->plainTextToken;
                        return response()->json(['token' => $token, 'role' => 'admin'], 200);

                    case 2:
                        // Lecturer role
                        $token = $user->createToken('LecturerToken')->plainTextToken;
                        return response()->json(['token' => $token, 'role' => 'lecturer'], 200);

                    case 3:
                        // Student role
                        $token = $user->createToken('StudentToken')->plainTextToken;
                        return response()->json(['token' => $token, 'role' => 'student'], 200);

                    default:
                        return response()->json(['error' => 'Unauthorized'], 401);
                }
            }

            return response()->json(['error' => 'Invalid credentials'], 401);

        } catch (\Exception $ex) {

            return response()->json(['error' => $ex->getMessage()], 500);
        }
    }
}
