// LnkIconShlExt.cpp : Implementation of CLnkIconShlExt
// the actual magic happens here, particularly in checkPidl() 
//  procedure

#include "stdafx.h"
#include "resource.h"
#include "LnkIconShim.h"
#include "LnkIconShlExt.h"

// searching for one particular chain of guids..
// (in a bit more generic way)
#define CPL_PATH_ASCII_OFFSET      0x0A
#define CPL_PATH_UNICODE_OFFSET    0x16
BOOL checkPidl(PIDLIST_ABSOLUTE pidl)
{
	// no pidlist is valid - can contain no exploit
	if(!pidl) return TRUE;

	SHITEMID *shi = (SHITEMID *)pidl;

	// root (desktop?) guid
	BYTE guid1[16] =  {
		0xE0, 0x4F, 0xD0, 0x20, 0xEA, 0x3A, 0x69, 0x10,
		0xA2, 0xD8, 0x08, 0x00, 0x2B, 0x30, 0x30, 0x9D 
	};
	
	// control panel guid
	BYTE guid2[16] = {
		0x20, 0x20, 0xEC, 0x21, 0xEA, 0x3A, 0x69, 0x10,
		0xA2, 0xDD, 0x08, 0x00, 0x2B, 0x30, 0x30, 0x9D 
	};

	TCHAR tcSysDir[MAX_PATH];
	UINT iSysDirLen = 0;
	for(int stage=0;shi->cb;shi = (SHITEMID*)((BYTE*)shi + shi->cb), stage++) {
		switch(stage) {
		case 0:
			if(shi->cb < 0x14) return TRUE;
			if(memcmp(&shi->abID + 2, guid1, 16)) return TRUE;
			break;
		case 1:
			if(shi->cb < 0x14) return TRUE;
			if(memcmp(&shi->abID + 2, guid2, 16)) return TRUE;
			break;
		case 2:
			// check if this could be cpl applet link
			if(shi->abID[0] == 0x70 || shi->abID[0] == 0x71) return TRUE;

			// not enough space to fit single path character in ascii
			// (shorter) mode
			if(shi->cb < (CPL_PATH_ASCII_OFFSET + 2)) return TRUE;

			iSysDirLen = GetSystemDirectory(tcSysDir, MAX_PATH);
		
			// something went wrong, we cannot check the link, so 
			// assume it's bad
			if(!iSysDirLen) return FALSE;

			// sys dir path length is longer than the provided buffer
			if(iSysDirLen > MAX_PATH) iSysDirLen = MAX_PATH;

			CharLowerBuff(tcSysDir, iSysDirLen);

			// ASCII path in SHITEM?
			if(shi->abID[CPL_PATH_ASCII_OFFSET]) {
				BYTE *pbPath = (BYTE*)(&shi->abID + CPL_PATH_ASCII_OFFSET);
				UINT iSize = shi->cb - CPL_PATH_ASCII_OFFSET - 2;
				
				// string shorter than sysdirlen cannot contain sysdir path
				if(iSize < iSysDirLen) return FALSE;

				for(UINT i=0;i<iSysDirLen;i++) {
					if((BYTE)CharLower((LPTSTR)pbPath[i]) != tcSysDir[i]) return FALSE;
				}
			} else {
				WORD *pwPath = (WORD*)(&shi->abID + CPL_PATH_UNICODE_OFFSET);
				UINT iSize = shi->cb - CPL_PATH_UNICODE_OFFSET - 2;

				// string shorter than sysdirlen cannot contain sysdir path
				// (each char is two bytes)
				if((iSize/2) < iSysDirLen) return FALSE;

				for(UINT i=0;i<iSysDirLen;i++) {
					if((WORD)CharLower((LPTSTR)pwPath[i]) != tcSysDir[i]) return FALSE;
				}

			}
			break;
		}
	}
	return TRUE;
}

