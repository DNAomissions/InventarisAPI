<?php
	namespace App;

	use Illuminate\Database\Eloquent\Model;

	class BarangHilang extends Model{
		protected $table = 'barang_hilang';
		protected $fillable = [
			'id_barang_hilang','kode_barang','jumlah_barang','id_user'
		];
		public $timestamps = false;

		public static $rules = [
			'id_barang_hilang'	=> 'required',
			'kode_barang'		=> 'required',
			'jumlah_barang'		=> 'required',
			'id_user'			=> 'required'
		];

		public function barang(){
			return $this->belongsTo('App\Barang','kode_barang');
		}

		public function user(){
			return $this->belongsTo('App\User','id_user');
		}
	}