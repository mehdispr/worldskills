<?php

use App\Attendee;
use App\Event;
use App\Registration;
use App\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(UsersTableSeeder::class);

        User::create([
            'name' => 'Admin',
            'username' => 'adminuser1',
            'password' => 'adminpass1',
        ]);

        $attendees = [];
        for ($i = 1; $i < 11; $i++) {
            $attendees[] = [
                'firstname' => 'Attendee' . $i,
                'lastname' => 'Attendee' . $i,
                'username' => 'attendee' . $i,
                'email' => 'attendee' . $i . '@mail.com',
                'photo_path' => '',
                'linkedin_url' => '',
                'password_hash' => bcrypt('attendee' . $i . 'pass'),
            ];
        }
        Attendee::insert($attendees);

        $event = Event::find(1);
        $registrations = [];
        $registration_types = [
            'early_bird',
            'general',
            'vip',
        ];
        $calculated_prices = [
            $event->standard_price * 0.85,
            $event->standard_price,
            $event->standard_price * 1.2,
        ];
        for ($i = 2; $i < 11; $i++) {
            $registrations[] = [
                'event_id' => 1,
                'user_id' => $i,
                'registration_type' => $registration_types[$i % 3],
                'registration_date' => date('Y-m-d H:i:s'),
                'calculated_price' => $calculated_prices[$i % 3],
                'event_rating' => $i % 3,
            ];
        }
        Registration::insert($registrations);
    }
} 