<?php

    namespace App\Http\Controllers;

    use App\Kategori;

    class KategoriController extends Controller
    {
        /**
         * Create a new controller instance.
         *
         * @return void
         */
        public function __construct()
        {
            //
        }

        public function index(){
            $kategori = Kategori::all();
            return response()->json($kategori);
        }
    }
