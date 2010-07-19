# Microsoft Developer Studio Generated NMAKE File, Based on LnkIconShim.dsp
!IF "$(CFG)" == ""
CFG=LnkIconShim - Win32 Unicode Release MinDependency
!MESSAGE No configuration specified. Defaulting to LnkIconShim - Win32 Unicode Release MinDependency.
!ENDIF 

!IF "$(CFG)" != "LnkIconShim - Win32 Debug" && "$(CFG)" != "LnkIconShim - Win32 Unicode Debug" && "$(CFG)" != "LnkIconShim - Win32 Release MinSize" && "$(CFG)" != "LnkIconShim - Win32 Release MinDependency" && "$(CFG)" != "LnkIconShim - Win32 Unicode Release MinSize" && "$(CFG)" != "LnkIconShim - Win32 Unicode Release MinDependency"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "LnkIconShim.mak" CFG="LnkIconShim - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "LnkIconShim - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "LnkIconShim - Win32 Unicode Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "LnkIconShim - Win32 Release MinSize" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "LnkIconShim - Win32 Release MinDependency" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "LnkIconShim - Win32 Unicode Release MinSize" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "LnkIconShim - Win32 Unicode Release MinDependency" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "LnkIconShim - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

ALL : "$(OUTDIR)\LnkIconShim.dll" ".\LnkIconShim.tlb" "$(OUTDIR)\LnkIconShim.bsc" ".\Debug\regsvr32.trg"


CLEAN :
	-@erase "$(INTDIR)\LnkIconShim.obj"
	-@erase "$(INTDIR)\LnkIconShim.pch"
	-@erase "$(INTDIR)\LnkIconShim.res"
	-@erase "$(INTDIR)\LnkIconShim.sbr"
	-@erase "$(INTDIR)\LnkIconShlExt.obj"
	-@erase "$(INTDIR)\LnkIconShlExt.sbr"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\StdAfx.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\LnkIconShim.bsc"
	-@erase "$(OUTDIR)\LnkIconShim.dll"
	-@erase "$(OUTDIR)\LnkIconShim.exp"
	-@erase "$(OUTDIR)\LnkIconShim.ilk"
	-@erase "$(OUTDIR)\LnkIconShim.pdb"
	-@erase ".\LnkIconShim.h"
	-@erase ".\LnkIconShim.tlb"
	-@erase ".\LnkIconShim_i.c"
	-@erase ".\Debug\regsvr32.trg"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\LnkIconShim.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

MTL=midl.exe
MTL_PROJ=
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\LnkIconShim.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\LnkIconShim.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\LnkIconShim.sbr" \
	"$(INTDIR)\LnkIconShlExt.sbr" \
	"$(INTDIR)\StdAfx.sbr"

"$(OUTDIR)\LnkIconShim.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\LnkIconShim.pdb" /debug /def:".\LnkIconShim.def" /out:"$(OUTDIR)\LnkIconShim.dll" /implib:"$(OUTDIR)\LnkIconShim.lib" /pdbtype:sept 
DEF_FILE= \
	".\LnkIconShim.def"
LINK32_OBJS= \
	"$(INTDIR)\LnkIconShim.obj" \
	"$(INTDIR)\LnkIconShlExt.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\LnkIconShim.res"

"$(OUTDIR)\LnkIconShim.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

OutDir=.\Debug
TargetPath=.\Debug\LnkIconShim.dll
InputPath=.\Debug\LnkIconShim.dll
SOURCE="$(InputPath)"

"$(OUTDIR)\regsvr32.trg" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	regsvr32 /s /c "$(TargetPath)" 
	echo regsvr32 exec. time > "$(OutDir)\regsvr32.trg" 
<< 
	

!ELSEIF  "$(CFG)" == "LnkIconShim - Win32 Unicode Debug"

OUTDIR=.\DebugU
INTDIR=.\DebugU
# Begin Custom Macros
OutDir=.\DebugU
# End Custom Macros

ALL : "$(OUTDIR)\LnkIconShim.dll" ".\LnkIconShim.tlb" ".\LnkIconShim.h" ".\LnkIconShim_i.c" ".\DebugU\regsvr32.trg"


CLEAN :
	-@erase "$(INTDIR)\LnkIconShim.obj"
	-@erase "$(INTDIR)\LnkIconShim.pch"
	-@erase "$(INTDIR)\LnkIconShim.res"
	-@erase "$(INTDIR)\LnkIconShlExt.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\LnkIconShim.dll"
	-@erase "$(OUTDIR)\LnkIconShim.exp"
	-@erase "$(OUTDIR)\LnkIconShim.ilk"
	-@erase "$(OUTDIR)\LnkIconShim.pdb"
	-@erase ".\LnkIconShim.h"
	-@erase ".\LnkIconShim.tlb"
	-@erase ".\LnkIconShim_i.c"
	-@erase ".\DebugU\regsvr32.trg"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_USRDLL" /D "_UNICODE" /Fp"$(INTDIR)\LnkIconShim.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

