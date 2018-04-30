<?php
	namespace App;

	use Illuminate\Database\Eloquent\Model;

	class Level extends Model{
		protected $table = 'level';
		protected $primaryKey = 'id_level';
		protected $fillable = ['id_level','level'];
		public $timestamps = false;

		public static $rules = [
				'id_level'		=> 'required',
				'level' 		=> 'required'
		];
	}
