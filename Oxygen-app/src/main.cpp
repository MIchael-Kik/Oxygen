#include <stdlib.h>
#include <unistd.h>
#include <X11/Xlib.h>

static Display *dpy;

int main()
{

    if (!(dpy = XOpenDisplay(NULL))) {
        return -1;
    }

    while (dpy) {
        system("nitrogen --set-zoom-fill --random /home/michaelkik/Pictures --save");

        sleep(1800);

        dpy = XOpenDisplay(NULL);
    }

    int exitValue = XCloseDisplay(dpy);

    return exitValue;
}
