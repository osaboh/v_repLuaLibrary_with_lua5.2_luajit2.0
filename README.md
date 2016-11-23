## Support Lua 5.2 and Luajit 2.0 for V-REP 3.3.1

### Check dependency library (Debain jessie)

```shell
dpkg -l | grep liblua | grep dev
ii  liblua5.1-0-dev:amd64      5.1.5-7.1     amd64  Development files for the Lua language version 5.1
ii  liblua5.2-dev:amd64        5.2.3-1.1     amd64  Development files for the Lua language version 5.2
ii  libluajit-5.1-dev:amd64    2.0.3+dfsg-3  amd64  Just in time compiler for Lua - development files
```

### Build library

```shell
$ make
make target lists
  lua52            -- build Lua 5.2
  luajit20         -- build Luajit 2.0
  default          -- build Lua 5.2 (V-REP default??)
```


### Enable external library

Edit parameter "useExternalLuaLibrary" in system/usrset.txt to TRUE.


### Usage
```shell
$ cd VREP_INSTALLED_DIRECTORY/programming/
$ mv v_repLuaLibrary v_repLuaLibrary.org
$ git clone git@github.com:osaboh/v_repLuaLibrary_with_lua5.2_luajit2.0.git
$ ln -s v_repLuaLibrary_with_lua5.2_luajit2.0 v_repLuaLibrary
$ cd v_repLuaLibrary
$ make luajit20 # or make lua52

$ emacs V-REP_PRO_EDU_V3_3_1_64_Linux/system/usrset.txt
$ diff -u usrset.txt.org usrset.txt
--- usrset.txt.org      2016-11-22 22:10:33.049545986 +0900
+++ usrset.txt          2016-11-23 13:19:44.867642745 +0900
@@ -240,5 +240,5 @@
 test1 = false // recommended to keep false.
 orderHierarchyAlphabetically = false
 macChildDialogType = -1 // -1=default.
-useExternalLuaLibrary = false // if true, will call all Lua functions via the v_repLua library ('v_repLua.dll', 'libv_repLua.so' or 'libv_repLua.dylib')
+useExternalLuaLibrary = true
 raiseErrorWithApiScriptFunctions = true
```

### See also URL
http://www.coppeliarobotics.com/helpFiles/en/scripts.htm  
http://www.forum.coppeliarobotics.com/viewtopic.php?f=7&t=4007  