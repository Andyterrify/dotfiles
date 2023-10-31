#!/usr/bin/python

import subprocess
import sys
from shlex import split

BRIGHTNESS_STEPS = 5

VOL_APP = 2594
NOTIFY_TIMEOUT = 1000

device = "amdgpu_bl0"


def get_brightness():
    result = subprocess.run(split(f"brightnessctl -m i -d {device}"), capture_output=True)
    p = result.stdout.decode('utf-8').strip().split(",")[3]
    return int(p[:len(p)-1])


def notify():
    bri = get_brightness()
    status = f"Brightness: {bri}"

    subprocess.run(split(
        f"""notify-send -u normal -t {NOTIFY_TIMEOUT} -r {VOL_APP}
                -p "System" "{status}"
                -h int:value:{bri}
        """))


def brightness_up():
    subprocess.run(split(f"brightnessctl -m set +{BRIGHTNESS_STEPS}%"))
    notify()


def brightness_down():
    subprocess.run(split(f"brightnessctl -m set {BRIGHTNESS_STEPS}%-"))
    notify()


if __name__ == "__main__":
    command = sys.argv[1]

    match command:
        case "brightness_up":
            brightness_up()
        case "brightness_down":
            brightness_down()

