<?php

namespace canendar\core\application_core\application\domain\entities;

use Illuminate\Database\Eloquent\Model;

class EventImage extends Model
{
    protected $table = 'event_images';
    protected $primaryKey = 'id';
    public $timestamps = false;
    protected $fillable = ['event_id', 'url'];

    public function event()
    {
        return $this->belongsTo(Event::class, 'event_id');
    }
}