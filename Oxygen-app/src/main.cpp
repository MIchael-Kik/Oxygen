#include <stdlib.h>
#include <iostream>
#include <string>
#include <unistd.h>
#include <X11/Xlib.h>

static Display *dpy;

int main(int argc, char** argv)
{

    if (argc < 2) {
        std::cout << "Not enough arguments\n";
        return -1;
    }

    if (!(dpy = XOpenDisplay(NULL))) {
        std::cout << "Could not get Display\n";
        return -1;
    }

    const std::string* command = new std::string(argv[1]);
    const std::string* usrPath = new std::string(getenv("HOME"));

    const std::string timeout = argv[2];
    const std::string fullcommand = "nitrogen --set-zoom-fill --random " + (*usrPath) + (*command) + " --save";

    delete command;
    delete usrPath;

    while (dpy) {
        system(fullcommand.c_str());

        sleep(stoi(timeout));

        dpy = XOpenDisplay(NULL);
    }

    return XCloseDisplay(dpy);
}
