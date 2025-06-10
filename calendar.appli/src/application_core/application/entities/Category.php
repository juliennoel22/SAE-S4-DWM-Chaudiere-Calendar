<?php

namespace calendar\core\application_core\application\entities;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $table = 'categories';
    protected $primaryKey = 'id';
    public $timestamps = false;
    protected $fillable = ['label', 'description', 'created_at'];

    public function events()
    {
        return $this->hasMany(Event::class, 'category_id');
    }
}