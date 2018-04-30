<?php
	namespace App;

	use Illuminate\Database\Eloquent\Model;

	class Kondisi extends Model{
		protected $table = 'kondisi';
		protected $primaryKey = 'id_kondisi';
		protected $fillable = ['id_kondisi','kondisi'];
		public $timestamps = false;

		public static $rules = [
				'id_kondisi'	=> 'required',
				'kondisi' 		=> 'required'
		];
	}
