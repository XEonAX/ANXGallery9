package com.miui.gallery.editor.photo.core.imports.mosaic;

import android.opengl.GLES20;
import com.miui.gallery.editor.photo.widgets.glview.GLFBOManager;
import com.miui.gallery.editor.photo.widgets.glview.shader.GLTextureShader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Stack;

class MosaicUndoManager {
    private final int mBitmapHeight;
    private final int mBitmapWidth;
    private final LinkedList<GLFBOManager> mBufferItems = new LinkedList<>();
    private CaptureListener mCaptureListener;
    private final LinkedList<MosaicOperationItem> mMosaicOperationItems = new LinkedList<>();
    private final Stack<GLFBOManager> mReuseBufferItem = new Stack<>();
    private final LinkedList<GLFBOManager> mRevokedBufferItems = new LinkedList<>();
    private final LinkedList<RevokedItem> mRevokedOperationItems = new LinkedList<>();
    private final int mViewHeight;
    private final int mViewWidth;

    interface CaptureListener {
        void onCapture();
    }

    static class RevokedItem {
        final MosaicGLEntity mosaicGLEntity;
        final PaintingItem paintingItem;

        RevokedItem(MosaicGLEntity mosaicGLEntity2, PaintingItem paintingItem2) {
            this.mosaicGLEntity = mosaicGLEntity2;
            this.paintingItem = paintingItem2;
        }
    }

    MosaicUndoManager(int i, int i2, int i3, int i4) {
        this.mBitmapWidth = i;
        this.mBitmapHeight = i2;
        this.mViewWidth = i3;
        this.mViewHeight = i4;
    }

    private void addNewOperationItem(PaintingItem paintingItem, MosaicGLEntity mosaicGLEntity) {
        MosaicOperationItem mosaicOperationItem = new MosaicOperationItem(mosaicGLEntity);
        mosaicOperationItem.add(paintingItem);
        this.mMosaicOperationItems.add(mosaicOperationItem);
    }

    private void clearRevokedItem() {
        this.mRevokedOperationItems.clear();
        while (!this.mRevokedBufferItems.isEmpty()) {
            this.mReuseBufferItem.push(this.mRevokedBufferItems.removeLast());
        }
    }

    public boolean canRevert() {
        return !this.mRevokedBufferItems.isEmpty() && !this.mRevokedOperationItems.isEmpty();
    }

    public boolean canRevoke() {
        return this.mBufferItems.size() > 1 && !this.mMosaicOperationItems.isEmpty();
    }

    public void capture(GLFBOManager gLFBOManager, GLTextureShader gLTextureShader) {
        if (this.mBufferItems.size() < 6) {
            GLFBOManager gLFBOManager2 = !this.mReuseBufferItem.isEmpty() ? (GLFBOManager) this.mReuseBufferItem.pop() : new GLFBOManager(this.mBitmapWidth, this.mBitmapHeight, this.mViewWidth, this.mViewHeight);
            gLFBOManager2.bind();
            GLES20.glClear(16640);
            gLTextureShader.drawFBO(gLFBOManager.getTextureId());
            gLFBOManager2.unBind();
            this.mBufferItems.add(gLFBOManager2);
        } else {
            GLFBOManager gLFBOManager3 = (GLFBOManager) this.mBufferItems.removeFirst();
            gLFBOManager3.bind();
            GLES20.glClear(16640);
            gLTextureShader.drawFBO(gLFBOManager.getTextureId());
            gLFBOManager3.unBind();
            this.mBufferItems.add(gLFBOManager3);
        }
        if (this.mCaptureListener != null) {
            this.mCaptureListener.onCapture();
        }
    }

    public void clearBuffer() {
        while (!this.mBufferItems.isEmpty()) {
            ((GLFBOManager) this.mBufferItems.removeLast()).clear();
        }
        while (!this.mRevokedBufferItems.isEmpty()) {
            ((GLFBOManager) this.mRevokedBufferItems.removeLast()).clear();
        }
        while (!this.mReuseBufferItem.isEmpty()) {
            ((GLFBOManager) this.mReuseBufferItem.pop()).clear();
        }
    }

    public GLFBOManager doRevert() {
        if (!canRevert()) {
            return null;
        }
        RevokedItem revokedItem = (RevokedItem) this.mRevokedOperationItems.removeLast();
        record(revokedItem.paintingItem, revokedItem.mosaicGLEntity, false);
        GLFBOManager gLFBOManager = (GLFBOManager) this.mRevokedBufferItems.removeLast();
        this.mBufferItems.add(gLFBOManager);
        return gLFBOManager;
    }

    public GLFBOManager doRevoke() {
        if (!canRevoke()) {
            return null;
        }
        MosaicOperationItem mosaicOperationItem = (MosaicOperationItem) this.mMosaicOperationItems.getLast();
        this.mRevokedOperationItems.add(new RevokedItem(mosaicOperationItem.mosaicGLEntity, mosaicOperationItem.removeLast()));
        if (mosaicOperationItem.isEmpty()) {
            this.mMosaicOperationItems.removeLast();
        }
        this.mRevokedBufferItems.add(this.mBufferItems.removeLast());
        if (this.mBufferItems.isEmpty()) {
            return null;
        }
        return (GLFBOManager) this.mBufferItems.getLast();
    }

    public LinkedList<MosaicOperationItem> exportRecord() {
        return this.mMosaicOperationItems;
    }

    public List<String> generateSample() {
        ArrayList arrayList = new ArrayList();
        Iterator it = this.mMosaicOperationItems.iterator();
        while (it.hasNext()) {
            arrayList.add(((MosaicOperationItem) it.next()).mosaicGLEntity.name);
        }
        return arrayList;
    }

    public boolean isEmpty() {
        if (this.mMosaicOperationItems.isEmpty()) {
            return true;
        }
        if (this.mMosaicOperationItems.size() == 1) {
            return ((MosaicOperationItem) this.mMosaicOperationItems.getLast()).isEmpty();
        }
        return false;
    }

    public void record(PaintingItem paintingItem, MosaicGLEntity mosaicGLEntity, boolean z) {
        if (z) {
            clearRevokedItem();
        }
        if (this.mMosaicOperationItems.isEmpty()) {
            addNewOperationItem(paintingItem, mosaicGLEntity);
            return;
        }
        MosaicOperationItem mosaicOperationItem = (MosaicOperationItem) this.mMosaicOperationItems.getLast();
        if (mosaicOperationItem.mosaicGLEntity == mosaicGLEntity) {
            mosaicOperationItem.add(paintingItem);
        } else {
            addNewOperationItem(paintingItem, mosaicGLEntity);
        }
    }

    public void setCaptureListener(CaptureListener captureListener) {
        this.mCaptureListener = captureListener;
    }
}
