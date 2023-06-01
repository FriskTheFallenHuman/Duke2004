# Duke Nukem Forever UE3

Welcome to the Duke Nukem Forever 2003/2004 project. The goal of the this project is to port 2001 to a more stable engine.

This project uses the Unreal Engine 3, to compile please check out the compiler instructions.

## Requirements:
* Windows 7 x64
* Visual Studio:
	* [Visual Studio 2010 Ultimate](https://archive.org/download/en_vs_2010_ult/SW_DVD9_VS_Ultimate_2010_English_Core_MLF_X16-76630.ISO)
	* [Visual Studio 2010 SP1](https://archive.org/download/en_vs_2010_ult/mu_visual_studio_2010_sp1_x86_dvd_651704.iso)
	* [Update for SP1](https://www.microsoft.com/en-us/download/details.aspx?id=34677)
* [DirectX SDK](https://www.microsoft.com/en-us/download/details.aspx?id=6812)

## Installation:
1. Download the [external dependencies.](https://drive.google.com/file/d/13JJmXuYvq7Yd6yRePLOpKasx6zVxQItd/view?usp=share_link)
2. Extract the External Folder to your Development folder.
3. Extract `Engine_MI_shaders.upk` to `Engine/Content`

## Compiling:
1. Open `UE3.sln`.
2. Rebuild/Compile `UnrealBuildTool`.
3. Open in Visual studio the project `MultiBuild`:
	* Inside the project you can find a file called `targets.txt`  here's where you can tell `UnrealBuildTool` which Target/Game to build uncomment the game by removing the `;` .
4. Compile `MultiBuild`.
