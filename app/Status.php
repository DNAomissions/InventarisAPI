<?php
	namespace App;

	use Illuminate\Database\Eloquent\Model;

	class Status extends Model{
		protected $table = 'status';
		protected $primaryKey = 'id_status';
		protected $fillable = ['id_status','status'];
		public $timestamps = false;

		public static $rules = [
				'id_status'		=> 'required',
				'status' 		=> 'required'
		];
	}
