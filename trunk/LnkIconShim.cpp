// LnkIconShim.cpp : Implementation of DLL Exports.

#include "stdafx.h"
#include "resource.h"
#include <initguid.h>
#include "LnkIconShim.h"

#include "LnkIconShim_i.c"
#include "LnkIconShlExt.h"

CComModule _Module;

BEGIN_OBJECT_MAP(ObjectMap)
OBJECT_ENTRY(CLSID_LnkIconShlExt, CLnkIconShlExt)
END_OBJECT_MAP()

/////////////////////////////////////////////////////////////////////////////
// DLL Entry Point

extern "C"
BOOL WINAPI DllMain(HINSTANCE hInstance, DWORD dwReason, LPVOID /*lpReserved*/)
{
    if (dwReason == DLL_PROCESS_ATTACH)
    {
        _Module.Init(ObjectMap, hInstance, &LIBID_TXTFILEICONSLib);
        DisableThreadLibraryCalls(hInstance);
    }
    else if (dwReason == DLL_PROCESS_DETACH)
        _Module.Term();
    return TRUE;    // ok
}

/////////////////////////////////////////////////////////////////////////////
// Used to determine whether the DLL can be unloaded by OLE

STDAPI DllCanUnloadNow()
{
    return (_Module.GetLockCount()==0) ? S_OK : S_FALSE;
}

/////////////////////////////////////////////////////////////////////////////
// Returns a class factory to create an object of the requested type

STDAPI DllGetClassObject(REFCLSID rclsid, REFIID riid, LPVOID* ppv)
{
    return _Module.GetClassObject(rclsid, riid, ppv);
}

/////////////////////////////////////////////////////////////////////////////
// DllRegisterServer - Adds entries to the system registry

STDAPI DllRegisterServer()
{
CRegKey key;
LONG lRet;

    // On NT/2K, put our extension in the "approved" list.
    if ( 0 == (GetVersion() & 0x80000000) )
        {
        lRet = key.Open ( HKEY_LOCAL_MACHINE, 
                          _T("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Shell Extensions\\Approved"),
                          KEY_SET_VALUE );

        if ( ERROR_SUCCESS == lRet )
            {
            lRet = key.SetStringValue ( _T("Link file icon shim"), 
                                  _T("{DF4F5AE4-E795-4C12-BC26-7726C27F71AE}") );

            key.Close();
            }

        if ( ERROR_SUCCESS != lRet )
            return HRESULT_FROM_WIN32(lRet);
        }

    // registers object, typelib and all interfaces in typelib
    return _Module.RegisterServer(false);
}

/////////////////////////////////////////////////////////////////////////////
// DllUnregisterServer - Removes entries from the system registry

STDAPI DllUnregisterServer()
{
CRegKey key;
LONG lRet;

    // On NT/2K, remove our extension from the "approved" list.
    if ( 0 == (GetVersion() & 0x80000000) )
        {
        lRet = key.Open ( HKEY_LOCAL_MACHINE, 
                          _T("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Shell Extensions\\Approved"),
                          KEY_SET_VALUE );

        if ( ERROR_SUCCESS == lRet )
            {
            key.DeleteValue ( _T("{DF4F5AE4-E795-4C12-BC26-7726C27F71AE}") );
            key.Close();
            }
        }

    return _Module.UnregisterServer(false);
}
