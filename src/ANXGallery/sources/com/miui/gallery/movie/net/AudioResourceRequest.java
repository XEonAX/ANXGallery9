package com.miui.gallery.movie.net;

import com.miui.gallery.movie.entity.AudioResource;
import com.miui.gallery.movie.entity.MovieResource;

public class AudioResourceRequest extends LocalResourceRequest {
    /* access modifiers changed from: protected */
    public long getParentId() {
        return 10142147245244480L;
    }

    /* access modifiers changed from: protected */
    public MovieResource newLocalResource() {
        return new AudioResource();
    }
}
