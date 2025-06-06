<?php

namespace App\models;

use Illuminate\Database\Eloquent\Model;

class Event extends Model
{
    protected $table = 'events';
    public $timestamps = true;
    const UPDATE_AT = null;

    protected $fillable = [
        'id', 'title', 'description_md', 'description_html', 'price', 'date_start', 'date_end', 'time', 'category_id', 'published', 'created_by' 
    ];
}