/////////////////////////////////////////////////////////////////////////////
// CLnkIconShlExt
STDMETHODIMP CLnkIconShlExt::GetIconLocation (
    UINT uFlags,  LPTSTR szIconFile, UINT cchMax,
    int* piIndex, UINT* pwFlags )
{
	IShellLink* psl; 

	// see if the link has a PIDL part
	HRESULT hres = CoCreateInstance(CLSID_ShellLink, NULL, CLSCTX_INPROC_SERVER, 
                            IID_IShellLink, (LPVOID*)&psl);

    if (SUCCEEDED(hres)) 
    { 
      IPersistFile* ppf; 
 
        // Get a pointer to the IPersistFile interface. 
        hres = psl->QueryInterface(IID_IPersistFile, (void**)&ppf); 
        if (SUCCEEDED(hres)) 
        { 
            // Load the shortcut. 
            hres = ppf->Load(m_szFilename, STGM_READ); 
            if (SUCCEEDED(hres)) 
            { 
				PIDLIST_ABSOLUTE pidl;

				// if PIDL was successfully obtained, 
				//  check its validnes (or - non-exploitedness;)
				hres = psl->GetIDList(&pidl);
				if(SUCCEEDED(hres)) {
					m_bHasValidPidl = checkPidl(pidl);

					// if pidl passed the filter, try to extract icon in the normal way
					if(m_bHasValidPidl) {
						IExtractIcon* pei;
						hres = psl->QueryInterface(IID_IExtractIcon, (void**)&pei);
						if(SUCCEEDED(hres)) {
							hres = pei->GetIconLocation(uFlags, szIconFile, cchMax, piIndex, pwFlags);
							
							// store the shell extraction result (for possible future use;)
							m_bShellOk = SUCCEEDED(hres);
							pei->Release();
						}
					}
				}
			}
			ppf->Release();
		}
		psl->Release();
	}

	// if something suspicous, set my own 'blocked' icon
	if(!m_bHasValidPidl) {

		// The icon is in this DLL, so get the full path to the DLL, which
		// we'll return through the szIconFile parameter.
		TCHAR szModulePath[MAX_PATH];

		GetModuleFileName ( _Module.GetResourceInstance(), szModulePath, MAX_PATH );
		lstrcpyn ( szIconFile, szModulePath, cchMax );

		if(piIndex) {
			*piIndex = 0;
		}

		// pwFlags is set to zero to get the default behavior from Explorer.  
		// if has pidl, shell code wasn't run
		*pwFlags = 0;
	} else {
	    return hres;
	}

	return S_OK;
}

STDMETHODIMP CLnkIconShlExt::Extract (
    LPCTSTR pszFile, UINT nIconIndex, HICON* phiconLarge, HICON* phiconSmall,
    UINT nIconSize )
{
	// not an approved link, don't extract anything
	if(!m_bHasValidPidl) return S_FALSE;

	// otherwise call the original shell handler to do the job
	IShellLink* psl; 
	HRESULT hres = CoCreateInstance(CLSID_ShellLink, NULL, CLSCTX_INPROC_SERVER, 
                            IID_IShellLink, (LPVOID*)&psl);
    if (SUCCEEDED(hres)) 
    { 
      IPersistFile* ppf; 
 
        // Get a pointer to the IPersistFile interface. 
        hres = psl->QueryInterface(IID_IPersistFile, (void**)&ppf); 
		
        if (SUCCEEDED(hres)) 
        { 
            // Load the shortcut. 
            hres = ppf->Load(m_szFilename, STGM_READ); 

            if (SUCCEEDED(hres)) 
            { 
				IExtractIcon* pei;
				hres = psl->QueryInterface(IID_IExtractIcon, (void**)&pei);
				if(SUCCEEDED(hres)) {
					hres = pei->Extract(pszFile, nIconIndex, phiconLarge, phiconSmall, nIconSize);
					pei->Release();
				}
			}
			ppf->Release();
		}
		psl->Release();
	}

	return hres;
}
