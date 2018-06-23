#!/usr/bin/env python3
from gi.repository import i3ipc
from gi.repository import Notify
from time import sleep

def on_urgent(i3, e):
    urgent_wins = list(filter(lambda x: x.get_property('urgent'), i3.get_tree().leaves()))
    if urgent_wins:
        # print only first urgent workspace
        msg = "on ws {ws}: {win}".format(win=urgent_wins[0].get_name(),ws=urgent_wins[0].workspace().get_name())
        Notify.Notification.new('Urgent window', msg, 'dialog-information').show()

Notify.init('i3')
i3 = i3ipc.Connection()
i3.on("workspace::urgent", on_urgent)

i3.main()
