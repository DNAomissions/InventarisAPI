<?php
	namespace App;

	use Illuminate\Database\Eloquent\Model;

	class BarangPinjam extends Model{
		protected $table = 'pinjam_barang';
		protected $fillable = [
			'no_pinjam','tgl_pinjam','kode_barang','jml_pinjam','nama_peminjam','id_user','tgl_kembali','keterangan','id_status'
		];
		public $timestamps = false;

		public static $rules = [
			'no_pinjam'		=> 'required',
			'tgl_pinjam'	=> 'required',
			'kode_barang'	=> 'required',
			'jml_pinjam'	=> 'required',
			'nama_peminjam'	=> 'required',
			'id_user'		=> 'required',
			'keterangan'	=> 'required',
			'id_status'		=> 'required'
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