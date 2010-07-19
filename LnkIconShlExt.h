// LnkIconShlExt.h : Declaration of the CLnkIconShlExt

#ifndef __TXTICONSHLEXT_H_
#define __TXTICONSHLEXT_H_

/////////////////////////////////////////////////////////////////////////////
// CLnkIconShlExt

class ATL_NO_VTABLE CLnkIconShlExt :
    public CComObjectRootEx<CComSingleThreadModel>,
    public CComCoClass<CLnkIconShlExt, &CLSID_LnkIconShlExt>,
    public IPersistFile,
    public IExtractIcon
{
public:
    CLnkIconShlExt() : m_qwFileSize(0), m_bHasValidPidl(FALSE), m_bShellOk(FALSE) { }

    BEGIN_COM_MAP(CLnkIconShlExt)
        COM_INTERFACE_ENTRY(IPersistFile)
        COM_INTERFACE_ENTRY(IExtractIcon)
    END_COM_MAP()

    DECLARE_REGISTRY_RESOURCEID(IDR_TXTICONSHLEXT)

public:
    // IPersistFile
    STDMETHODIMP GetClassID( CLSID* ) { return E_NOTIMPL; }
    STDMETHODIMP IsDirty() { return E_NOTIMPL; }
    STDMETHODIMP Save( LPCOLESTR, BOOL ) { return E_NOTIMPL; }
    STDMETHODIMP SaveCompleted( LPCOLESTR ) { return E_NOTIMPL; }
    STDMETHODIMP GetCurFile( LPOLESTR* ) { return E_NOTIMPL; }

    STDMETHODIMP Load( LPCOLESTR wszFile, DWORD )
        { 
        USES_CONVERSION;
        lstrcpyn ( m_szFilename, W2CT(wszFile), MAX_PATH );
        return S_OK;
        }

    // IExtractIcon
    STDMETHODIMP GetIconLocation( UINT uFlags, LPTSTR szIconFile, UINT cchMax,
                                  int* piIndex, UINT* pwFlags );
    STDMETHODIMP Extract( LPCTSTR pszFile, UINT nIconIndex, HICON* phiconLarge,
                          HICON* phiconSmall, UINT nIconSize );

protected:
    TCHAR     m_szFilename[MAX_PATH];   // Full path to the file in question.
    DWORDLONG m_qwFileSize;             // Used by extraction method 2.
	BOOL m_bHasValidPidl;					// dealing with link file with pidl
	BOOL m_bShellOk;					// shell version of GetIconLocation went all ok
};

#endif //__TXTICONSHLEXT_H_
