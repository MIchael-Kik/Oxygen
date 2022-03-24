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

    const std::string HOME = getenv("HOME");
    const std::string prefix = "nitrogen --set-zoom-fill --random ";
    const std::string command = argv[1];
    const std::string suffix = " --save";

    const std::string timeout = argv[2];
    const std::string fullcommand = prefix + HOME +  command + suffix;
    while (dpy) {
        system(fullcommand.c_str());

        sleep(stoi(timeout));

        dpy = XOpenDisplay(NULL);
    }

    int exitValue = XCloseDisplay(dpy);

    return exitValue;
}
