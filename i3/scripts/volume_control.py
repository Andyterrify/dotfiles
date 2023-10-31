#!/usr/bin/python

import subprocess
import sys
from shlex import split

VOLUME_STEPS = 4
MAX_VOLUME = 150

VOL_APP = 2593
NOTIFY_TIMEOUT = 1000


def get_volume():
    p1 = subprocess.Popen(
        split("pactl get-sink-volume @DEFAULT_SINK@"), stdout=subprocess.PIPE)
    p2 = subprocess.Popen(
        split("grep -Po '[0-9]{1,3}(?=%)'"), stdin=p1.stdout, stdout=subprocess.PIPE)
    stdout, stderr = p2.communicate()

    return int(stdout.decode('utf-8').split('\n')[0])


def is_mute():
    output = subprocess.run(
        split("pactl get-sink-mute @DEFAULT_SINK@"), capture_output=True).stdout
    match output.decode('utf-8').split(' ')[1].rstrip():
        case "yes":
            return True
        case "no":
            return False


def send_volume_notify():
    vol = get_volume()
    status = f"Volume: {vol}%"

    if is_mute():
        status = "Volume: Mute"

    subprocess.run(split(
        f"""notify-send -u normal -t {NOTIFY_TIMEOUT} -r {VOL_APP}
                -p "Volume" "{status}"
                -h int:value:{(vol / MAX_VOLUME) * 100}
        """))


def volume_up():
    vol = get_volume()

    subprocess.run(split(f"pactl set-sink-mute @DEFAULT_SINK@ false"))
    if vol + VOLUME_STEPS >= MAX_VOLUME:
        subprocess.run(
            split(f"pactl set-sink-volume @DEFAULT_SINK@ {MAX_VOLUME}%"))
    else:
        subprocess.run(
            split(f"pactl set-sink-volume @DEFAULT_SINK@ +{VOLUME_STEPS}%"))

    send_volume_notify()


def volume_down():
    vol = get_volume()

    if vol - VOLUME_STEPS <= 0:
        subprocess.run(split("pactl set-sink-volume @DEFAULT_SINK@ 0%"))
        subprocess.run(split("pactl set-sink-mute @DEFAULT_SINK@ true"))
    else:
        subprocess.run(
            split(f"pactl set-sink-volume @DEFAULT_SINK@ -{VOLUME_STEPS}%"))

    send_volume_notify()


def volume_mute():
    subprocess.run(split(f"pactl set-sink-mute @DEFAULT_SINK@ {str(is_mute()).lower()}"))
    send_volume_notify()


if __name__ == "__main__":
    command = sys.argv[1]

    match command:
        case "volume_up":
            volume_up()
        case "volume_down":
            volume_down()
        case "volume_mute":
            volume_mute()

    print(is_mute())