MTL=midl.exe
MTL_PROJ=
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\LnkIconShim.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\LnkIconShim.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\LnkIconShim.pdb" /debug /def:".\LnkIconShim.def" /out:"$(OUTDIR)\LnkIconShim.dll" /implib:"$(OUTDIR)\LnkIconShim.lib" /pdbtype:sept 
DEF_FILE= \
	".\LnkIconShim.def"
LINK32_OBJS= \
	"$(INTDIR)\LnkIconShim.obj" \
	"$(INTDIR)\LnkIconShlExt.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\LnkIconShim.res"

"$(OUTDIR)\LnkIconShim.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

OutDir=.\DebugU
TargetPath=.\DebugU\LnkIconShim.dll
InputPath=.\DebugU\LnkIconShim.dll
SOURCE="$(InputPath)"

"$(OUTDIR)\regsvr32.trg" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	regsvr32 /s /c "$(TargetPath)" 
	echo regsvr32 exec. time > "$(OutDir)\regsvr32.trg" 
<< 
	

!ELSEIF  "$(CFG)" == "LnkIconShim - Win32 Release MinSize"

OUTDIR=.\ReleaseMinSize
INTDIR=.\ReleaseMinSize
# Begin Custom Macros
OutDir=.\ReleaseMinSize
# End Custom Macros

ALL : "$(OUTDIR)\LnkIconShim.dll" ".\LnkIconShim.tlb" ".\LnkIconShim.h" ".\LnkIconShim_i.c" ".\ReleaseMinSize\regsvr32.trg"


CLEAN :
	-@erase "$(INTDIR)\LnkIconShim.obj"
	-@erase "$(INTDIR)\LnkIconShim.pch"
	-@erase "$(INTDIR)\LnkIconShim.res"
	-@erase "$(INTDIR)\LnkIconShlExt.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\LnkIconShim.dll"
	-@erase "$(OUTDIR)\LnkIconShim.exp"
	-@erase "$(OUTDIR)\LnkIconShim.map"
	-@erase ".\LnkIconShim.h"
	-@erase ".\LnkIconShim.tlb"
	-@erase ".\LnkIconShim_i.c"
	-@erase ".\ReleaseMinSize\regsvr32.trg"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /O1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "_ATL_DLL" /D "_ATL_MIN_CRT" /Fp"$(INTDIR)\LnkIconShim.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

MTL=midl.exe
MTL_PROJ=
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\LnkIconShim.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\LnkIconShim.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\LnkIconShim.pdb" /map:"$(INTDIR)\LnkIconShim.map" /def:".\LnkIconShim.def" /out:"$(OUTDIR)\LnkIconShim.dll" /implib:"$(OUTDIR)\LnkIconShim.lib" 
DEF_FILE= \
	".\LnkIconShim.def"
LINK32_OBJS= \
	"$(INTDIR)\LnkIconShim.obj" \
	"$(INTDIR)\LnkIconShlExt.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\LnkIconShim.res"

"$(OUTDIR)\LnkIconShim.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

OutDir=.\ReleaseMinSize
TargetPath=.\ReleaseMinSize\LnkIconShim.dll
InputPath=.\ReleaseMinSize\LnkIconShim.dll
SOURCE="$(InputPath)"

"$(OUTDIR)\regsvr32.trg" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	regsvr32 /s /c "$(TargetPath)" 
	echo regsvr32 exec. time > "$(OutDir)\regsvr32.trg" 
<< 
	

!ELSEIF  "$(CFG)" == "LnkIconShim - Win32 Release MinDependency"

OUTDIR=.\ReleaseMinDependency
INTDIR=.\ReleaseMinDependency
# Begin Custom Macros
OutDir=.\ReleaseMinDependency
# End Custom Macros

ALL : "$(OUTDIR)\LnkIconShim.dll" ".\LnkIconShim.tlb" ".\LnkIconShim.h" ".\LnkIconShim_i.c" ".\ReleaseMinDependency\regsvr32.trg"


