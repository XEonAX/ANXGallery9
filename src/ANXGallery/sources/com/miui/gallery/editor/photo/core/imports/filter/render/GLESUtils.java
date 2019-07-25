package com.miui.gallery.editor.photo.core.imports.filter.render;

import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.egl.EGLDisplay;

public class GLESUtils {
    public static int getMaxTextureSize() {
        EGL10 egl10 = (EGL10) EGLContext.getEGL();
        EGLDisplay eglGetDisplay = egl10.eglGetDisplay(EGL10.EGL_DEFAULT_DISPLAY);
        egl10.eglInitialize(eglGetDisplay, new int[2]);
        int[] iArr = new int[1];
        egl10.eglGetConfigs(eglGetDisplay, null, 0, iArr);
        EGLConfig[] eGLConfigArr = new EGLConfig[iArr[0]];
        egl10.eglGetConfigs(eglGetDisplay, eGLConfigArr, iArr[0], iArr);
        int[] iArr2 = new int[1];
        int i = 0;
        for (int i2 = 0; i2 < iArr[0]; i2++) {
            egl10.eglGetConfigAttrib(eglGetDisplay, eGLConfigArr[i2], 12332, iArr2);
            if (i < iArr2[0]) {
                i = iArr2[0];
            }
        }
        egl10.eglTerminate(eglGetDisplay);
        return Math.max(i, 2048);
    }
}
