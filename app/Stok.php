<?php
	namespace App;

	use Illuminate\Database\Eloquent\Model;

	class Stok extends Model{
		protected $table = 'stok';
		protected $primaryKey = 'kode_barang';
		protected $fillable = ['kode_barang','jml_brg_masuk','jml_brg_keluar','jml_brg_pinjam','jml_brg_hilang','total_brg'];
		public $timestamps = false;

		public function barang(){
			return $this->belongsTo('App\Barang','kode_barang');
		}
	}
