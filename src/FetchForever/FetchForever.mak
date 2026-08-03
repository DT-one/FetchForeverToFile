# Microsoft Developer Studio Generated NMAKE File, Based on FetchForever.dsp
!IF "$(CFG)" == ""
CFG=FetchForever - Win32 Debug
!MESSAGE No configuration specified. Defaulting to FetchForever - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "FetchForever - Win32 Release" && "$(CFG)" != "FetchForever - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "FetchForever.mak" CFG="FetchForever - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "FetchForever - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "FetchForever - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "FetchForever - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

ALL : "$(OUTDIR)\FetchForever.exe"


CLEAN :
	-@erase "$(INTDIR)\asciiPlot.obj"
	-@erase "$(INTDIR)\FetchForever.obj"
	-@erase "$(INTDIR)\GenericFetchForever.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\FetchForever.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /ML /W3 /GX /O2 /I "..\common" /I "..\..\common" /I "$(VXIPNPPATH)\winnt\include" /I "$(VXIPNPPATH)\win95\include" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /Fp"$(INTDIR)\FetchForever.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\FetchForever.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib niscope.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\FetchForever.pdb" /machine:I386 /out:"$(OUTDIR)\FetchForever.exe" /libpath:"..\..\common" /libpath:"$(VXIPNPPATH)\winnt\lib\msc" /libpath:"$(VXIPNPPATH)\win95\lib\msc" 
LINK32_OBJS= \
	"$(INTDIR)\FetchForever.obj" \
	"$(INTDIR)\GenericFetchForever.obj" \
	"$(INTDIR)\asciiPlot.obj"

"$(OUTDIR)\FetchForever.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "FetchForever - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

ALL : "$(OUTDIR)\FetchForever.exe"


CLEAN :
	-@erase "$(INTDIR)\asciiPlot.obj"
	-@erase "$(INTDIR)\FetchForever.obj"
	-@erase "$(INTDIR)\GenericFetchForever.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\FetchForever.exe"
	-@erase "$(OUTDIR)\FetchForever.ilk"
	-@erase "$(OUTDIR)\FetchForever.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MLd /W3 /GX /ZI /Od /I "..\common" /I "..\..\common" /I "$(VXIPNPPATH)\winnt\include" /I "$(VXIPNPPATH)\win95\include" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /Fp"$(INTDIR)\FetchForever.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\FetchForever.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=niscope.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\FetchForever.pdb" /debug /machine:I386 /out:"$(OUTDIR)\FetchForever.exe" /pdbtype:sept /libpath:"..\..\..\..\..\..\include\lib\msc" /libpath:"..\..\common" /libpath:"$(VXIPNPPATH)\winnt\lib\msc" /libpath:"$(VXIPNPPATH)\win95\lib\msc" 
LINK32_OBJS= \
	"$(INTDIR)\FetchForever.obj" \
	"$(INTDIR)\GenericFetchForever.obj" \
	"$(INTDIR)\asciiPlot.obj"

"$(OUTDIR)\FetchForever.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

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


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("FetchForever.dep")
!INCLUDE "FetchForever.dep"
!ELSE 
!MESSAGE Warning: cannot find "FetchForever.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "FetchForever - Win32 Release" || "$(CFG)" == "FetchForever - Win32 Debug"
SOURCE=..\common\asciiPlot.c

"$(INTDIR)\asciiPlot.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\FetchForever.c

"$(INTDIR)\FetchForever.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=..\common\GenericFetchForever.c

"$(INTDIR)\GenericFetchForever.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)



!ENDIF 

