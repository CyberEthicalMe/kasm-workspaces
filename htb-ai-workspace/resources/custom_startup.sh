#!/usr/bin/env bash
/usr/bin/desktop_ready && jupyter lab &> /dev/null &

# exit by going fullscreen in Kasm and ALT+F4
/usr/bin/desktop_ready && firefox --kiosk http://localhost:8888/lab --no-remote &