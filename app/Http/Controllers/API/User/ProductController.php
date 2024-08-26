<?php

namespace App\Http\Controllers\API\User;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Auth;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function viewUserProducts()
    {

        try {

            $user = Auth::user();

            // Fetch products associated with the user
            $products = $user->products()->paginate(env('RECORDS_PER_PAGE'));

            $response = [
                'status' => 200,
                'message' => 'User products are retrived.',
                'payload' => $products
            ];

            return response()->json($response, 201);
        } catch (\Exception $ex) {

            return response()->json(['error' => $ex->getMessage()], 500);
        }
    }

    public function addOrRemoveProductToUser(Request $request)
    {
        try {

            DB::beginTransaction();

            $user = Auth::user();

            $request->validate([
                'product_id' => 'required|exists:products,id'
            ]);

            $message = '';

            $product = Product::find($request->product_id);

            if ($request->is_deleted != 1) {

                $user->products()->attach($product->id);
                $message = 'Product added to user successfully.';
            } else {

                $user->products()->detach($product->id);
                $message = 'Product deleted from user successfully.'; 
            }

            DB::commit();

            $response = [
                'status' => 200,
                'message' => $message,
                'payload' => $product
            ];

            return response()->json($response, 201);

        } catch (\Exception $ex) {

            DB::rollback();
            return response()->json(['error' => $ex->getMessage()], 500);
        }
    }
}
