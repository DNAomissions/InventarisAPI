<?php
	namespace App;

	use Illuminate\Database\Eloquent\Model;

	class Supplier extends Model{
		protected $table = 'supplier';
		protected $fillable = ['kode_supplier','nama_supplier','alamat_supplier','telp_supplier','kota_supplier'];
		public $timestamps = false;

		public static $rules = [
				'kode_supplier'		=> 'required',
				'nama_supplier'		=> 'required',
				'alamat_supplier'	=> 'required',
				'telp_supplier'		=> 'required',
				'kota_supplier'		=> 'required'
		];
	}
