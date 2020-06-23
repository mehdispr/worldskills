<?php

namespace App\Http\Controllers;

use App\Attendee;
use Illuminate\Http\Request;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Validator;

class AttendeesController extends Controller
{
    public function login(Request $request)
    {
        if (!$attendee = Attendee::where('username', $request->username)->first() or !\Hash::check($request->password, $attendee->password_hash)) {
            return abort(401, 'invalid login');
        }

        $attendee->update([
            'token' => md5($attendee->username),
        ]);

        return response()->json([
            'token' => $attendee->token,
        ]);
    }

    public function logout(Request $request)
    {
        $request->attendee->update([
            'token' => '',
        ]);

        return response()->json([
            'message' => 'logout success',
        ]);
    }

    public function register(Request $request)
    {
        $data = $request->all();

        if (isset($data['email'])) {
            $mouse_pos = strpos($data['email'], '@');
            $dot_pos = strpos($data['email'], '.', $mouse_pos);

            $append_str = '';
            if ($dot_pos) {
                $append_str = 'com';
            } else {
                $append_str = '.com';
            }
            $data['formatted_email'] = $data['email'] . $append_str;
        }

        $validator = Validator::make($data, [
            'firstname' => 'required|string',
            'lastname' => 'required|string',
            'formatted_email' => 'required|email',
            'email' => 'required|unique:attendees',
            'username' => 'required|string|unique:attendees',
            'password' => 'required|string',
        ], [
            'email.unique' => 'User email already registered',
            '*' => 'Data can not be processed',
        ]);
        if ($validator->fails()) {
            return abort(422, $validator->errors()->first());
        }

        if (isset($data['photo'])) {
            if ($data['photo'] instanceof UploadedFile) {
                $data['photo_path'] = $data['photo']->store('public/img/avatar');
            } else {
                try {
                    $content = base64_decode($data['photo']);
                    $image = imagecreatefromstring($content);
                    $data['photo_path'] = 'public/img/avatar/' . str_random(40) . '.png';
                    imagepng($image, storage_path('app/' . $data['photo_path']));
                } catch (\Exception $exception) {
                    abort(422, 'Data can not be processed');
                }
            }
        }

        $data['password_hash'] = $data['password'];
        $attendee = Attendee::create($data);

        $attendee->update([
            'token' => md5($attendee->username),
        ]);

        return response()->json([
            'token' => $attendee->token,
        ]);
    }

    public function show(Request $request)
    {
        return response()->json($request->attendee);
    }
}
