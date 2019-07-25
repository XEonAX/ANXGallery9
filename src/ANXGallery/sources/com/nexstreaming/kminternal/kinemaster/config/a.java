package com.nexstreaming.kminternal.kinemaster.config;

import android.content.Context;
import android.util.Log;
import com.nexstreaming.kminternal.nexvideoeditor.NexEditor;
import com.nexstreaming.kminternal.nexvideoeditor.NexEditor.EditorInitException;
import com.nexstreaming.kminternal.nexvideoeditor.NexImageLoader.d;
import java.io.File;

/* compiled from: KineMasterSingleTon */
public class a {
    private static a b;
    Context a;
    private NexEditor c;
    private EditorInitException d;
    private UnsatisfiedLinkError e;
    private Object f = new Object();

    public a(Context context) {
        this.a = context;
        b = this;
    }

    public static a a() {
        if (b == null) {
            Log.e("KineMasterSingleTon", "getApplicationInstance : Returning NULL!");
        }
        return b;
    }

    private void e() {
        if (this.c == null) {
            try {
                Log.d("KineMasterSingleTon", "Editor Instance Created");
                AnonymousClass1 r7 = new d() {
                    public String a(String str) {
                        return new File(EditorGlobal.i(), str).getAbsolutePath();
                    }
                };
                NexEditorDeviceProfile deviceProfile = NexEditorDeviceProfile.getDeviceProfile();
                NexEditor nexEditor = new NexEditor(this.a, null, EditorGlobal.d(), EditorGlobal.c(), r7, new int[]{2, deviceProfile.getGLDepthBufferBits(), 1, deviceProfile.getGLMultisample(), 3, deviceProfile.getNativeLogLevel(), 0});
                this.c = nexEditor;
                this.c.createProject();
            } catch (UnsatisfiedLinkError e2) {
                Log.e("KineMasterSingleTon", "UnsatisfiedLinkError!!!");
                this.e = e2;
            } catch (EditorInitException e3) {
                Log.e("KineMasterSingleTon", "EditorInitException!!!");
                this.d = e3;
            }
        }
    }

    public Context b() {
        return this.a;
    }

    public NexEditor c() {
        NexEditor nexEditor;
        synchronized (this.f) {
            if (this.c == null) {
                Log.d("KineMasterSingleTon", "getEditor : creating editor instance");
                e();
            }
            if (this.c == null) {
                Log.e("KineMasterSingleTon", "getEditor : editor instance is null");
            }
            nexEditor = this.c;
        }
        return nexEditor;
    }

    public void d() {
        if (this.c != null) {
            Log.d("KineMasterSingleTon", "releaseEditor : release editor instance");
            this.c.closeProject();
            this.c.i();
            this.c = null;
        }
    }
}
