<?php
	namespace App;

	use Illuminate\Database\Eloquent\Model;

	class BarangMasuk extends Model{
		protected $table = 'masuk_barang';
		protected $fillable = [
			'id_msk_brg','kode_barang','tgl_masuk','jml_masuk','kode_supplier'
		];
		public $timestamps = false;

		public static $rules = [
			'id_msk_brg'	=> 'required',
			'kode_barang'	=> 'required',
			'tgl_masuk'		=> 'required',
			'jml_masuk'		=> 'required',
			'kode_supplier'	=> 'required'
		];

		public function barang(){
			return $this->belongsTo('App\Barang','kode_barang');
		}

		public function supplier(){
			return $this->belongsTo('App\Supplier','kode_supplier');
		}
	}