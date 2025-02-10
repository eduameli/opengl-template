workspace "zim-engine"
   configurations { "debug", "release" }

project "zim-engine"
   kind "ConsoleApp"
   
   language "C++"
   cppdialect "C++23"
   
   targetdir "build/bin/%{cfg.buildcfg}"
   objdir "build/obj/%{cfg.buildcfg}"
   
   defines
   {
      "GLM_ENABLE_EXPERIMENTAL",
      "GLM_FORCE_RADIANS",
   }

   files {
      "**.h",
      "**.cpp",
      "vendor/glad/src/glad.c",

      "vendor/imgui/*.cpp",
      "vendor/imgui/backends/imgui_impl_glfw.cpp",
      "vendor/imgui/backends/imgui_impl_opengl3.cpp",
   }
   
   includedirs
   {
      "vendor/glad/include",
      "vendor/glfw/include",
      "vendor/imgui/",
   }
	
   links
   {
       "glfw",
   }

   filter "configurations:debug"
      defines { "ZM_DEBUG" }
      symbols "On"

   filter "configurations:release"
      defines { "ZM_NDEBUG" }
      optimize "On"

project "glfw"
    location "vendor/glfw"
    kind "StaticLib"
    targetdir ("build/lib/bin/%{cfg.buildcfg}")
    objdir("build/lib/obj/%{cfg.buildcfg}")

    includedirs
    {
        "vendor/glfw/include",
    }

    defines {
        "_GLFW_X11",
        -- "_GLFW_WIN32" SWAP x11 for win32, x11 is for linux!
    }

    files
    {
        "vendor/glfw/src/**.c",
    }