CLEAN :
	-@erase "$(INTDIR)\LnkIconShim.obj"
	-@erase "$(INTDIR)\LnkIconShim.pch"
	-@erase "$(INTDIR)\LnkIconShim.res"
	-@erase "$(INTDIR)\LnkIconShlExt.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\LnkIconShim.dll"
	-@erase "$(OUTDIR)\LnkIconShim.exp"
	-@erase "$(OUTDIR)\LnkIconShim.map"
	-@erase ".\LnkIconShim.h"
	-@erase ".\LnkIconShim.tlb"
	-@erase ".\LnkIconShim_i.c"
	-@erase ".\ReleaseMinDependency\regsvr32.trg"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /O1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "_ATL_STATIC_REGISTRY" /D "_ATL_MIN_CRT" /Fp"$(INTDIR)\LnkIconShim.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

MTL=midl.exe
MTL_PROJ=
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\LnkIconShim.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\LnkIconShim.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\LnkIconShim.pdb" /map:"$(INTDIR)\LnkIconShim.map" /def:".\LnkIconShim.def" /out:"$(OUTDIR)\LnkIconShim.dll" /implib:"$(OUTDIR)\LnkIconShim.lib" 
DEF_FILE= \
	".\LnkIconShim.def"
LINK32_OBJS= \
	"$(INTDIR)\LnkIconShim.obj" \
	"$(INTDIR)\LnkIconShlExt.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\LnkIconShim.res"

"$(OUTDIR)\LnkIconShim.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

OutDir=.\ReleaseMinDependency
TargetPath=.\ReleaseMinDependency\LnkIconShim.dll
InputPath=.\ReleaseMinDependency\LnkIconShim.dll
SOURCE="$(InputPath)"

"$(OUTDIR)\regsvr32.trg" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	regsvr32 /s /c "$(TargetPath)" 
	echo regsvr32 exec. time > "$(OutDir)\regsvr32.trg" 
<< 
	

!ELSEIF  "$(CFG)" == "LnkIconShim - Win32 Unicode Release MinSize"

OUTDIR=.\ReleaseUMinSize
INTDIR=.\ReleaseUMinSize
# Begin Custom Macros
OutDir=.\ReleaseUMinSize
# End Custom Macros

ALL : "$(OUTDIR)\LnkIconShim.dll" ".\LnkIconShim.tlb" ".\LnkIconShim.h" ".\LnkIconShim_i.c" ".\ReleaseUMinSize\regsvr32.trg"


CLEAN :
	-@erase "$(INTDIR)\LnkIconShim.obj"
	-@erase "$(INTDIR)\LnkIconShim.pch"
	-@erase "$(INTDIR)\LnkIconShim.res"
	-@erase "$(INTDIR)\LnkIconShlExt.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\LnkIconShim.dll"
	-@erase "$(OUTDIR)\LnkIconShim.exp"
	-@erase "$(OUTDIR)\LnkIconShim.map"
	-@erase ".\LnkIconShim.h"
	-@erase ".\LnkIconShim.tlb"
	-@erase ".\LnkIconShim_i.c"
	-@erase ".\ReleaseUMinSize\regsvr32.trg"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /O1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_USRDLL" /D "_UNICODE" /D "_ATL_DLL" /D "_ATL_MIN_CRT" /Fp"$(INTDIR)\LnkIconShim.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

MTL=midl.exe
MTL_PROJ=
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\LnkIconShim.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\LnkIconShim.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\LnkIconShim.pdb" /map:"$(INTDIR)\LnkIconShim.map" /def:".\LnkIconShim.def" /out:"$(OUTDIR)\LnkIconShim.dll" /implib:"$(OUTDIR)\LnkIconShim.lib" 
DEF_FILE= \
	".\LnkIconShim.def"
LINK32_OBJS= \
	"$(INTDIR)\LnkIconShim.obj" \
	"$(INTDIR)\LnkIconShlExt.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\LnkIconShim.res"

"$(OUTDIR)\LnkIconShim.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

OutDir=.\ReleaseUMinSize
TargetPath=.\ReleaseUMinSize\LnkIconShim.dll
InputPath=.\ReleaseUMinSize\LnkIconShim.dll
SOURCE="$(InputPath)"

"$(OUTDIR)\regsvr32.trg" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	regsvr32 /s /c "$(TargetPath)" 
	echo regsvr32 exec. time > "$(OutDir)\regsvr32.trg" 
<< 
	

!ELSEIF  "$(CFG)" == "LnkIconShim - Win32 Unicode Release MinDependency"

OUTDIR=.\ReleaseUMinDependency
INTDIR=.\ReleaseUMinDependency
# Begin Custom Macros
OutDir=.\ReleaseUMinDependency
# End Custom Macros

ALL : "$(OUTDIR)\LnkIconShim.dll" ".\LnkIconShim.tlb" ".\LnkIconShim.h" ".\LnkIconShim_i.c" ".\ReleaseUMinDependency\regsvr32.trg"


