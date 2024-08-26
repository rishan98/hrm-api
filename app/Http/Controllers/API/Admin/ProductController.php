<?php

namespace App\Http\Controllers\API\Admin;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\User;
use Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function viewProducts()
    {

        try {

            $products = Product::with('users')->paginate(env('RECORDS_PER_PAGE'));

            $response = [
                'status' => 200,
                'message' => 'Products are retrived',
                'payload' => $products
            ];

            return response()->json($response, 201);
        } catch (\Exception $ex) {

            return response()->json(['error' => $ex->getMessage()], 500);
        }
    }


    public function createProduct(Request $request)
    {

        try {

            $request->validate([
                'product_name' => 'required|string|max:255',
                'description' => 'required',
                'image' => 'required|mimes:jpg,png,jpeg,gif,svg|max:2048',
                'price' => 'required',
                'category' => 'required',
                'status' => 'required',
            ]);

            DB::beginTransaction();

            $product = new Product();

            $product->product_name = $request->product_name;
            $product->description = $request->description;
            $product->price = $request->price;
            $product->category = $request->category;
            $product->status = $request->status;

            if ($request->image) {

                $imageName = time() . '.' . $request->image->extension();
                $request->image->move(public_path('images/uploads/products/'), $imageName);
                $imageUrl = 'images/uploads/products/' . $imageName;

                $product->image = $imageUrl;
            }

            $product->save();

            DB::commit();

            $products = Product::with('users')->paginate(env('RECORDS_PER_PAGE'));

            $response = [
                'status' => 200,
                'message' => 'Product is created.',
                'payload' => $products
            ];

            return response()->json($response, 201);
        } catch (\Exception $ex) {

            DB::rollback();
            return response()->json(['error' => $ex->getMessage()], 500);
        }
    }


    public function updateProduct(Request $request)
    {

        try {

            $request->validate([
                'product_name' => 'required|string|max:255',
                'description' => 'required',
                'price' => 'required',
                'category' => 'required',
                'status' => 'required',
            ]);

            DB::beginTransaction();

            $product = Product::find($request->product_id);

            $product->product_name = $request->product_name;
            $product->description = $request->description;
            $product->price = $request->price;
            $product->category = $request->category;
            $product->status = $request->status;

            $product->save();

            DB::commit();

            $products = Product::with('users')->paginate(env('RECORDS_PER_PAGE'));

            $response = [
                'status' => 200,
                'message' => 'Product is updated.',
                'payload' => $products
            ];

            return response()->json($response, 201);
        } catch (\Exception $ex) {

            DB::rollback();
            return response()->json(['error' => $ex->getMessage()], 500);
        }
    }


    public function deleteProduct($id)
    {

        try {

            DB::beginTransaction();

            $product = Product::find($id);

            if ($product) {

                $product->users()->detach();

                $product->delete();

                DB::commit();

                $products = Product::with('users')->paginate(env('RECORDS_PER_PAGE'));

                $response = [
                    'status' => 200,
                    'message' => 'Product is deleted.',
                    'payload' => $products
                ];

                return response()->json($response, 201);
            } else {

                return response()->json(['error' => 'Product not found.'], 400);
            }
        } catch (\Exception $ex) {

            DB::rollback();
            return response()->json(['error' => $ex->getMessage()], 500);
        }
    }
}
