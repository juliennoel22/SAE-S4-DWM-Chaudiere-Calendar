<?php


namespace calendar\core\application_core\application\entities;

use Illuminate\Database\Eloquent\Model;

class Event extends Model
{
    protected $table = 'events';
    protected $primaryKey = 'id';
    public $timestamps = false;
    protected $fillable = [
        'title', 'description_md', 'description_html', 'price',
        'date_start', 'date_end', 'time', 'category_id',
        'published', 'created_by', 'created_at'
    ];

    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id');
    }

    public function creator()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function images()
    {
        return $this->hasMany(EventImage::class, 'event_id');
    }
}