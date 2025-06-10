<?php


namespace canendar\core\application_core\application\domain\entities;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    protected $table = 'users';
    protected $primaryKey = 'id';
    public $timestamps = false;
    protected $fillable = ['email', 'password_hash', 'is_superadmin', 'created_at'];

    public function events()
    {
        return $this->hasMany(Event::class, 'created_by');
    }
}