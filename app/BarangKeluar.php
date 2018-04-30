<?php
	namespace App;

	use Illuminate\Database\Eloquent\Model;

	class BarangKeluar extends Model{
		protected $table = 'keluar_barang';
		protected $fillable = [
			'id_brg_keluar','kode_barang','tgl_keluar','id_user','jml_brg_keluar','keperluan','id_status'
		];
		public $timestamps = false;

		public static $rules = [
			'id_brg_keluar'		=> 'required',
			'kode_barang'		=> 'required',
			'tgl_keluar'		=> 'required',
			'id_user'			=> 'required',
			'jml_brg_keluar'	=> 'required',
			'keperluan'			=> 'required',
			'id_status'			=> 'required'
		];

		public function barang(){
			return $this->belongsTo('App\Barang','kode_barang');
		}

		public function user(){
			return $this->belongsTo('App\User','id_user');
		}

		public function status(){
			return $this->belongsTo('App\Status','id_status');
		}
	}