<?php
	namespace App;

	use Illuminate\Database\Eloquent\Model;

	class Barang extends Model{
		protected $table = 'barang';
		protected $fillable = [
			'kode_barang','nama_barang','spesifikasi','id_lokasi','jml_barang','id_kondisi','id_kategori','sumber_dana'
		];
		public $timestamps = false;

		public static $rules = [
			'kode_barang'		 	=> 'required',
			'nama_barang'			=> 'required',
			'spesifikasi'			=> 'required',
			'id_lokasi'				=> 'required',
			'jml_barang'			=> 'required',
			'id_kondisi'			=> 'required',
			'id_kategori'			=> 'required',
			'sumber_dana'			=> 'required'
		];

		public function lokasi(){
			return $this->belongsTo('App\Lokasi','id_lokasi');
		}

		public function kondisi(){
			return $this->belongsTo('App\Kondisi','id_kondisi');
		}
		
		public function kategori(){
			return $this->belongsTo('App\Kategori','id_kategori');
		}
	}