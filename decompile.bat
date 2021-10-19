@ECHO OFF
cls
setlocal enableextensions enabledelayedexpansion
title MCDecomp
echo ###
echo ### Creating everything needed
echo ###
IF NOT EXIST "out" MKDIR out
IF NOT EXIST "lib" MKDIR lib
IF NOT EXIST "mappings" MKDIR mappings
echo ###
echo ### Downloading Libraries
echo ###
curl -o lib/decomp.jar --silent -LJO https://github.com/mstrobel/procyon/releases/download/0.6-prerelease/procyon-decompiler-0.6-prerelease.jar
echo + procyon-decompiler 0.6-prerelease
curl -o lib/SpecialSource-1.10.0.jar --silent https://repo.maven.apache.org/maven2/net/md-5/SpecialSource/1.10.0/SpecialSource-1.10.0-shaded.jar
echo + SpecialSource 1.10.0-shaded
curl -o lib/guava-20.0.jar --silent https://repo1.maven.org/maven2/com/google/guava/guava/20.0/guava-20.0.jar
echo + guava 20.0
curl -o lib/jopt-simple-4.9.jar --silent https://repo1.maven.org/maven2/net/sf/jopt-simple/jopt-simple/4.9/jopt-simple-4.9.jar
echo + jopt-simple 4.9
curl -o lib/asm-commons-9.2.jar --silent https://repo1.maven.org/maven2/org/ow2/asm/asm-commons/9.2/asm-commons-9.2.jar
echo + asm-commons 9.2
curl -o lib/asm-9.2.jar --silent https://repo1.maven.org/maven2/org/ow2/asm/asm-commons/9.2/asm-9.2.jar
echo + asm (org.ow2) 9.2
curl -o lib/asm-tree-9.2.jar --silent https://repo1.maven.org/maven2/org/ow2/asm/asm-tree/9.2/asm-tree-9.2.jar
echo + asm-tree 9.2
curl -o lib/asm-analysis-9.2.jar --silent https://repo1.maven.org/maven2/org/ow2/asm/asm-analysis/9.2/asm-analysis-9.2.jar
echo + asm analysis
curl -o lib/asm-3.3.1.jar --silent http://www.jabylon.org/maven/org/objectweb/asm/3.3.1/asm-3.3.1.jar
echo + asm (org.objectweb) 3.3.1
ping localhost -n 4 > NUL
:Homepage
cls
echo ###
echo ### Minecraft Decompiler (MCDecomp) version 1 by Vinc3nz
echo ###
echo ### Which Minecraft Version do you want to decompile?
echo ### [1] Minecraft 1.17.x / 1.16.x
echo ### More comming soon
echo ###
CHOICE /C 1
if %errorlevel% equ 2 goto A

:A
cls
echo ###
echo ### [1] Minecraft Version 1.17.1
echo ### [2] Minecraft Version 1.17
echo ### [3] Minecraft Version 1.16.5
echo ### [4] Minecraft Version 1.16.4
echo ### [5] Minecraft Version 1.16.3
echo ### [6] Minecraft Version 1.16.2
echo ### [7] Minecraft Version 1.16.1
echo ### [8] Minecraft Version 1.16
echo ### [0] Return to Homepage

