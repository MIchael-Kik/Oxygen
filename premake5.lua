workspace "Oxygen"
    startproject "Oxygen-app"

    platforms {
        "x86_64"
    }

    configurations {
        "Debug",
        "Release"
    }

    filter "platforms:x86_64"
        architecture "x64"

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Oxygen-app"
    location "Oxygen-app"
    kind "ConsoleApp"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs {
        "/usr/include",
        "/usr/X11R6/include",
    }

    libdirs {
        "/usr/X11R6/lib"
    }

    links {
        "X11"
    }


    filter "configurations:Debug"
        symbols "On"
        defines { "DEBUG" }

    filter "configurations:Release"
        optimize "On"
        defines { "Release" }
