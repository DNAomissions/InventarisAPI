<?php

namespace App\Http\Controllers;

class ApiController extends Controller
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

    public function showTables(){
        return response()->json(app('db')->select("SHOW TABLES"));
    }

    public function single($table){
        switch(strtolower($table)){
            case 'barang':
                $result = \App\Barang::with('lokasi')->with('kondisi')->with('kategori')->get();
                break;
            case 'barang_ditemukan':
                $result = \App\BarangDitemukan::with('lokasi')->with('kondisi')->with('user')->with('kategori')->get();
                break;
            case 'barang_hilang':
                $result = \App\BarangHilang::with('barang')->with('user')->get();
                break;
            case 'keluar_barang':
                $result = \App\BarangKeluar::with('barang')->with('user')->with('status')->get();
                break;
            case 'masuk_barang':
                $result = \App\BarangMasuk::with('barang')->with('supplier')->get();
                break;
            case 'pinjam_barang':
                $result = \App\BarangPinjam::with('barang')->with('user')->with('status')->get();
                break;
            case 'kategori':
                $result = \App\Kategori::all();
                break;
            case 'kondisi':
                $result = \App\Kondisi::all();
                break;
            case 'level':
                $result = \App\Level::all();
                break;
            case 'lokasi':
                $result = \App\Lokasi::all();
                break;
            case 'status':
                $result = \App\Status::all();
                break;
            case 'stok':
                $result = \App\Stok::with('barang')->get();
                break;
            case 'supplier':
                $result = \App\Supplier::all();
                break;
            case 'user':
                $result = \App\User::with('level')->get();
                break;
            default :
                $result = [
                    'error' => 'Cant GET request URI API!',
                ];
                break;
        }
        if(empty($result) || count($result)<=0){
            $result = [
                'result' => 'Empty Value at this Table! Not set Yet!',
            ];
        }
        return response()->json($result);
    }

    public function show($table,$id){
        switch(strtolower($table)){
            case 'barang':
                $result = \App\Barang::with('lokasi')->with('kondisi')->with('kategori')->where('kode_barang',$id)->get();
                break;
            case 'barang_ditemukan':
                $result = \App\BarangDitemukan::with('lokasi')->with('kondisi')->with('user')->with('kategori')->where('id_barang_ditemukan',$id)->get();
                break;
            case 'barang_hilang':
                $result = \App\BarangHilang::with('barang')->with('user')->where('id_barang_hilang',$id)->get();
                break;
            case 'keluar_barang':
                $result = \App\BarangKeluar::with('barang')->with('user')->with('status')->where('id_brg_keluar',$id)->get();
                break;
            case 'masuk_barang':
                $result = \App\BarangMasuk::with('barang')->with('supplier')->where('id_msk_brg',$id)->get();
                break;
            case 'pinjam_barang':
                $result = \App\BarangPinjam::with('barang')->with('user')->with('status')->where('no_pinjam',$id)->get();
                break;
            case 'kategori':
                $result = \App\Kategori::where('id_kategori',$id)->get();
                break;
            case 'kondisi':
                $result = \App\Kondisi::where('id_kondisi',$id)->get();
                break;
            case 'level':
                $result = \App\Level::where('id_level',$id)->get();
                break;
            case 'lokasi':
                $result = \App\Lokasi::where('id_lokasi',$id)->get();
                break;
            case 'status':
                $result = \App\Status::where('id_status',$id)->get();
                break;
            case 'stok':
                $result = \App\Stok::with('barang')->where('kode_barang',$id)->get();
                break;
            case 'supplier':
                $result = \App\Supplier::where('id_supplier',$id)->get();
                break;
            case 'user':
                $result = \App\User::with('level')->where('id_user',$id)->get();
                break;
            default :
                $result = [
                    'error' => 'Cant GET request URI API!',
                ];
                break;
        }
        if(empty($result) || count($result)<=0){
            $result = [
                'result' => 'Empty Value at this Id! Not set Yet!',
            ];
        }
        return response()->json($result);
    }

    public function detail($table){
        return view('detail',compact('table'));
    }

    public function columnTable($table){
        return response()->json(app('db')->select("SHOW COLUMNS FROM ".$table));
    }
}