CLEAN :
	-@erase "$(INTDIR)\LnkIconShim.obj"
	-@erase "$(INTDIR)\LnkIconShim.pch"
	-@erase "$(INTDIR)\LnkIconShim.res"
	-@erase "$(INTDIR)\LnkIconShlExt.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\LnkIconShim.dll"
	-@erase "$(OUTDIR)\LnkIconShim.exp"
	-@erase "$(OUTDIR)\LnkIconShim.map"
	-@erase ".\LnkIconShim.h"
	-@erase ".\LnkIconShim.tlb"
	-@erase ".\LnkIconShim_i.c"
	-@erase ".\ReleaseUMinDependency\regsvr32.trg"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /O1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_USRDLL" /D "_UNICODE" /D "_CRT_SECURE_NO_WARNINGS" /D "_CRT_NON_CONFORMING_SWPRINTFS" /Fp"$(INTDIR)\LnkIconShim.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

MTL=midl.exe
MTL_PROJ=
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\LnkIconShim.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\LnkIconShim.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\LnkIconShim.pdb" /map:"$(INTDIR)\LnkIconShim.map" /def:".\LnkIconShim.def" /out:"$(OUTDIR)\LnkIconShim.dll" /implib:"$(OUTDIR)\LnkIconShim.lib" 
DEF_FILE= \
	".\LnkIconShim.def"
LINK32_OBJS= \
	"$(INTDIR)\LnkIconShim.obj" \
	"$(INTDIR)\LnkIconShlExt.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\LnkIconShim.res"

"$(OUTDIR)\LnkIconShim.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

OutDir=.\ReleaseUMinDependency
TargetPath=.\ReleaseUMinDependency\LnkIconShim.dll
InputPath=.\ReleaseUMinDependency\LnkIconShim.dll
SOURCE="$(InputPath)"

"$(OUTDIR)\regsvr32.trg" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	:regsvr32 /s /c "$(TargetPath)" 
	echo regsvr32 exec. time > "$(OutDir)\regsvr32.trg" 
<< 
	

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("LnkIconShim.dep")
!INCLUDE "LnkIconShim.dep"
!ELSE 
!MESSAGE Warning: cannot find "LnkIconShim.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "LnkIconShim - Win32 Debug" || "$(CFG)" == "LnkIconShim - Win32 Unicode Debug" || "$(CFG)" == "LnkIconShim - Win32 Release MinSize" || "$(CFG)" == "LnkIconShim - Win32 Release MinDependency" || "$(CFG)" == "LnkIconShim - Win32 Unicode Release MinSize" || "$(CFG)" == "LnkIconShim - Win32 Unicode Release MinDependency"
SOURCE=.\LnkIconShim.cpp

!IF  "$(CFG)" == "LnkIconShim - Win32 Debug"


"$(INTDIR)\LnkIconShim.obj"	"$(INTDIR)\LnkIconShim.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\LnkIconShim.pch" ".\LnkIconShim.h" ".\LnkIconShim_i.c"


!ELSEIF  "$(CFG)" == "LnkIconShim - Win32 Unicode Debug"


"$(INTDIR)\LnkIconShim.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\LnkIconShim.pch"


!ELSEIF  "$(CFG)" == "LnkIconShim - Win32 Release MinSize"


"$(INTDIR)\LnkIconShim.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\LnkIconShim.pch"


!ELSEIF  "$(CFG)" == "LnkIconShim - Win32 Release MinDependency"


"$(INTDIR)\LnkIconShim.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\LnkIconShim.pch"


!ELSEIF  "$(CFG)" == "LnkIconShim - Win32 Unicode Release MinSize"


"$(INTDIR)\LnkIconShim.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\LnkIconShim.pch"


!ELSEIF  "$(CFG)" == "LnkIconShim - Win32 Unicode Release MinDependency"


"$(INTDIR)\LnkIconShim.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\LnkIconShim.pch"


!ENDIF 

SOURCE=.\LnkIconShim.idl

!IF  "$(CFG)" == "LnkIconShim - Win32 Debug"

MTL_SWITCHES=/tlb ".\LnkIconShim.tlb" /h "LnkIconShim.h" /iid "LnkIconShim_i.c" /Oicf 

".\LnkIconShim.tlb"	".\LnkIconShim.h"	".\LnkIconShim_i.c" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "LnkIconShim - Win32 Unicode Debug"

MTL_SWITCHES=/tlb ".\LnkIconShim.tlb" /h "LnkIconShim.h" /iid "LnkIconShim_i.c" /Oicf 

