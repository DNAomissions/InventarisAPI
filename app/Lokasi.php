<?php
	namespace App;

	use Illuminate\Database\Eloquent\Model;

	class Lokasi extends Model{
		protected $table = 'lokasi';
		protected $primaryKey = 'id_lokasi';
		protected $fillable = ['id_lokasi','lokasi'];
		public $timestamps = false;

		public static $rules = [
				'id_lokasi'		=> 'required',
				'lokasi'		=> 'required'
		];
	}