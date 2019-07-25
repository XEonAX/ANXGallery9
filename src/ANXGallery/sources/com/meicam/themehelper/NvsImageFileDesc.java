package com.meicam.themehelper;

import android.graphics.RectF;

public class NvsImageFileDesc {
    public boolean alternative = false;
    public RectF faceRect = null;
    public long fileLastTime = -1;
    public String filePath = null;
    public boolean hasFace = false;
    public float imgRatio = 0.0f;
    public boolean isCover = false;
    public boolean isLargeImg = false;
    public float score = 0.0f;
    public boolean show = false;

    public NvsImageFileDesc copy() {
        NvsImageFileDesc nvsImageFileDesc = new NvsImageFileDesc();
        nvsImageFileDesc.hasFace = this.hasFace;
        nvsImageFileDesc.isCover = this.isCover;
        nvsImageFileDesc.show = this.show;
        nvsImageFileDesc.alternative = this.alternative;
        nvsImageFileDesc.score = this.score;
        nvsImageFileDesc.fileLastTime = this.fileLastTime;
        nvsImageFileDesc.filePath = this.filePath;
        nvsImageFileDesc.imgRatio = this.imgRatio;
        nvsImageFileDesc.isLargeImg = this.isLargeImg;
        if (this.faceRect != null) {
            nvsImageFileDesc.faceRect = new RectF();
            nvsImageFileDesc.faceRect.left = this.faceRect.left;
            nvsImageFileDesc.faceRect.top = this.faceRect.top;
            nvsImageFileDesc.faceRect.right = this.faceRect.right;
            nvsImageFileDesc.faceRect.bottom = this.faceRect.bottom;
        }
        return nvsImageFileDesc;
    }
}
