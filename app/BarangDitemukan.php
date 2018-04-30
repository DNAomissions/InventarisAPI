<?php
	namespace App;

	use Illuminate\Database\Eloquent\Model;

	class BarangDitemukan extends Model{
		protected $table = 'barang_ditemukan';
		protected $fillable = [
			'id_barang_ditemukan','nama_barang','spesifikasi','id_lokasi','jumlah_barang','id_kondisi','id_user','id_kategori'
		];
		public $timestamps = false;

		public static $rules = [
			'id_barang_ditemukan' 	=> 'required',
			'nama_barang'			=> 'required',
			'spesifikasi'			=> 'required',
			'id_lokasi'				=> 'required',
			'jumlah_barang'			=> 'required',
			'id_kondisi'			=> 'required',
			'id_user'				=> 'required',
			'id_kategori'			=> 'required'
		];

		public function lokasi(){
			return $this->belongsTo('App\Lokasi','id_lokasi');
		}

		public function kondisi(){
			return $this->belongsTo('App\Kondisi','id_kondisi');
		}

		public function user(){
			return $this->belongsTo('App\User','id_user');
		}

		public function kategori(){
			return $this->belongsTo('App\Kategori','id_kategori');
		}
	}