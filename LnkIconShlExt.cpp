// LnkIconShlExt.cpp : Implementation of CLnkIconShlExt

#include "stdafx.h"
#include "resource.h"
#include "LnkIconShim.h"
#include "LnkIconShlExt.h"

// searching for one particular chain of guids..
// (in a bit more generic way)
BOOL checkPidl(PIDLIST_ABSOLUTE pidl)
{
	// no pidlist is valid - can contain no exploit
	if(!pidl) return TRUE;

	SHITEMID *shi = (SHITEMID *)pidl;

	BYTE guid1[16] =  {
		0xE0, 0x4F, 0xD0, 0x20, 0xEA, 0x3A, 0x69, 0x10,
		0xA2, 0xD8, 0x08, 0x00, 0x2B, 0x30, 0x30, 0x9D 
	};
	
	BYTE guid2[16] = {
		0x20, 0x20, 0xEC, 0x21, 0xEA, 0x3A, 0x69, 0x10,
		0xA2, 0xDD, 0x08, 0x00, 0x2B, 0x30, 0x30, 0x9D 
	};

	for(int stage=0;shi->cb;shi = (SHITEMID*)((BYTE*)shi + shi->cb), stage++) {
		switch(stage) {
		case 0:
			if(shi->cb != 0x14) return TRUE;
			if(memcmp(&shi->abID + 2, guid1, 16)) return TRUE;
			break;
		case 1:
			if(shi->cb != 0x14) return TRUE;
			if(memcmp(&shi->abID + 2, guid2, 16)) return TRUE;
			break;
		case 2:
			// for now, block all .cpl shortcut icons
			return FALSE;
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

							if(SUCCEEDED(hres)) {
								m_bShellOk = TRUE;
							}
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
	if(!m_bHasValidPidl || !m_bShellOk) {

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
	}

    return S_OK;
}

STDMETHODIMP CLnkIconShlExt::Extract (
    LPCTSTR pszFile, UINT nIconIndex, HICON* phiconLarge, HICON* phiconSmall,
    UINT nIconSize )
{
	// not an approved link, don't extract anything
	if(!m_bHasValidPidl) return S_FALSE;

//	TCHAR buf[1000];
//	_stprintf(buf, _T("Extract( %s, %d, %d )"), pszFile, nIconIndex, nIconSize);
//	OutputDebugString(buf);

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