".\LnkIconShim.tlb"	".\LnkIconShim.h"	".\LnkIconShim_i.c" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "LnkIconShim - Win32 Release MinSize"

MTL_SWITCHES=/tlb ".\LnkIconShim.tlb" /h "LnkIconShim.h" /iid "LnkIconShim_i.c" /Oicf 

".\LnkIconShim.tlb"	".\LnkIconShim.h"	".\LnkIconShim_i.c" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "LnkIconShim - Win32 Release MinDependency"

MTL_SWITCHES=/tlb ".\LnkIconShim.tlb" /h "LnkIconShim.h" /iid "LnkIconShim_i.c" /Oicf 

".\LnkIconShim.tlb"	".\LnkIconShim.h"	".\LnkIconShim_i.c" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "LnkIconShim - Win32 Unicode Release MinSize"

MTL_SWITCHES=/tlb ".\LnkIconShim.tlb" /h "LnkIconShim.h" /iid "LnkIconShim_i.c" /Oicf 

".\LnkIconShim.tlb"	".\LnkIconShim.h"	".\LnkIconShim_i.c" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "LnkIconShim - Win32 Unicode Release MinDependency"

MTL_SWITCHES=/tlb ".\LnkIconShim.tlb" /h "LnkIconShim.h" /iid "LnkIconShim_i.c" /Oicf 

".\LnkIconShim.tlb"	".\LnkIconShim.h"	".\LnkIconShim_i.c" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\LnkIconShim.rc

"$(INTDIR)\LnkIconShim.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


SOURCE=.\LnkIconShlExt.cpp

!IF  "$(CFG)" == "LnkIconShim - Win32 Debug"


"$(INTDIR)\LnkIconShlExt.obj"	"$(INTDIR)\LnkIconShlExt.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\LnkIconShim.pch" ".\LnkIconShim.h"


!ELSEIF  "$(CFG)" == "LnkIconShim - Win32 Unicode Debug"


"$(INTDIR)\LnkIconShlExt.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\LnkIconShim.pch"


!ELSEIF  "$(CFG)" == "LnkIconShim - Win32 Release MinSize"


"$(INTDIR)\LnkIconShlExt.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\LnkIconShim.pch"


!ELSEIF  "$(CFG)" == "LnkIconShim - Win32 Release MinDependency"


"$(INTDIR)\LnkIconShlExt.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\LnkIconShim.pch"


!ELSEIF  "$(CFG)" == "LnkIconShim - Win32 Unicode Release MinSize"


"$(INTDIR)\LnkIconShlExt.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\LnkIconShim.pch"


!ELSEIF  "$(CFG)" == "LnkIconShim - Win32 Unicode Release MinDependency"


"$(INTDIR)\LnkIconShlExt.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\LnkIconShim.pch"


!ENDIF 

SOURCE=.\StdAfx.cpp

!IF  "$(CFG)" == "LnkIconShim - Win32 Debug"

CPP_SWITCHES=/nologo /MTd /W3 /Gm /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\LnkIconShim.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\StdAfx.sbr"	"$(INTDIR)\LnkIconShim.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "LnkIconShim - Win32 Unicode Debug"

CPP_SWITCHES=/nologo /MTd /W3 /Gm /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_USRDLL" /D "_UNICODE" /Fp"$(INTDIR)\LnkIconShim.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\LnkIconShim.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "LnkIconShim - Win32 Release MinSize"

CPP_SWITCHES=/nologo /MT /W3 /O1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "_ATL_DLL" /D "_ATL_MIN_CRT" /Fp"$(INTDIR)\LnkIconShim.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\LnkIconShim.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "LnkIconShim - Win32 Release MinDependency"

CPP_SWITCHES=/nologo /MT /W3 /O1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "_ATL_STATIC_REGISTRY" /D "_ATL_MIN_CRT" /Fp"$(INTDIR)\LnkIconShim.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\LnkIconShim.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "LnkIconShim - Win32 Unicode Release MinSize"

CPP_SWITCHES=/nologo /MT /W3 /O1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_USRDLL" /D "_UNICODE" /D "_ATL_DLL" /D "_ATL_MIN_CRT" /Fp"$(INTDIR)\LnkIconShim.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\LnkIconShim.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "LnkIconShim - Win32 Unicode Release MinDependency"

CPP_SWITCHES=/nologo /MT /W3 /O1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_USRDLL" /D "_UNICODE" /D "_CRT_SECURE_NO_WARNINGS" /D "_CRT_NON_CONFORMING_SWPRINTFS" /Fp"$(INTDIR)\LnkIconShim.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\LnkIconShim.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 


!ENDIF 