CHOICE /C 012345678
if %errorlevel% equ 1 goto Homepage
if %errorlevel% equ 2 (
echo 1.17.1
set DOWNLOAD=https://launcher.mojang.com/v1/objects/8d9b65467c7913fcf6f5b2e729d44a1e00fde150/client.jar
set MAPPING=https://launcher.mojang.com/v1/objects/e4d540e0cba05a6097e885dffdf363e621f87d3f/client.txt
set VERSION=1.17.1
)
if %errorlevel% equ 3 (
echo 1.17
set DOWNLOAD=https://launcher.mojang.com/v1/objects/1cf89c77ed5e72401b869f66410934804f3d6f52/client.jar
set MAPPING=https://launcher.mojang.com/v1/objects/227d16f520848747a59bef6f490ae19dc290a804/client.txt
set VERSION=1.17
)
if %errorlevel% equ 4 (
echo 1.16.5
set DOWNLOAD=https://launcher.mojang.com/v1/objects/37fd3c903861eeff3bc24b71eed48f828b5269c8/client.jar
set MAPPING=https://launcher.mojang.com/v1/objects/374c6b789574afbdc901371207155661e0509e17/client.txt
set VERSION=1.16.5
)
if %errorlevel% equ 5 (
echo 1.16.4
set DOWNLOAD=https://launcher.mojang.com/v1/objects/1952d94a0784e7abda230aae6a1e8fc0522dba99/client.jar
set MAPPING=https://launcher.mojang.com/v1/objects/0837de813d1a6b67e23da3c520a84e872c8d2f0e/client.txt
set VERSION=1.16.4
)
if %errorlevel% equ 6 (
echo 1.16.3
set DOWNLOAD=https://launcher.mojang.com/v1/objects/1321521b2caf934f7fc9665aab7e059a7b2bfcdf/client.jar
set MAPPING=https://launcher.mojang.com/v1/objects/faac5028fbca3859db970cc4ca041aeec55f6d9d/client.txt
set VERSION=1.16.3
)
if %errorlevel% equ 7 (
echo 1.16.2
set DOWNLOAD=https://launcher.mojang.com/v1/objects/653e97a2d1d76f87653f02242d243cdee48a5144/client.jar
set MAPPING=https://launcher.mojang.com/v1/objects/16d12d67cd5341bfc848340f61f3ff6b957537fe/client.txt
set VERSION=1.16.2
)
if %errorlevel% equ 8 (
echo 1.16.1
set DOWNLOAD=https://launcher.mojang.com/v1/objects/c9abbe8ee4fa490751ca70635340b7cf00db83ff/client.jar
set MAPPING=https://launcher.mojang.com/v1/objects/ddf517a4f6750f4c15189de4e03246ae1f916cf5/client.txt
set VERSION=1.16.1
)
if %errorlevel% equ 9 (
echo 1.16
set DOWNLOAD=https://launcher.mojang.com/v1/objects/228fdf45541c4c2fe8aec4f20e880cb8fcd46621/client.jar
set MAPPING=https://launcher.mojang.com/v1/objects/9539840a7dbea682b305858fe138bd03ee7823cf/client.txt
set VERSION=1.16
)

cls
echo ###
echo ### Creating everything needed
echo ###
echo ###
echo ### Downloading Libraries
echo ###
echo + procyon-decompiler 0.6-prerelease
echo + SpecialSource 1.10.0-shaded
echo + guava 20.0
echo + jopt-simple 4.9
echo + asm-commons 9.2
echo + asm (org.ow2) 9.2
echo + asm-tree 9.2
echo + asm analysis
echo + asm (org.objectweb) 3.3.1
mkdir %VERSION%
echo ###
echo ### Downloading the Client and the Mappings...
echo ###
curl -o mappings/mapping-%VERSION%.txt %MAPPING% --silent
curl -o %VERSION%/%VERSION%.jar %DOWNLOAD% --silent
echo ###
echo ### Starting Mapping Process
echo ###
cd ./lib
java -cp SpecialSource-1.10.0.jar;*;. net.md_5.specialsource.SpecialSource --in-jar ../%VERSION%/%VERSION%.jar --out-jar ../%VERSION%/%VERSION%-mapped.jar --srg-in ../mappings/mapping-%VERSION%.txt --kill-lvt
echo ###
echo ### Starting Decompiling
echo ###
java -jar decomp.jar -jar ../%VERSION%/%VERSION%-mapped.jar -o ../%VERSION%/src
echo ###
echo ### Minecraft %VERSION% source is now in out/src
echo ###
echo ### Script made 2021 by Vinc3nz. 
echo ### Report bugs under github.com/vinc3nz/mcdecomp
echo ###
cd ..
pause