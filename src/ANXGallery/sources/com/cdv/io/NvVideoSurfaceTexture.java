package com.cdv.io;

import android.graphics.SurfaceTexture;
import android.graphics.SurfaceTexture.OnFrameAvailableListener;

public class NvVideoSurfaceTexture implements OnFrameAvailableListener {
    private final int m_texId;

    public NvVideoSurfaceTexture(int i) {
        this.m_texId = i;
    }

    private static native void notifyFrameAvailable(int i);

    public void onFrameAvailable(SurfaceTexture surfaceTexture) {
        notifyFrameAvailable(this.m_texId);
    }
}
