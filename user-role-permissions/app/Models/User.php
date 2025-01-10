<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable; // Use the Authenticatable class
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens; // If you're using Sanctum for API authentication

class User extends Authenticatable
{
    use HasFactory, Notifiable, HasApiTokens; // Include necessary traits

    protected $fillable = ['full_name', 'email', 'password', 'role'];

    protected $hidden = [
        'password', 'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function role()
    {
        return $this->belongsTo(Role::class);
    }
}
