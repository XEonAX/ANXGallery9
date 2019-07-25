package com.nexstreaming.nexeditorsdk;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.util.Log;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.nexstreaming.app.common.nexasset.overlay.AwakeAsset;
import com.nexstreaming.app.common.nexasset.overlay.OverlayAsset;
import com.nexstreaming.app.common.nexasset.overlay.OverlayMotion;
import com.nexstreaming.kminternal.kinemaster.config.EditorGlobal;
import com.nexstreaming.kminternal.nexvideoeditor.LayerRenderer;
import com.nexstreaming.kminternal.nexvideoeditor.LayerRenderer.RenderTarget;
import com.nexstreaming.kminternal.nexvideoeditor.b;
import com.nexstreaming.nexeditorsdk.exception.ClipIsNotVideoException;
import com.nexstreaming.nexeditorsdk.exception.InvalidRangeException;
import com.nexstreaming.nexeditorsdk.exception.nexSDKException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.xmlpull.v1.XmlPullParserException;

public final class nexOverlayItem implements Cloneable {
    public static final int AnchorPoint_LeftBottom = 6;
    public static final int AnchorPoint_LeftMiddle = 3;
    public static final int AnchorPoint_LeftTop = 0;
    public static final int AnchorPoint_MiddleBottom = 7;
    public static final int AnchorPoint_MiddleMiddle = 4;
    public static final int AnchorPoint_MiddleTop = 1;
    public static final int AnchorPoint_RightBottom = 8;
    public static final int AnchorPoint_RightMiddle = 5;
    public static final int AnchorPoint_RightTop = 2;
    private static final String TAG = "nexOverlayItem";
    private static int handleTouchZonePxSize = 36;
    private static int iconSize = 24;
    public static final int kOutLine_Pos_LeftBottom = 3;
    public static final int kOutLine_Pos_LeftTop = 1;
    public static final int kOutLine_Pos_RightBottom = 4;
    public static final int kOutLine_Pos_RightTop = 2;
    private static int marchingAnts_dashSize = 10;
    private static int marchingAnts_width = 4;
    private static Bitmap[] outLineIcon = null;
    private static int sLastId = 1;
    private static Bitmap solidBlackBitmap;
    private static boolean solidOutlen;
    private static Bitmap solidWhiteBitmap;
    private int anchorPoint;
    private int anchorPointX;
    private int anchorPointY;
    private int animateResourceId;
    private transient AwakeAsset awakeAsset;
    boolean bApplayLayerExpression;
    private OverlayMotion cacheMotion;
    private int lastAnchorPoint;
    private int lastLayerHeight;
    private int lastLayerWidth;
    private Set<nexAnimate> mActiveAnimateList;
    float mAlpha;
    List<nexAnimate> mAniList;
    private float mAnimateLastAlpha;
    private float mAnimateLastRotateDegreeX;
    private float mAnimateLastRotateDegreeY;
    private float mAnimateLastRotateDegreeZ;
    private float mAnimateLastScaledX;
    private float mAnimateLastScaledY;
    private float mAnimateLastScaledZ;
    private float mAnimateTranslateXpos;
    private float mAnimateTranslateYpos;
    private float mAnimateTranslateZpos;
    private boolean mAudioOnOff;
    private int mBrightness;
    private ChromaKey mChromaKey;
    private nexColorEffect mColorEffect;
    private int mContrast;
    int mEndTime;
    private int mFlipMode;
    private int mId;
    /* access modifiers changed from: private */
    public nexOverlayKineMasterExpression mLayerExpression;
    private int mLayerExpressionDuration;
    /* access modifiers changed from: private */
    public Mask mMask;
    private Rect mMaskRect;
    /* access modifiers changed from: private */
    public nexOverlayFilter mOverLayFilter;
    /* access modifiers changed from: private */
    public nexOverlayImage mOverLayImage;
    private boolean mOverlayTitle;
    float mRotateDegreeX;
    float mRotateDegreeY;
    float mRotateDegreeZ;
    private int mSaturation;
    float mScaledX;
    float mScaledY;
    float mScaledZ;
    private int mSpeedControl;
    int mStartTime;
    private int mTime;
    private int mTrimEndDuration;
    private int mTrimStartDuration;
    private boolean mUpdated;
    int mVideoEngineId;
    private int mVolume;
    float mX;
    float mY;
    float mZ;
    private int mZOrder;
    private boolean relationCoordinates;
    private Matrix scratchMatrix;
    private float[] scratchPoint;
    private boolean showItem;
    private boolean showOutLien;

    public class BoundInfo {
        private float angleX;
        private float angleY;
        /* access modifiers changed from: private */
        public float angleZ;
        private Rect drawPosition;
        private int height;
        private Rect mask;
        private boolean maskOn;
        /* access modifiers changed from: private */
        public float scaleX;
        /* access modifiers changed from: private */
        public float scaleY;
        private int time;
        private int width;
        /* access modifiers changed from: private */
        public float x;
        /* access modifiers changed from: private */
        public float y;

        private BoundInfo() {
        }

        private BoundInfo(int i) {
            this.mask = new Rect();
            this.time = i;
            this.scaleX = nexOverlayItem.this.mScaledX;
            this.scaleY = nexOverlayItem.this.mScaledY;
            int[] access$1000 = nexOverlayItem.this.getRealPositions(false);
            this.x = (float) access$1000[0];
            this.y = (float) access$1000[1];
            this.angleX = nexOverlayItem.this.mRotateDegreeX;
            this.angleY = nexOverlayItem.this.mRotateDegreeY;
            this.angleZ = nexOverlayItem.this.mRotateDegreeZ;
            if (nexOverlayItem.this.mOverLayImage != null) {
                this.width = nexOverlayItem.this.mOverLayImage.getWidth();
                this.height = nexOverlayItem.this.mOverLayImage.getHeight();
                this.drawPosition = nexOverlayItem.getDrawBitmapPosition(nexOverlayItem.this.mOverLayImage.getAnchorPoint(), this.width, this.height);
            } else {
                this.width = nexOverlayItem.this.mOverLayFilter.getWidth();
                this.height = nexOverlayItem.this.mOverLayFilter.getHeight();
                this.drawPosition = new Rect((-this.width) / 2, (-this.height) / 2, this.width / 2, this.height / 2);
            }
            this.maskOn = false;
            if (nexOverlayItem.this.mMask != null && nexOverlayItem.this.mMask.onOff) {
                nexOverlayItem.this.mMask.getPosition(this.mask);
            }
            if (nexOverlayItem.this.mAniList != null) {
                for (nexAnimate nexanimate : nexOverlayItem.this.mAniList) {
                    int i2 = this.time - nexOverlayItem.this.mStartTime;
                    if (nexanimate.mStartTime <= i2 && nexanimate.getEndTime() > i2) {
                        if (nexanimate instanceof Move) {
                            if (nexOverlayItem.this.mLayerExpression.getID() == 0) {
                                this.x += nexanimate.getTranslatePosition(i2, 1);
                                this.y += nexanimate.getTranslatePosition(i2, 2);
                            }
                        } else if (nexanimate instanceof Rotate) {
                            if (nexOverlayItem.this.mLayerExpression.getID() == 0) {
                                this.angleX = nexanimate.getAngleDegree(i2, nexOverlayItem.this.mRotateDegreeX, 1);
                                this.angleY = nexanimate.getAngleDegree(i2, nexOverlayItem.this.mRotateDegreeY, 2);
                                this.angleZ = nexanimate.getAngleDegree(i2, nexOverlayItem.this.mRotateDegreeZ, 3);
                            }
                        } else if ((nexanimate instanceof Scale) && nexOverlayItem.this.mLayerExpression.getID() == 0) {
                            this.scaleX = nexanimate.getScaledRatio(i2, nexOverlayItem.this.mScaledX, 1);
                            this.scaleY = nexanimate.getScaledRatio(i2, nexOverlayItem.this.mScaledY, 2);
                        }
                    }
                }
            }
        }

        public float getAngle() {
            return this.angleZ;
        }

        public float getAngleX() {
            return this.angleX;
        }

        public float getAngleY() {
            return this.angleY;
        }

        public void getDrawBound(Rect rect) {
            rect.set(this.drawPosition.left, this.drawPosition.top, this.drawPosition.right, this.drawPosition.bottom);
        }

        public int getHeight() {
            return this.height;
        }

        public void getMaskBound(Rect rect) {
            rect.set(this.mask.left, this.mask.top, this.mask.right, this.mask.bottom);
        }

        public boolean getMaskState() {
            return this.maskOn;
        }

        public float getScaleX() {
            return this.scaleX;
        }

        public float getScaleY() {
            return this.scaleY;
        }

        public int getTime() {
            return this.time;
        }

        public float getTranslateX() {
            return this.x;
        }

        public float getTranslateY() {
            return this.y;
        }

        public int getWidth() {
            return this.width;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("BoundInfo{scaleX=");
            sb.append(this.scaleX);
            sb.append(", scaleY=");
            sb.append(this.scaleY);
            sb.append(", x=");
            sb.append(this.x);
            sb.append(", y=");
            sb.append(this.y);
            sb.append(", angleX=");
            sb.append(this.angleX);
            sb.append(", angleY=");
            sb.append(this.angleY);
            sb.append(", angleZ=");
            sb.append(this.angleZ);
            sb.append(", width=");
            sb.append(this.width);
            sb.append(", height=");
            sb.append(this.height);
            sb.append(", time=");
            sb.append(this.time);
            sb.append(", maskOn=");
            sb.append(this.maskOn);
            sb.append(", mask=");
            sb.append(this.mask);
            sb.append(", drawPosition=");
            sb.append(this.drawPosition);
            sb.append('}');
            return sb.toString();
        }
    }

    public static class ChromaKey {
        private static final float CHROMA_DEF_BLEND_X0 = 0.25f;
        private static final float CHROMA_DEF_BLEND_X1 = 0.75f;
        private static final float CHROMA_DEF_BLEND_Y0 = 0.25f;
        private static final float CHROMA_DEF_BLEND_Y1 = 0.75f;
        private static final float CHROMA_DEF_CLIP_BG = 0.5f;
        private static final float CHROMA_DEF_CLIP_FG = 0.72f;
        private static final int CHROMA_DEF_COLOR = -16711936;
        private static final int CHROMA_UNSET_COLOR = 0;
        /* access modifiers changed from: private */
        public float m_chromaKeyBlend_x0 = 0.25f;
        /* access modifiers changed from: private */
        public float m_chromaKeyBlend_x1 = 0.75f;
        /* access modifiers changed from: private */
        public float m_chromaKeyBlend_y0 = 0.25f;
        /* access modifiers changed from: private */
        public float m_chromaKeyBlend_y1 = 0.75f;
        /* access modifiers changed from: private */
        public float m_chromaKeyClipBG = CHROMA_DEF_CLIP_BG;
        /* access modifiers changed from: private */
        public float m_chromaKeyClipFG = CHROMA_DEF_CLIP_FG;
        /* access modifiers changed from: private */
        public int m_chromaKeyColor = 0;
        private float[] m_chromaKeyDivisions = {0.05f, 0.3f, CHROMA_DEF_CLIP_BG, 0.65f};
        private boolean m_chromaKeyEnabled;
        private boolean m_chromaKeyMaskEnabled;
        private float[] m_chromaKeyStrengths = {0.0f, 0.25f, 0.75f, 1.0f};

        public static int[] getChromaKeyRecommendedColors(Bitmap bitmap) {
            if (bitmap == null) {
                return new int[0];
            }
            float[] fArr = new float[3];
            int[] iArr = new int[360];
            int[] iArr2 = new int[(bitmap.getWidth() * bitmap.getHeight())];
            bitmap.getPixels(iArr2, 0, bitmap.getWidth(), 0, 0, bitmap.getWidth(), bitmap.getHeight());
            for (int colorToHSV : iArr2) {
                Color.colorToHSV(colorToHSV, fArr);
                if (fArr[1] >= 0.3f && fArr[2] >= 0.2f) {
                    int i = ((int) ((fArr[0] / 360.0f) * 360.0f)) % 360;
                    iArr[i] = iArr[i] + 1;
                }
            }
            for (int i2 = 0; i2 < iArr.length; i2++) {
            }
            int[] iArr3 = new int[14];
            int i3 = 0;
            for (int i4 = 0; i4 < iArr3.length; i4++) {
                int i5 = -1;
                int i6 = -1;
                for (int i7 = 0; i7 < 360; i7++) {
                    if (iArr[i7] > i5) {
                        i5 = iArr[i7];
                        i6 = i7;
                    }
                }
                if (i6 < 0 || i5 < 5) {
                    break;
                }
                fArr[0] = (float) ((i6 * 360) / 360);
                fArr[1] = 1.0f;
                fArr[2] = 1.0f;
                iArr3[i3] = Color.HSVToColor(fArr);
                i3++;
                for (int i8 = i6 - 3; i8 < i6 + 3; i8++) {
                    iArr[(i8 + 360) % 360] = -1;
                }
            }
            if (i3 < iArr3.length) {
                int[] iArr4 = new int[i3];
                System.arraycopy(iArr3, 0, iArr4, 0, i3);
                iArr3 = iArr4;
            }
            return iArr3;
        }

        public float getChromaKeyBGClip() {
            return this.m_chromaKeyClipBG;
        }

        public void getChromaKeyBlend(float[] fArr) {
            fArr[0] = this.m_chromaKeyBlend_x0;
            fArr[1] = this.m_chromaKeyBlend_y0;
            fArr[2] = this.m_chromaKeyBlend_x1;
            fArr[3] = this.m_chromaKeyBlend_y1;
        }

        public int getChromaKeyColor() {
            return this.m_chromaKeyColor;
        }

        public void getChromaKeyDivisions(float[] fArr) {
            System.arraycopy(this.m_chromaKeyDivisions, 0, fArr, 0, this.m_chromaKeyDivisions.length);
        }

        public boolean getChromaKeyEnabled() {
            return this.m_chromaKeyEnabled;
        }

        public float getChromaKeyFGClip() {
            return this.m_chromaKeyClipFG;
        }

        public boolean getChromaKeyMaskEnabled() {
            return this.m_chromaKeyMaskEnabled;
        }

        public void getChromaKeyStrengths(float[] fArr) {
            System.arraycopy(this.m_chromaKeyStrengths, 0, fArr, 0, this.m_chromaKeyStrengths.length);
        }

        public void setChromaKeyBGClip(float f) {
            this.m_chromaKeyClipBG = f;
        }

        public void setChromaKeyBlend(float[] fArr) {
            this.m_chromaKeyBlend_x0 = fArr[0];
            this.m_chromaKeyBlend_y0 = fArr[1];
            this.m_chromaKeyBlend_x1 = fArr[2];
            this.m_chromaKeyBlend_y1 = fArr[3];
        }

        public void setChromaKeyColor(int i) {
            this.m_chromaKeyColor = i;
        }

        public void setChromaKeyEnabled(boolean z) {
            this.m_chromaKeyEnabled = z;
        }

        public void setChromaKeyFGClip(float f) {
            this.m_chromaKeyClipFG = f;
        }

        public void setChromaKeyMaskEnabled(boolean z) {
            this.m_chromaKeyMaskEnabled = z;
        }

        public void setChromaKeyStrengths(float[] fArr) {
            System.arraycopy(fArr, 0, this.m_chromaKeyStrengths, 0, this.m_chromaKeyStrengths.length);
        }
    }

    public static class HitPoint {
        /* access modifiers changed from: private */
        public int id;
        public int mTime;
        public float mViewHeight;
        public float mViewWidth;
        public float mViewX;
        public float mViewY;
        /* access modifiers changed from: private */
        public int position;

        public int getHitInPosition() {
            return this.position;
        }

        public int getID() {
            return this.id;
        }
    }

    public class Mask {
        public static final int kSplit_Bottom = 4;
        public static final int kSplit_Left = 1;
        public static final int kSplit_LeftBottom = 7;
        public static final int kSplit_LeftTop = 5;
        public static final int kSplit_Right = 2;
        public static final int kSplit_RightBottom = 8;
        public static final int kSplit_RightTop = 6;
        public static final int kSplit_Top = 3;
        private int angle;
        private Bitmap maskImage;
        /* access modifiers changed from: private */
        public boolean onOff;
        private Rect rectPosition = new Rect();
        private int splitMode;
        /* access modifiers changed from: private */
        public boolean syncAnimationOverlayItem;
        private boolean vertical;

        public Mask() {
        }

        public int getAngle() {
            return this.angle;
        }

        public boolean getAnimateSyncFromOverlayItem() {
            return this.syncAnimationOverlayItem;
        }

        public Bitmap getMaskImage() {
            return this.maskImage;
        }

        public void getPosition(Rect rect) {
            rect.bottom = this.rectPosition.bottom;
            rect.top = this.rectPosition.top;
            rect.left = this.rectPosition.left;
            rect.right = this.rectPosition.right;
        }

        public int getSplitMode() {
            return this.splitMode;
        }

        public boolean getState() {
            return this.onOff;
        }

        public int height() {
            return this.rectPosition.height();
        }

        public void setAngle(int i) {
            this.angle = i;
        }

        public void setAnimateSyncFromOverlayItem(boolean z) {
            this.syncAnimationOverlayItem = z;
        }

        public void setMaskImage(Bitmap bitmap) {
            this.maskImage = bitmap;
        }

        public void setPosition(int i, int i2, int i3, int i4) {
            this.splitMode = 0;
            this.rectPosition.bottom = i4;
            this.rectPosition.top = i2;
            this.rectPosition.left = i;
            this.rectPosition.right = i3;
        }

        public void setPosition(Rect rect) {
            this.splitMode = 0;
            this.rectPosition.bottom = rect.bottom;
            this.rectPosition.top = rect.top;
            this.rectPosition.left = rect.left;
            this.rectPosition.right = rect.right;
        }

        public void setSplitMode(int i, boolean z) {
            if (this.splitMode != i || this.vertical != z) {
                this.splitMode = i;
                this.vertical = z;
                int width = nexApplicationConfig.getAspectProfile().getWidth();
                int height = nexApplicationConfig.getAspectProfile().getHeight();
                switch (i) {
                    case 1:
                        this.rectPosition.left = 0;
                        this.rectPosition.top = 0;
                        this.rectPosition.right = width / 2;
                        this.rectPosition.bottom = height;
                        break;
                    case 2:
                        this.rectPosition.top = 0;
                        this.rectPosition.left = width / 2;
                        this.rectPosition.right = width;
                        this.rectPosition.bottom = height;
                        break;
                    case 3:
                        this.rectPosition.top = 0;
                        this.rectPosition.left = 0;
                        this.rectPosition.right = width;
                        this.rectPosition.bottom = height / 2;
                        break;
                    case 4:
                        this.rectPosition.top = height / 2;
                        this.rectPosition.left = 0;
                        this.rectPosition.right = width;
                        this.rectPosition.bottom = height;
                        break;
                    case 5:
                        this.rectPosition.top = 0;
                        this.rectPosition.left = 0;
                        this.rectPosition.right = width / 2;
                        this.rectPosition.bottom = height / 2;
                        break;
                    case 6:
                        this.rectPosition.top = 0;
                        this.rectPosition.left = width / 2;
                        this.rectPosition.right = width;
                        this.rectPosition.bottom = height / 2;
                        break;
                    case 7:
                        this.rectPosition.top = height / 2;
                        this.rectPosition.left = 0;
                        this.rectPosition.right = width / 2;
                        this.rectPosition.bottom = height;
                        break;
                    case 8:
                        this.rectPosition.top = height / 2;
                        this.rectPosition.left = width / 2;
                        this.rectPosition.right = width;
                        this.rectPosition.bottom = height;
                        break;
                }
            }
        }

        public void setState(boolean z) {
            this.onOff = z;
        }

        public int width() {
            return this.rectPosition.width();
        }
    }

    private static class a implements Comparator<nexAnimate> {
        private a() {
        }

        /* renamed from: a */
        public int compare(nexAnimate nexanimate, nexAnimate nexanimate2) {
            if (nexanimate.mStartTime > nexanimate2.mStartTime) {
                return -1;
            }
            return nexanimate.mStartTime < nexanimate2.mStartTime ? 1 : 0;
        }
    }

    public nexOverlayItem(nexOverlayFilter nexoverlayfilter, int i, int i2, int i3, int i4) {
        this.mUpdated = true;
        this.showItem = true;
        this.mId = 0;
        this.mAnimateTranslateXpos = 0.0f;
        this.mAnimateTranslateYpos = 0.0f;
        this.mAnimateTranslateZpos = 0.0f;
        this.anchorPoint = 0;
        this.mActiveAnimateList = new HashSet();
        this.mAlpha = 1.0f;
        this.mScaledX = 1.0f;
        this.mScaledY = 1.0f;
        this.mScaledZ = 1.0f;
        this.mRotateDegreeX = 0.0f;
        this.mRotateDegreeY = 0.0f;
        this.mRotateDegreeZ = 0.0f;
        this.mBrightness = 0;
        this.mContrast = 0;
        this.mSaturation = 0;
        this.mColorEffect = nexColorEffect.NONE;
        this.mLayerExpressionDuration = 1000;
        this.mMaskRect = new Rect();
        this.mTrimStartDuration = 0;
        this.mTrimEndDuration = 0;
        this.mAudioOnOff = true;
        this.mVolume = 100;
        this.mSpeedControl = 100;
        this.scratchPoint = new float[]{0.0f, 0.0f};
        this.scratchMatrix = new Matrix();
        this.mLayerExpression = nexOverlayKineMasterExpression.NONE;
        this.mOverlayTitle = false;
        this.bApplayLayerExpression = true;
        this.mZOrder = 0;
        this.mFlipMode = 0;
        this.mOverLayFilter = nexoverlayfilter;
        if (i4 > i3) {
            this.mId = sLastId;
            sLastId++;
            this.mX = (float) i;
            this.mY = (float) i2;
            this.mStartTime = i3;
            this.mEndTime = i4;
            resetAnimate();
            return;
        }
        throw new InvalidRangeException(i3, i4);
    }

    public nexOverlayItem(nexOverlayFilter nexoverlayfilter, int i, boolean z, float f, float f2, int i2, int i3) {
        this.mUpdated = true;
        this.showItem = true;
        this.mId = 0;
        this.mAnimateTranslateXpos = 0.0f;
        this.mAnimateTranslateYpos = 0.0f;
        this.mAnimateTranslateZpos = 0.0f;
        this.anchorPoint = 0;
        this.mActiveAnimateList = new HashSet();
        this.mAlpha = 1.0f;
        this.mScaledX = 1.0f;
        this.mScaledY = 1.0f;
        this.mScaledZ = 1.0f;
        this.mRotateDegreeX = 0.0f;
        this.mRotateDegreeY = 0.0f;
        this.mRotateDegreeZ = 0.0f;
        this.mBrightness = 0;
        this.mContrast = 0;
        this.mSaturation = 0;
        this.mColorEffect = nexColorEffect.NONE;
        this.mLayerExpressionDuration = 1000;
        this.mMaskRect = new Rect();
        this.mTrimStartDuration = 0;
        this.mTrimEndDuration = 0;
        this.mAudioOnOff = true;
        this.mVolume = 100;
        this.mSpeedControl = 100;
        this.scratchPoint = new float[]{0.0f, 0.0f};
        this.scratchMatrix = new Matrix();
        this.mLayerExpression = nexOverlayKineMasterExpression.NONE;
        this.mOverlayTitle = false;
        this.bApplayLayerExpression = true;
        this.mZOrder = 0;
        this.mFlipMode = 0;
        this.mOverLayFilter = nexoverlayfilter;
        if (i3 > i2) {
            this.mId = sLastId;
            sLastId++;
            this.anchorPoint = i;
            this.relationCoordinates = z;
            this.mX = f;
            this.mY = f2;
            this.mStartTime = i2;
            this.mEndTime = i3;
            resetAnimate();
            return;
        }
        throw new InvalidRangeException(i2, i3);
    }

    public nexOverlayItem(nexOverlayImage nexoverlayimage, int i, int i2, int i3, int i4) {
        this.mUpdated = true;
        this.showItem = true;
        this.mId = 0;
        this.mAnimateTranslateXpos = 0.0f;
        this.mAnimateTranslateYpos = 0.0f;
        this.mAnimateTranslateZpos = 0.0f;
        this.anchorPoint = 0;
        this.mActiveAnimateList = new HashSet();
        this.mAlpha = 1.0f;
        this.mScaledX = 1.0f;
        this.mScaledY = 1.0f;
        this.mScaledZ = 1.0f;
        this.mRotateDegreeX = 0.0f;
        this.mRotateDegreeY = 0.0f;
        this.mRotateDegreeZ = 0.0f;
        this.mBrightness = 0;
        this.mContrast = 0;
        this.mSaturation = 0;
        this.mColorEffect = nexColorEffect.NONE;
        this.mLayerExpressionDuration = 1000;
        this.mMaskRect = new Rect();
        this.mTrimStartDuration = 0;
        this.mTrimEndDuration = 0;
        this.mAudioOnOff = true;
        this.mVolume = 100;
        this.mSpeedControl = 100;
        this.scratchPoint = new float[]{0.0f, 0.0f};
        this.scratchMatrix = new Matrix();
        this.mLayerExpression = nexOverlayKineMasterExpression.NONE;
        this.mOverlayTitle = false;
        this.bApplayLayerExpression = true;
        this.mZOrder = 0;
        this.mFlipMode = 0;
        this.mId = sLastId;
        sLastId++;
        if (i4 > i3) {
            this.mOverLayImage = nexoverlayimage;
            this.mX = (float) i;
            this.mY = (float) i2;
            this.mStartTime = i3;
            this.mEndTime = i4;
            resetAnimate();
            return;
        }
        throw new InvalidRangeException(i3, i4);
    }

    public nexOverlayItem(nexOverlayImage nexoverlayimage, int i, boolean z, float f, float f2, int i2, int i3) {
        this.mUpdated = true;
        this.showItem = true;
        this.mId = 0;
        this.mAnimateTranslateXpos = 0.0f;
        this.mAnimateTranslateYpos = 0.0f;
        this.mAnimateTranslateZpos = 0.0f;
        this.anchorPoint = 0;
        this.mActiveAnimateList = new HashSet();
        this.mAlpha = 1.0f;
        this.mScaledX = 1.0f;
        this.mScaledY = 1.0f;
        this.mScaledZ = 1.0f;
        this.mRotateDegreeX = 0.0f;
        this.mRotateDegreeY = 0.0f;
        this.mRotateDegreeZ = 0.0f;
        this.mBrightness = 0;
        this.mContrast = 0;
        this.mSaturation = 0;
        this.mColorEffect = nexColorEffect.NONE;
        this.mLayerExpressionDuration = 1000;
        this.mMaskRect = new Rect();
        this.mTrimStartDuration = 0;
        this.mTrimEndDuration = 0;
        this.mAudioOnOff = true;
        this.mVolume = 100;
        this.mSpeedControl = 100;
        this.scratchPoint = new float[]{0.0f, 0.0f};
        this.scratchMatrix = new Matrix();
        this.mLayerExpression = nexOverlayKineMasterExpression.NONE;
        this.mOverlayTitle = false;
        this.bApplayLayerExpression = true;
        this.mZOrder = 0;
        this.mFlipMode = 0;
        this.mId = sLastId;
        sLastId++;
        if (i3 > i2) {
            this.mOverLayImage = nexoverlayimage;
            this.anchorPoint = i;
            this.relationCoordinates = z;
            this.mX = f;
            this.mY = f2;
            this.mStartTime = i2;
            this.mEndTime = i3;
            resetAnimate();
            return;
        }
        throw new InvalidRangeException(i2, i3);
    }

    @Deprecated
    public nexOverlayItem(nexOverlayKineMasterText nexoverlaykinemastertext, int i, int i2, int i3, int i4) {
        this.mUpdated = true;
        this.showItem = true;
        this.mId = 0;
        this.mAnimateTranslateXpos = 0.0f;
        this.mAnimateTranslateYpos = 0.0f;
        this.mAnimateTranslateZpos = 0.0f;
        this.anchorPoint = 0;
        this.mActiveAnimateList = new HashSet();
        this.mAlpha = 1.0f;
        this.mScaledX = 1.0f;
        this.mScaledY = 1.0f;
        this.mScaledZ = 1.0f;
        this.mRotateDegreeX = 0.0f;
        this.mRotateDegreeY = 0.0f;
        this.mRotateDegreeZ = 0.0f;
        this.mBrightness = 0;
        this.mContrast = 0;
        this.mSaturation = 0;
        this.mColorEffect = nexColorEffect.NONE;
        this.mLayerExpressionDuration = 1000;
        this.mMaskRect = new Rect();
        this.mTrimStartDuration = 0;
        this.mTrimEndDuration = 0;
        this.mAudioOnOff = true;
        this.mVolume = 100;
        this.mSpeedControl = 100;
        this.scratchPoint = new float[]{0.0f, 0.0f};
        this.scratchMatrix = new Matrix();
        this.mLayerExpression = nexOverlayKineMasterExpression.NONE;
        this.mOverlayTitle = false;
        this.bApplayLayerExpression = true;
        this.mZOrder = 0;
        this.mFlipMode = 0;
        nexoverlaykinemastertext.getClass();
        this.mId = sLastId;
        sLastId++;
        if (i4 > i3) {
            this.mOverLayImage = nexoverlaykinemastertext;
            this.mX = (float) i;
            this.mY = (float) i2;
            this.mStartTime = i3;
            this.mEndTime = i4;
            resetAnimate();
            return;
        }
        throw new InvalidRangeException(i3, i4);
    }

    @Deprecated
    public nexOverlayItem(nexOverlayKineMasterText nexoverlaykinemastertext, int i, boolean z, float f, float f2, int i2, int i3) {
        this.mUpdated = true;
        this.showItem = true;
        this.mId = 0;
        this.mAnimateTranslateXpos = 0.0f;
        this.mAnimateTranslateYpos = 0.0f;
        this.mAnimateTranslateZpos = 0.0f;
        this.anchorPoint = 0;
        this.mActiveAnimateList = new HashSet();
        this.mAlpha = 1.0f;
        this.mScaledX = 1.0f;
        this.mScaledY = 1.0f;
        this.mScaledZ = 1.0f;
        this.mRotateDegreeX = 0.0f;
        this.mRotateDegreeY = 0.0f;
        this.mRotateDegreeZ = 0.0f;
        this.mBrightness = 0;
        this.mContrast = 0;
        this.mSaturation = 0;
        this.mColorEffect = nexColorEffect.NONE;
        this.mLayerExpressionDuration = 1000;
        this.mMaskRect = new Rect();
        this.mTrimStartDuration = 0;
        this.mTrimEndDuration = 0;
        this.mAudioOnOff = true;
        this.mVolume = 100;
        this.mSpeedControl = 100;
        this.scratchPoint = new float[]{0.0f, 0.0f};
        this.scratchMatrix = new Matrix();
        this.mLayerExpression = nexOverlayKineMasterExpression.NONE;
        this.mOverlayTitle = false;
        this.bApplayLayerExpression = true;
        this.mZOrder = 0;
        this.mFlipMode = 0;
        nexoverlaykinemastertext.getClass();
        this.mId = sLastId;
        sLastId++;
        if (i3 > i2) {
            this.mOverLayImage = nexoverlaykinemastertext;
            this.anchorPoint = i;
            this.relationCoordinates = z;
            this.mX = f;
            this.mY = f2;
            this.mStartTime = i2;
            this.mEndTime = i3;
            resetAnimate();
            return;
        }
        throw new InvalidRangeException(i2, i3);
    }

    public nexOverlayItem(String str, int i, int i2, int i3, int i4) {
        this.mUpdated = true;
        this.showItem = true;
        this.mId = 0;
        this.mAnimateTranslateXpos = 0.0f;
        this.mAnimateTranslateYpos = 0.0f;
        this.mAnimateTranslateZpos = 0.0f;
        this.anchorPoint = 0;
        this.mActiveAnimateList = new HashSet();
        this.mAlpha = 1.0f;
        this.mScaledX = 1.0f;
        this.mScaledY = 1.0f;
        this.mScaledZ = 1.0f;
        this.mRotateDegreeX = 0.0f;
        this.mRotateDegreeY = 0.0f;
        this.mRotateDegreeZ = 0.0f;
        this.mBrightness = 0;
        this.mContrast = 0;
        this.mSaturation = 0;
        this.mColorEffect = nexColorEffect.NONE;
        this.mLayerExpressionDuration = 1000;
        this.mMaskRect = new Rect();
        this.mTrimStartDuration = 0;
        this.mTrimEndDuration = 0;
        this.mAudioOnOff = true;
        this.mVolume = 100;
        this.mSpeedControl = 100;
        this.scratchPoint = new float[]{0.0f, 0.0f};
        this.scratchMatrix = new Matrix();
        this.mLayerExpression = nexOverlayKineMasterExpression.NONE;
        this.mOverlayTitle = false;
        this.bApplayLayerExpression = true;
        this.mZOrder = 0;
        this.mFlipMode = 0;
        nexOverlayPreset overlayPreset = nexOverlayPreset.getOverlayPreset();
        if (overlayPreset != null) {
            this.mOverLayImage = overlayPreset.getOverlayImage(str);
            if (this.mOverLayImage == null) {
                StringBuilder sb = new StringBuilder();
                sb.append("Not found OverlayImage. id=");
                sb.append(str);
                throw new nexSDKException(sb.toString());
            } else if (i4 > i3) {
                this.mId = sLastId;
                sLastId++;
                this.mX = (float) i;
                this.mY = (float) i2;
                this.mStartTime = i3;
                this.mEndTime = i4;
                resetAnimate();
            } else {
                throw new InvalidRangeException(i3, i4);
            }
        } else {
            throw new nexSDKException("nexOverlayPreset is null");
        }
    }

    public nexOverlayItem(String str, int i, boolean z, float f, float f2, int i2, int i3) {
        this.mUpdated = true;
        this.showItem = true;
        this.mId = 0;
        this.mAnimateTranslateXpos = 0.0f;
        this.mAnimateTranslateYpos = 0.0f;
        this.mAnimateTranslateZpos = 0.0f;
        this.anchorPoint = 0;
        this.mActiveAnimateList = new HashSet();
        this.mAlpha = 1.0f;
        this.mScaledX = 1.0f;
        this.mScaledY = 1.0f;
        this.mScaledZ = 1.0f;
        this.mRotateDegreeX = 0.0f;
        this.mRotateDegreeY = 0.0f;
        this.mRotateDegreeZ = 0.0f;
        this.mBrightness = 0;
        this.mContrast = 0;
        this.mSaturation = 0;
        this.mColorEffect = nexColorEffect.NONE;
        this.mLayerExpressionDuration = 1000;
        this.mMaskRect = new Rect();
        this.mTrimStartDuration = 0;
        this.mTrimEndDuration = 0;
        this.mAudioOnOff = true;
        this.mVolume = 100;
        this.mSpeedControl = 100;
        this.scratchPoint = new float[]{0.0f, 0.0f};
        this.scratchMatrix = new Matrix();
        this.mLayerExpression = nexOverlayKineMasterExpression.NONE;
        this.mOverlayTitle = false;
        this.bApplayLayerExpression = true;
        this.mZOrder = 0;
        this.mFlipMode = 0;
        nexOverlayPreset overlayPreset = nexOverlayPreset.getOverlayPreset();
        if (overlayPreset != null) {
            this.mOverLayImage = overlayPreset.getOverlayImage(str);
            if (this.mOverLayImage == null) {
                StringBuilder sb = new StringBuilder();
                sb.append("Not found OverlayImage. id=");
                sb.append(str);
                throw new nexSDKException(sb.toString());
            } else if (i3 > i2) {
                this.mId = sLastId;
                sLastId++;
                this.anchorPoint = i;
                this.relationCoordinates = z;
                this.mX = f;
                this.mY = f2;
                this.mStartTime = i2;
                this.mEndTime = i3;
                resetAnimate();
            } else {
                throw new InvalidRangeException(i2, i3);
            }
        } else {
            throw new nexSDKException("nexOverlayPreset is null");
        }
    }

    public static void clearOutLine() {
        solidBlackBitmap = null;
        solidWhiteBitmap = null;
        outLineIcon = null;
    }

    protected static nexOverlayItem clone(nexOverlayItem nexoverlayitem) {
        nexOverlayItem nexoverlayitem2;
        try {
            nexoverlayitem2 = (nexOverlayItem) nexoverlayitem.clone();
            try {
                nexoverlayitem2.mColorEffect = nexColorEffect.clone(nexoverlayitem.mColorEffect);
                if (nexoverlayitem.mOverLayImage != null) {
                    nexoverlayitem2.mOverLayImage = nexOverlayImage.clone(nexoverlayitem.mOverLayImage);
                }
            } catch (CloneNotSupportedException e) {
                e = e;
                e.printStackTrace();
                return nexoverlayitem2;
            }
        } catch (CloneNotSupportedException e2) {
            e = e2;
            nexoverlayitem2 = null;
            e.printStackTrace();
            return nexoverlayitem2;
        }
        return nexoverlayitem2;
    }

    private void getAnchorPosition(boolean z) {
        if (!z) {
            z = updateCoordinates(false);
        }
        if (z) {
            switch (this.anchorPoint) {
                case 0:
                    this.anchorPointX = 0;
                    this.anchorPointY = 0;
                    return;
                case 1:
                    this.anchorPointX = this.lastLayerWidth / 2;
                    this.anchorPointY = 0;
                    return;
                case 2:
                    this.anchorPointX = this.lastLayerWidth;
                    this.anchorPointY = 0;
                    return;
                case 3:
                    this.anchorPointX = 0;
                    this.anchorPointY = this.lastLayerHeight / 2;
                    return;
                case 4:
                    this.anchorPointX = this.lastLayerWidth / 2;
                    this.anchorPointY = this.lastLayerHeight / 2;
                    return;
                case 5:
                    this.anchorPointX = this.lastLayerWidth;
                    this.anchorPointY = this.lastLayerHeight / 2;
                    return;
                case 6:
                    this.anchorPointX = 0;
                    this.anchorPointY = this.lastLayerHeight;
                    return;
                case 7:
                    this.anchorPointX = this.lastLayerWidth / 2;
                    this.anchorPointY = this.lastLayerHeight;
                    return;
                case 8:
                    this.anchorPointX = this.lastLayerWidth;
                    this.anchorPointY = this.lastLayerHeight;
                    return;
                default:
                    return;
            }
        }
    }

    private int getCombinedBrightness() {
        return this.mColorEffect == null ? this.mBrightness : this.mBrightness + ((int) (this.mColorEffect.getBrightness() * 255.0f));
    }

    private int getCombinedContrast() {
        return this.mColorEffect == null ? this.mContrast : this.mContrast + ((int) (this.mColorEffect.getContrast() * 255.0f));
    }

    private int getCombinedSaturation() {
        return this.mColorEffect == null ? this.mSaturation : this.mSaturation + ((int) (this.mColorEffect.getSaturation() * 255.0f));
    }

    /* access modifiers changed from: private */
    public static Rect getDrawBitmapPosition(int i, int i2, int i3) {
        int i4 = -i2;
        int i5 = i4 / 2;
        int i6 = -i3;
        int i7 = i6 / 2;
        int i8 = i2 / 2;
        int i9 = i3 / 2;
        Rect rect = new Rect(i5, i7, i8, i9);
        switch (i) {
            case 0:
                rect.set(0, 0, i2, i3);
                break;
            case 1:
                rect.set(i5, 0, i8, i3);
                break;
            case 2:
                rect.set(i4, 0, 0, i3);
                break;
            case 3:
                rect.set(0, i7, i2, i9);
                break;
            case 5:
                rect.set(i4, i7, 0, i9);
                break;
            case 6:
                rect.set(0, i6, i2, 0);
                break;
            case 7:
                rect.set(i5, i6, i8, 0);
                break;
            case 8:
                rect.set(i4, i6, 0, 0);
                break;
        }
        return rect;
    }

    /* access modifiers changed from: private */
    public int[] getRealPositions(boolean z) {
        int[] iArr = new int[3];
        getAnchorPosition(z);
        if (this.relationCoordinates) {
            iArr[0] = this.anchorPointX + ((int) (((float) this.lastLayerWidth) * this.mX));
            iArr[1] = this.anchorPointY + ((int) (((float) this.lastLayerHeight) * this.mY));
            iArr[2] = 0;
        } else {
            iArr[0] = this.anchorPointX + ((int) this.mX);
            iArr[1] = this.anchorPointY + ((int) this.mY);
            iArr[2] = (int) this.mZ;
        }
        return iArr;
    }

    private float getRelativeScale(int i, int i2) {
        int width = nexApplicationConfig.getAspectProfile().getWidth();
        int height = nexApplicationConfig.getAspectProfile().getHeight();
        float f = 1.0f;
        float f2 = width > i ? ((float) i) / ((float) width) : 1.0f;
        if (height > height) {
            float f3 = (float) height;
            f = f3 / f3;
        }
        return f > f2 ? f2 : f;
    }

    private int getTintColor() {
        if (this.mColorEffect == null) {
            return 0;
        }
        return this.mColorEffect.getTintColor();
    }

    /* JADX INFO: used method not loaded: com.nexstreaming.kminternal.nexvideoeditor.LayerRenderer.b(float, float):null, types can be incorrect */
    /* JADX WARNING: Code restructure failed: missing block: B:35:0x0196, code lost:
        r2 = r13;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:38:0x019b, code lost:
        r2 = r12;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:39:0x019c, code lost:
        r19.i();
        r6.b(1.0f / com.nexstreaming.nexeditorsdk.nexOverlayItem.BoundInfo.access$1900(r7), 1.0f / com.nexstreaming.nexeditorsdk.nexOverlayItem.BoundInfo.access$2000(r7));
        r6.a(outLineIcon[r0], r1, r2);
        r19.j();
     */
    private static void renderOutLine(nexOverlayItem nexoverlayitem, LayerRenderer layerRenderer) {
        float f;
        float f2;
        nexOverlayItem nexoverlayitem2 = nexoverlayitem;
        LayerRenderer layerRenderer2 = layerRenderer;
        if (solidBlackBitmap != null && solidWhiteBitmap != null) {
            BoundInfo boundInfo = nexoverlayitem2.getBoundInfo(nexoverlayitem2.mTime);
            layerRenderer.i();
            layerRenderer2.a(boundInfo.x, boundInfo.y);
            layerRenderer2.b(boundInfo.scaleX, boundInfo.scaleY);
            layerRenderer2.a(boundInfo.angleZ, 0.0f, 0.0f, 1.0f);
            layerRenderer.i();
            layerRenderer2.b(1.0f / boundInfo.scaleX, 1.0f / boundInfo.scaleY);
            Rect rect = new Rect();
            boundInfo.getDrawBound(rect);
            float access$1900 = ((float) rect.left) * boundInfo.scaleX;
            float access$19002 = ((float) rect.right) * boundInfo.scaleX;
            float access$2000 = ((float) rect.top) * boundInfo.scaleY;
            float access$20002 = ((float) rect.bottom) * boundInfo.scaleY;
            if (solidOutlen) {
                float f3 = access$2000;
                float f4 = access$20002;
                layerRenderer.a(solidWhiteBitmap, access$1900, f3, access$1900 + ((float) marchingAnts_width), f4);
                float f5 = access$19002;
                layerRenderer.a(solidWhiteBitmap, access$19002 - ((float) marchingAnts_width), f3, f5, f4);
                float f6 = access$1900;
                layerRenderer.a(solidWhiteBitmap, f6, f3, f5, access$2000 + ((float) marchingAnts_width));
                layerRenderer.a(solidWhiteBitmap, f6, access$20002 - ((float) marchingAnts_width), f5, access$20002);
            } else {
                float f7 = access$2000;
                float f8 = access$20002;
                layerRenderer.a(solidBlackBitmap, access$1900, f7, access$1900 + ((float) marchingAnts_width), f8);
                float f9 = access$19002;
                layerRenderer.a(solidBlackBitmap, access$19002 - ((float) marchingAnts_width), f7, f9, f8);
                float f10 = access$1900;
                layerRenderer.a(solidBlackBitmap, f10, f7, f9, access$2000 + ((float) marchingAnts_width));
                layerRenderer.a(solidBlackBitmap, f10, access$20002 - ((float) marchingAnts_width), f9, access$20002);
                float f11 = ((float) marchingAnts_dashSize) * 2.0f;
                for (float f12 = access$1900 - ((float) (marchingAnts_dashSize * 2)); f12 < access$19002; f12 += (float) (marchingAnts_dashSize * 2)) {
                    float max = Math.max(access$1900, f12 + f11);
                    float min = Math.min(access$19002, max + ((float) marchingAnts_dashSize));
                    if (min >= access$1900 && max <= access$19002) {
                        float f13 = max;
                        float f14 = min;
                        layerRenderer.a(solidWhiteBitmap, f13, access$2000, f14, access$2000 + ((float) marchingAnts_width));
                        layerRenderer.a(solidWhiteBitmap, f13, access$20002 - ((float) marchingAnts_width), f14, access$20002);
                    }
                }
                for (float f15 = access$2000 - ((float) (marchingAnts_dashSize * 2)); f15 < access$20002; f15 += (float) (marchingAnts_dashSize * 2)) {
                    float max2 = Math.max(access$2000, f15 + f11);
                    float min2 = Math.min(access$20002, max2 + ((float) marchingAnts_dashSize));
                    if (min2 >= access$2000 && max2 <= access$20002) {
                        float f16 = max2;
                        float f17 = min2;
                        layerRenderer.a(solidWhiteBitmap, access$1900, f16, access$1900 + ((float) marchingAnts_width), f17);
                        layerRenderer.a(solidWhiteBitmap, access$19002 - ((float) marchingAnts_width), f16, access$19002, f17);
                    }
                }
            }
            layerRenderer.j();
            int i = 0;
            while (i < 4) {
                if (outLineIcon[i] != null) {
                    switch (i + 1) {
                        case 1:
                            f2 = access$1900;
                            break;
                        case 2:
                            f2 = access$19002;
                            break;
                        case 3:
                            f = access$1900;
                            break;
                        case 4:
                            f = access$19002;
                            break;
                        default:
                            f = 0.0f;
                            float f18 = 0.0f;
                            break;
                    }
                }
                i++;
            }
            layerRenderer.j();
        }
    }

    private void runAnimate(nexAnimate nexanimate, int i) {
        if (nexanimate instanceof AnimateImages) {
            this.animateResourceId = nexanimate.getImageResourceId(i);
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("[");
            sb.append(getId());
            sb.append("][");
            sb.append(i);
            sb.append("]AnimateImages=(");
            sb.append(this.animateResourceId);
            sb.append(")");
            Log.d(str, sb.toString());
        } else if (nexanimate instanceof Move) {
            if (this.mLayerExpression.getID() == 0) {
                this.mAnimateTranslateXpos = nexanimate.getTranslatePosition(i, 1);
                this.mAnimateTranslateYpos = nexanimate.getTranslatePosition(i, 2);
                this.mAnimateTranslateZpos = nexanimate.getTranslatePosition(i, 3);
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("[");
                sb2.append(getId());
                sb2.append("][");
                sb2.append(i);
                sb2.append("]Move to=(");
                sb2.append(this.mAnimateTranslateXpos);
                sb2.append(",");
                sb2.append(this.mAnimateTranslateYpos);
                sb2.append(",");
                sb2.append(this.mAnimateTranslateZpos);
                sb2.append(")");
                Log.d(str2, sb2.toString());
            }
        } else if (nexanimate instanceof Alpha) {
            if (this.mLayerExpression.getID() == 0) {
                this.mAnimateLastAlpha = nexanimate.getAlpha(i);
                String str3 = TAG;
                StringBuilder sb3 = new StringBuilder();
                sb3.append("[");
                sb3.append(getId());
                sb3.append("][");
                sb3.append(i);
                sb3.append("]Alpha =(");
                sb3.append(this.mAnimateLastAlpha);
                sb3.append(")");
                Log.d(str3, sb3.toString());
            }
        } else if (nexanimate instanceof Rotate) {
            if (this.mLayerExpression.getID() == 0) {
                this.mAnimateLastRotateDegreeX = nexanimate.getAngleDegree(i, this.mRotateDegreeX, 1);
                this.mAnimateLastRotateDegreeY = nexanimate.getAngleDegree(i, this.mRotateDegreeY, 2);
                this.mAnimateLastRotateDegreeZ = nexanimate.getAngleDegree(i, this.mRotateDegreeZ, 3);
                String str4 = TAG;
                StringBuilder sb4 = new StringBuilder();
                sb4.append("[");
                sb4.append(getId());
                sb4.append("][");
                sb4.append(i);
                sb4.append("]Rotate =(");
                sb4.append(this.mAnimateLastRotateDegreeX);
                sb4.append(",");
                sb4.append(this.mAnimateLastRotateDegreeY);
                sb4.append(",");
                sb4.append(this.mAnimateLastRotateDegreeZ);
                sb4.append(")");
                Log.d(str4, sb4.toString());
            }
        } else if (nexanimate instanceof Scale) {
            if (this.mLayerExpression.getID() == 0) {
                this.mAnimateLastScaledX = nexanimate.getScaledRatio(i, this.mScaledX, 1);
                this.mAnimateLastScaledY = nexanimate.getScaledRatio(i, this.mScaledY, 2);
                this.mAnimateLastScaledZ = nexanimate.getScaledRatio(i, this.mScaledY, 3);
                String str5 = TAG;
                StringBuilder sb5 = new StringBuilder();
                sb5.append("[");
                sb5.append(getId());
                sb5.append("][");
                sb5.append(i);
                sb5.append("]Scale =(");
                sb5.append(this.mAnimateLastScaledX);
                sb5.append(",");
                sb5.append(this.mAnimateLastScaledY);
                sb5.append(",");
                sb5.append(this.mAnimateLastScaledZ);
                sb5.append(")");
                Log.d(str5, sb5.toString());
            }
        } else if (this.mLayerExpression.getID() == 0 && nexanimate.onFreeTypeAnimate(i, this)) {
            this.mAnimateTranslateXpos = (float) nexanimate.mdX;
            this.mAnimateTranslateYpos = (float) nexanimate.mdY;
            this.mAnimateTranslateZpos = (float) nexanimate.mdZ;
            this.mAnimateLastAlpha = nexanimate.mAlpha;
            this.mAnimateLastRotateDegreeX = nexanimate.mRotateDegreeX;
            this.mAnimateLastRotateDegreeY = nexanimate.mRotateDegreeY;
            this.mAnimateLastRotateDegreeZ = nexanimate.mRotateDegreeZ;
            this.mAnimateLastScaledX = nexanimate.mScaledX;
            this.mAnimateLastScaledY = nexanimate.mScaledY;
            this.mAnimateLastScaledZ = nexanimate.mScaledZ;
            String str6 = TAG;
            StringBuilder sb6 = new StringBuilder();
            sb6.append("[");
            sb6.append(getId());
            sb6.append("][");
            sb6.append(i);
            sb6.append("]FreeType =(");
            sb6.append(this.mAnimateTranslateXpos);
            sb6.append(",");
            sb6.append(this.mAnimateTranslateYpos);
            sb6.append(",");
            sb6.append(this.mAnimateTranslateZpos);
            sb6.append(")");
            Log.d(str6, sb6.toString());
        }
    }

    public static void setOutLine() {
        solidOutlen = false;
        solidBlackBitmap = Bitmap.createBitmap(16, 16, Config.ARGB_8888);
        new Canvas(solidBlackBitmap).drawColor(-16777216);
        solidWhiteBitmap = Bitmap.createBitmap(16, 16, Config.ARGB_8888);
        new Canvas(solidWhiteBitmap).drawColor(-1);
        outLineIcon = new Bitmap[4];
    }

    public static boolean setOutLineIcon(Context context, int i, int i2) {
        if (outLineIcon == null || i <= 0 || i > 4) {
            return false;
        }
        if (i2 == 0) {
            outLineIcon[i - 1] = null;
        } else {
            outLineIcon[i - 1] = BitmapFactory.decodeResource(context.getResources(), i2);
        }
        return true;
    }

    public static void setOutlineType(boolean z) {
        solidOutlen = z;
    }

    private int speedControlTab(int i) {
        int[] iArr = {13, 25, 50, 75, 100, BaiduSceneResult.TRAVEL_OTHER, 150, 175, 200, 400};
        for (int i2 = 0; i2 < iArr.length; i2++) {
            if (iArr[i2] >= i) {
                return iArr[i2];
            }
        }
        return 400;
    }

    private boolean updateCoordinates(boolean z) {
        boolean z2;
        if (this.lastAnchorPoint != this.anchorPoint) {
            if (!z) {
                this.lastAnchorPoint = this.anchorPoint;
            }
            z2 = true;
        } else {
            z2 = false;
        }
        if (this.lastLayerWidth != nexApplicationConfig.getAspectProfile().getWidth()) {
            if (!z) {
                this.lastLayerWidth = nexApplicationConfig.getAspectProfile().getWidth();
            }
            z2 = true;
        }
        if (this.lastLayerHeight == nexApplicationConfig.getAspectProfile().getHeight()) {
            return z2;
        }
        if (!z) {
            this.lastLayerHeight = nexApplicationConfig.getAspectProfile().getHeight();
        }
        return true;
    }

    public void addAnimate(nexAnimate nexanimate) {
        if (this.mAniList == null) {
            this.mAniList = new ArrayList();
        }
        this.mAniList.add(nexanimate);
        this.mUpdated = true;
        Collections.sort(this.mAniList, new a());
    }

    public void clearAnimate() {
        if (this.mAniList != null) {
            this.mAniList.clear();
            this.mUpdated = true;
            resetAnimate();
        }
    }

    @Deprecated
    public void clearCache() {
    }

    public void clearTrim() {
        if (isVideo()) {
            this.mTrimStartDuration = 0;
            this.mTrimEndDuration = 0;
            return;
        }
        throw new ClipIsNotVideoException();
    }

    public void flipHorizontal(boolean z) {
        if (z) {
            this.mFlipMode |= 2;
        } else {
            this.mFlipMode &= -3;
        }
    }

    public void flipVertical(boolean z) {
        if (z) {
            this.mFlipMode |= 1;
        } else {
            this.mFlipMode &= -2;
        }
    }

    public float getAlpha() {
        return this.mAlpha;
    }

    public int getAnchor() {
        return this.anchorPoint;
    }

    public int getAnimateEndTime() {
        int i = 0;
        if (this.mAniList == null) {
            return 0;
        }
        for (nexAnimate nexanimate : this.mAniList) {
            if (i < nexanimate.getEndTime()) {
                i = nexanimate.getEndTime();
            }
        }
        return i;
    }

    public boolean getAudioOnOff() {
        return this.mAudioOnOff;
    }

    public BoundInfo getBoundInfo(int i) {
        return new BoundInfo(i);
    }

    public int getBrightness() {
        return this.mBrightness;
    }

    public ChromaKey getChromaKey() {
        if (this.mChromaKey == null) {
            this.mChromaKey = new ChromaKey();
        }
        return this.mChromaKey;
    }

    public int getContrast() {
        return this.mContrast;
    }

    public boolean getEnableShow() {
        return this.showItem;
    }

    public int getEndTime() {
        return this.mEndTime;
    }

    public int getEndTrimTime() {
        return this.mTrimEndDuration;
    }

    public int getId() {
        return this.mId;
    }

    @Deprecated
    public nexOverlayKineMasterExpression getLayerExpression() {
        return this.mLayerExpression;
    }

    @Deprecated
    public int getLayerExpressionDuration() {
        return this.mLayerExpressionDuration;
    }

    @Deprecated
    public boolean getLayerExpressiontParam() {
        return this.bApplayLayerExpression;
    }

    public Mask getMask() {
        if (this.mMask == null) {
            this.mMask = new Mask();
        }
        return this.mMask;
    }

    /* access modifiers changed from: 0000 */
    @Deprecated
    public nexOverlayImage getOverlayImage() {
        return this.mOverLayImage;
    }

    /* access modifiers changed from: 0000 */
    public boolean getOverlayTitle() {
        return this.mOverlayTitle;
    }

    public int getPositionX() {
        return getRealPositions(false)[0];
    }

    public int getPositionY() {
        return getRealPositions(false)[1];
    }

    public boolean getRelationCoordinates() {
        return this.relationCoordinates;
    }

    public int getRotate() {
        return getRotateZ();
    }

    public int getRotateX() {
        return (int) this.mRotateDegreeX;
    }

    public int getRotateY() {
        return (int) this.mRotateDegreeY;
    }

    public int getRotateZ() {
        return (int) this.mRotateDegreeZ;
    }

    public int getSaturation() {
        return this.mSaturation;
    }

    public float getScaledX() {
        return this.mScaledX;
    }

    public float getScaledY() {
        return this.mScaledY;
    }

    public float getScaledZ() {
        return this.mScaledZ;
    }

    public int getSpeedControl() {
        return this.mSpeedControl;
    }

    public int getStartTime() {
        return this.mStartTime;
    }

    public int getStartTrimTime() {
        return this.mTrimStartDuration;
    }

    public int getVolume() {
        return this.mVolume;
    }

    public int getZOrder() {
        return this.mZOrder;
    }

    public boolean isFlipHorizontal() {
        return (this.mFlipMode & 2) == 2;
    }

    public boolean isFlipVertical() {
        return (this.mFlipMode & 1) == 1;
    }

    public boolean isPointInOverlayItem(HitPoint hitPoint) {
        float[] fArr = this.scratchPoint;
        Matrix matrix = this.scratchMatrix;
        BoundInfo boundInfo = getBoundInfo(hitPoint.mTime);
        matrix.reset();
        matrix.postScale(((float) nexApplicationConfig.getAspectProfile().getWidth()) / hitPoint.mViewWidth, ((float) nexApplicationConfig.getAspectProfile().getHeight()) / hitPoint.mViewHeight);
        matrix.postTranslate(-boundInfo.x, -boundInfo.y);
        matrix.postScale(1.0f / boundInfo.scaleX, 1.0f / boundInfo.scaleY);
        matrix.postRotate(-boundInfo.angleZ, 0.0f, 0.0f);
        fArr[0] = hitPoint.mViewX;
        fArr[1] = hitPoint.mViewY;
        matrix.mapPoints(fArr);
        float f = fArr[0];
        float f2 = fArr[1];
        Rect rect = new Rect();
        boundInfo.getDrawBound(rect);
        float access$1900 = ((float) rect.left) * boundInfo.scaleX;
        float access$19002 = ((float) rect.right) * boundInfo.scaleX;
        float access$2000 = ((float) rect.top) * boundInfo.scaleY;
        float access$20002 = ((float) rect.bottom) * boundInfo.scaleY;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("new pos(");
        sb.append(f);
        sb.append(",");
        sb.append(f2);
        sb.append(") , Rect(");
        sb.append(access$1900);
        sb.append(",");
        sb.append(access$2000);
        sb.append(",");
        sb.append(access$19002);
        sb.append(",");
        sb.append(access$20002);
        sb.append(") , handleRadius=");
        sb.append(36.0f);
        Log.d(str, sb.toString());
        float f3 = access$1900 - 36.0f;
        if (f < f3 || f > access$1900 + 36.0f || f2 < access$2000 - 36.0f || f2 > access$2000 + 36.0f) {
            float f4 = access$19002 - 36.0f;
            if (f >= f4 && f <= access$19002 + 36.0f && f2 >= access$2000 - 36.0f && f2 <= access$2000 + 36.0f) {
                hitPoint.position = 2;
            } else if (f >= f3 && f <= access$1900 + 36.0f && f2 >= access$20002 - 36.0f && f2 <= access$20002 + 36.0f) {
                hitPoint.position = 3;
            } else if (f >= f4 && f <= access$19002 + 36.0f && f2 >= access$20002 - 36.0f && f2 <= 36.0f + access$20002) {
                hitPoint.position = 4;
            } else if (f < access$1900 || f > access$19002 || f2 < access$2000 || f2 > access$20002) {
                hitPoint.id = 0;
                hitPoint.position = 0;
                return false;
            } else {
                hitPoint.position = 0;
            }
        } else {
            hitPoint.position = 1;
        }
        hitPoint.id = getId();
        return true;
    }

    /* access modifiers changed from: 0000 */
    public boolean isVideo() {
        if (this.mOverLayImage == null) {
            return false;
        }
        return this.mOverLayImage.isVideo();
    }

    public void movePosition(float f, float f2) {
        this.mX = f;
        this.mY = f2;
        this.mUpdated = true;
        resetAnimate();
    }

    /* access modifiers changed from: 0000 */
    public void onRender(LayerRenderer layerRenderer) {
        if (!(this.mOverLayFilter == null || !this.mOverLayFilter.isUpdated() || this.awakeAsset == null)) {
            Rect rect = new Rect();
            this.mOverLayFilter.getBound(rect);
            this.awakeAsset.onRefresh(layerRenderer, new RectF(rect), this.mOverLayFilter.getEncodedEffectOptions());
        }
        renderOverlay(layerRenderer, com.nexstreaming.kminternal.kinemaster.config.a.a().b());
    }

    /* access modifiers changed from: 0000 */
    public void onRenderAsleep(LayerRenderer layerRenderer) {
        renderOverlay(layerRenderer, com.nexstreaming.kminternal.kinemaster.config.a.a().b());
        if (this.awakeAsset != null) {
            this.awakeAsset.onAsleep(layerRenderer);
            this.awakeAsset = null;
        }
    }

    /* access modifiers changed from: 0000 */
    public void onRenderAwake(LayerRenderer layerRenderer) {
        if (this.mOverLayFilter != null) {
            try {
                OverlayAsset overlayAssetFilter = this.mOverLayFilter.getOverlayAssetFilter();
                Rect rect = new Rect();
                this.mOverLayFilter.getBound(rect);
                this.awakeAsset = overlayAssetFilter.onAwake(layerRenderer, new RectF(rect), this.mOverLayFilter.getEncodedEffectOptions(), null);
            } catch (IOException e) {
                e.printStackTrace();
            } catch (XmlPullParserException e2) {
                e2.printStackTrace();
            }
            return;
        }
        if (this.mOverLayImage != null && this.mOverLayImage.isAssetManager()) {
            try {
                OverlayAsset overlayAssetBitmap = this.mOverLayImage.getOverlayAssetBitmap();
                Rect rect2 = new Rect();
                this.mOverLayImage.getBound(rect2);
                this.awakeAsset = overlayAssetBitmap.onAwake(layerRenderer, new RectF(rect2), null, null);
            } catch (IOException e3) {
                e3.printStackTrace();
            } catch (XmlPullParserException e4) {
                e4.printStackTrace();
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public void renderOverlay(LayerRenderer layerRenderer, Context context) {
        Bitmap bitmap;
        String str;
        LayerRenderer layerRenderer2 = layerRenderer;
        if (this.showItem) {
            this.lastLayerWidth = (int) layerRenderer.a();
            this.lastLayerHeight = (int) layerRenderer.b();
            float relativeScale = this.relationCoordinates ? getRelativeScale(this.lastLayerWidth, this.lastLayerHeight) : 1.0f;
            setTime(layerRenderer.g());
            int[] realPositions = getRealPositions(true);
            int i = realPositions[0];
            int i2 = realPositions[1];
            int i3 = realPositions[2];
            this.animateResourceId = 0;
            if (this.mAniList != null) {
                for (nexAnimate nexanimate : this.mAniList) {
                    int i4 = this.mTime - this.mStartTime;
                    boolean contains = this.mActiveAnimateList.contains(nexanimate);
                    if (nexanimate.mStartTime > i4 || nexanimate.getEndTime() <= i4) {
                        if (contains) {
                            this.mActiveAnimateList.remove(nexanimate);
                            runAnimate(nexanimate, nexanimate.getEndTime());
                        }
                    } else if (!contains) {
                        this.mActiveAnimateList.add(nexanimate);
                        if (i4 - nexanimate.mStartTime < 33) {
                            runAnimate(nexanimate, 0);
                        } else {
                            runAnimate(nexanimate, i4);
                        }
                    } else {
                        runAnimate(nexanimate, i4);
                    }
                }
            }
            layerRenderer.i();
            if (this.mMask != null && this.mMask.onOff && !this.mMask.syncAnimationOverlayItem) {
                layerRenderer.h();
                layerRenderer2.a(RenderTarget.Mask);
                this.mMask.getPosition(this.mMaskRect);
                if (this.mMask.getMaskImage() != null) {
                    layerRenderer.a(this.mMask.getMaskImage(), (float) this.mMaskRect.left, (float) this.mMaskRect.top, (float) this.mMaskRect.right, (float) this.mMaskRect.bottom);
                } else {
                    layerRenderer.a(-1, (float) this.mMaskRect.left, (float) this.mMaskRect.top, (float) this.mMaskRect.right, (float) this.mMaskRect.bottom);
                }
                layerRenderer2.a(true);
                layerRenderer2.a(RenderTarget.Normal);
            }
            layerRenderer2.a((float) i, (float) i2);
            layerRenderer2.a(this.mAnimateTranslateXpos, this.mAnimateTranslateYpos);
            layerRenderer2.b(this.mAnimateLastScaledX * relativeScale, this.mAnimateLastScaledY * relativeScale);
            layerRenderer2.a(this.mAnimateLastRotateDegreeX, 1.0f, 0.0f, 0.0f);
            layerRenderer2.a(this.mAnimateLastRotateDegreeY, 0.0f, 1.0f, 0.0f);
            layerRenderer2.a(this.mAnimateLastRotateDegreeZ, 0.0f, 0.0f, 1.0f);
            if (this.showOutLien) {
                layerRenderer2.a(1.0f);
            } else {
                layerRenderer2.a(this.mAnimateLastAlpha);
            }
            if (this.mMask != null && this.mMask.onOff && this.mMask.syncAnimationOverlayItem) {
                layerRenderer.h();
                layerRenderer2.a(RenderTarget.Mask);
                this.mMask.getPosition(this.mMaskRect);
                if (this.mMask.getMaskImage() != null) {
                    layerRenderer.a(this.mMask.getMaskImage(), (float) this.mMaskRect.left, (float) this.mMaskRect.top, (float) this.mMaskRect.right, (float) this.mMaskRect.bottom);
                } else {
                    layerRenderer.a(-1, (float) this.mMaskRect.left, (float) this.mMaskRect.top, (float) this.mMaskRect.right, (float) this.mMaskRect.bottom);
                }
                layerRenderer2.a(true);
                layerRenderer2.a(RenderTarget.Normal);
            }
            if (this.awakeAsset != null) {
                this.awakeAsset.onRender(layerRenderer2, this.cacheMotion, this.mStartTime, this.mEndTime);
            } else if (this.mOverLayImage != null) {
                Bitmap bitmap2 = null;
                if (this.mOverLayImage.isVideo()) {
                    if (getChromaKey().getChromaKeyEnabled()) {
                        layerRenderer2.b(getChromaKey().getChromaKeyEnabled());
                        layerRenderer2.c(getChromaKey().getChromaKeyMaskEnabled());
                        layerRenderer.a(getChromaKey().m_chromaKeyColor, getChromaKey().m_chromaKeyClipFG, getChromaKey().m_chromaKeyClipBG, getChromaKey().m_chromaKeyBlend_x0, getChromaKey().m_chromaKeyBlend_y0, getChromaKey().m_chromaKeyBlend_x1, getChromaKey().m_chromaKeyBlend_y1);
                    }
                    int b = EditorGlobal.a().b(layerRenderer.o().id, this.mVideoEngineId);
                    layerRenderer2.a(com.nexstreaming.app.common.thememath.a.a(((float) getCombinedBrightness()) / 255.0f, ((float) getCombinedContrast()) / 255.0f, ((float) getCombinedSaturation()) / 255.0f, getTintColor()));
                    layerRenderer.a(b, 0.0f, 0.0f, (float) this.mOverLayImage.getVideoClipInfo().getWidth(), (float) this.mOverLayImage.getVideoClipInfo().getHeight(), this.mFlipMode);
                    layerRenderer2.b(false);
                    layerRenderer2.a((Bitmap) null);
                } else {
                    b a2 = b.a();
                    int i5 = this.animateResourceId;
                    if (i5 == 0) {
                        i5 = this.mOverLayImage.mResourceId;
                    }
                    if (i5 == 0) {
                        str = this.mOverLayImage.getUserBitmapID();
                        if (this.mOverLayImage.mUpdate) {
                            this.mOverLayImage.mUpdate = false;
                            a2.b(str);
                        } else {
                            bitmap2 = a2.a((Object) str);
                        }
                        if (bitmap2 == null) {
                            bitmap = this.mOverLayImage.getUserBitmap();
                            if (bitmap != null) {
                                try {
                                    a2.a(str, bitmap);
                                } catch (NullPointerException e) {
                                    NullPointerException nullPointerException = e;
                                    String str2 = TAG;
                                    StringBuilder sb = new StringBuilder();
                                    sb.append("exception: message=");
                                    sb.append(nullPointerException.getMessage());
                                    Log.d(str2, sb.toString());
                                }
                            }
                        } else {
                            bitmap = bitmap2;
                        }
                    } else {
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append(this.mOverLayImage.getUserBitmapID());
                        sb2.append(i5);
                        String sb3 = sb2.toString();
                        Bitmap a3 = a2.a((Object) sb3);
                        if (a3 == null) {
                            Bitmap decodeResource = BitmapFactory.decodeResource(context.getResources(), i5);
                            if (decodeResource != null) {
                                try {
                                    a2.a(sb3, decodeResource);
                                } catch (NullPointerException e2) {
                                    NullPointerException nullPointerException2 = e2;
                                    String str3 = TAG;
                                    StringBuilder sb4 = new StringBuilder();
                                    sb4.append("exception: message=");
                                    sb4.append(nullPointerException2.getMessage());
                                    Log.d(str3, sb4.toString());
                                }
                            }
                            String str4 = sb3;
                            bitmap = decodeResource;
                            str = str4;
                        } else {
                            str = sb3;
                            bitmap = a3;
                        }
                    }
                    if (bitmap != null) {
                        String str5 = TAG;
                        StringBuilder sb5 = new StringBuilder();
                        sb5.append("renderOverlay bitmap id = ");
                        sb5.append(str);
                        sb5.append(", wid = ");
                        sb5.append(bitmap.getWidth());
                        sb5.append(", hei = ");
                        sb5.append(bitmap.getHeight());
                        sb5.append(", X=");
                        sb5.append(i);
                        sb5.append(", Y=");
                        sb5.append(i2);
                        sb5.append(", Z=");
                        sb5.append(i3);
                        sb5.append(", ScaledX=");
                        sb5.append(this.mAnimateLastScaledX);
                        sb5.append(", Alpha=");
                        sb5.append(this.mAnimateLastAlpha);
                        sb5.append(", Rx=");
                        sb5.append(this.mAnimateLastRotateDegreeX);
                        sb5.append(", Ry=");
                        sb5.append(this.mAnimateLastRotateDegreeY);
                        sb5.append(", Rz=");
                        sb5.append(this.mAnimateLastRotateDegreeZ);
                        sb5.append(", flip=");
                        sb5.append(this.mFlipMode);
                        sb5.append(", baseScale=");
                        sb5.append(relativeScale);
                        sb5.append(", cts=");
                        sb5.append(layerRenderer.g());
                        Log.d(str5, sb5.toString());
                        layerRenderer2.a(com.nexstreaming.app.common.thememath.a.a(((float) getCombinedBrightness()) / 255.0f, ((float) getCombinedContrast()) / 255.0f, ((float) getCombinedSaturation()) / 255.0f, getTintColor()));
                        if (this.mOverLayImage != null) {
                            Rect drawBitmapPosition = getDrawBitmapPosition(this.mOverLayImage.getAnchorPoint(), bitmap.getWidth(), bitmap.getHeight());
                            layerRenderer.a(bitmap, (float) drawBitmapPosition.left, (float) drawBitmapPosition.top, (float) drawBitmapPosition.right, (float) drawBitmapPosition.bottom, this.mFlipMode);
                        } else {
                            layerRenderer2.b(bitmap, this.mFlipMode);
                        }
                    }
                }
            }
            layerRenderer.j();
            if (this.showOutLien) {
                renderOutLine(this, layerRenderer);
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public void resetAnimate() {
        this.mAnimateTranslateXpos = 0.0f;
        this.mAnimateTranslateYpos = 0.0f;
        this.mAnimateTranslateZpos = 0.0f;
        this.mAnimateLastAlpha = this.mAlpha;
        this.mAnimateLastRotateDegreeX = this.mRotateDegreeX;
        this.mAnimateLastRotateDegreeY = this.mRotateDegreeY;
        this.mAnimateLastRotateDegreeZ = this.mRotateDegreeZ;
        this.mAnimateLastScaledX = this.mScaledX;
        this.mAnimateLastScaledY = this.mScaledY;
        this.mAnimateLastScaledZ = this.mScaledZ;
        this.mActiveAnimateList.clear();
    }

    public void setAlpha(float f) {
        if (this.mAlpha != f) {
            this.mUpdated = true;
        }
        this.mAlpha = f;
        resetAnimate();
    }

    public void setAnchor(int i) {
        this.anchorPoint = i;
        this.mUpdated = true;
        resetAnimate();
    }

    public void setAudioOnOff(boolean z) {
        if (isVideo()) {
            if (this.mAudioOnOff != z) {
                this.mUpdated = true;
            }
            this.mAudioOnOff = z;
            return;
        }
        throw new ClipIsNotVideoException();
    }

    public boolean setBrightness(int i) {
        if (i < -255 || i > 255) {
            return false;
        }
        if (this.mBrightness != i) {
            this.mUpdated = true;
        }
        this.mBrightness = i;
        return true;
    }

    public void setColorEffect(nexColorEffect nexcoloreffect) {
        this.mColorEffect = nexcoloreffect;
    }

    public boolean setContrast(int i) {
        if (i < -255 || i > 255) {
            return false;
        }
        if (this.mContrast != i) {
            this.mUpdated = true;
        }
        this.mContrast = i;
        return true;
    }

    public void setEnableShow(boolean z) {
        this.showItem = z;
    }

    @Deprecated
    public void setLayerExpression(nexOverlayKineMasterExpression nexoverlaykinemasterexpression) {
        this.mLayerExpression = nexoverlaykinemasterexpression;
    }

    @Deprecated
    public void setLayerExpressionDuration(int i) {
        this.mLayerExpressionDuration = i;
    }

    @Deprecated
    public void setLayerExpressionParam(boolean z) {
        if (this.bApplayLayerExpression != z) {
            this.mUpdated = true;
        }
        this.bApplayLayerExpression = z;
    }

    /* access modifiers changed from: 0000 */
    public void setOverlayTitle(boolean z) {
        this.mOverlayTitle = z;
    }

    public void setPosition(int i, int i2) {
        updateCoordinates(false);
        if (this.relationCoordinates) {
            this.mX = ((float) (i - this.anchorPointX)) / ((float) this.lastLayerWidth);
            this.mY = ((float) (i2 - this.anchorPointY)) / ((float) this.lastLayerHeight);
        } else {
            this.mX = (float) (i - this.anchorPointX);
            this.mY = (float) (i2 - this.anchorPointY);
        }
        this.mUpdated = true;
        resetAnimate();
    }

    public void setRelationCoordinates(boolean z) {
        if (this.relationCoordinates != z) {
            this.mUpdated = true;
        }
        this.relationCoordinates = z;
    }

    public void setRotate(float f) {
        setRotate(0.0f, 0.0f, f);
    }

    public void setRotate(float f, float f2, float f3) {
        this.mRotateDegreeX = f;
        this.mRotateDegreeY = f2;
        this.mRotateDegreeZ = f3;
        this.mUpdated = true;
        resetAnimate();
    }

    public void setRotate(int i) {
        setRotate(0, 0, i);
    }

    public void setRotate(int i, int i2, int i3) {
        this.mRotateDegreeX = (float) i;
        this.mRotateDegreeY = (float) i2;
        this.mRotateDegreeZ = (float) i3;
        this.mUpdated = true;
        resetAnimate();
    }

    public boolean setSaturation(int i) {
        if (i < -255 || i > 255) {
            return false;
        }
        if (this.mSaturation != i) {
            this.mUpdated = true;
        }
        this.mSaturation = i;
        return true;
    }

    public void setScale(float f, float f2) {
        setScale(f, f2, 1.0f);
    }

    public void setScale(float f, float f2, float f3) {
        this.mScaledX = f;
        this.mScaledY = f2;
        this.mScaledZ = f3;
        this.mUpdated = true;
        resetAnimate();
    }

    public void setSpeedControl(int i) {
        if (isVideo()) {
            int speedControlTab = speedControlTab(i);
            if (this.mSpeedControl != speedControlTab) {
                this.mUpdated = true;
                this.mSpeedControl = speedControlTab;
                return;
            }
            return;
        }
        throw new ClipIsNotVideoException();
    }

    /* access modifiers changed from: 0000 */
    public void setTime(int i) {
        if (this.mTime > i) {
            resetAnimate();
        }
        this.mTime = i;
    }

    public void setTimePosition(int i, int i2) {
        if (i2 > i) {
            this.mUpdated = true;
            this.mStartTime = i;
            this.mEndTime = i2;
            return;
        }
        throw new InvalidRangeException(i, i2);
    }

    public void setTrim(int i, int i2) {
        if (!isVideo()) {
            throw new ClipIsNotVideoException();
        } else if (i2 > i) {
            this.mTrimStartDuration = i;
            this.mTrimEndDuration = this.mOverLayImage.getVideoClipInfo().getTotalTime() - i2;
            this.mUpdated = true;
            if (this.mTrimEndDuration < 0 || this.mTrimStartDuration < 0) {
                throw new InvalidRangeException(this.mTrimStartDuration, this.mTrimEndDuration);
            }
        } else {
            throw new InvalidRangeException(i, i2);
        }
    }

    public void setVolume(int i) {
        if (isVideo()) {
            if (this.mVolume != i) {
                this.mUpdated = true;
            }
            this.mVolume = i;
            return;
        }
        throw new ClipIsNotVideoException();
    }

    public void setZOrder(int i) {
        if (this.mZOrder != i) {
            this.mUpdated = true;
        }
        this.mZOrder = i;
    }

    public void showOutline(boolean z) {
        this.showOutLien = z;
    }

    /* access modifiers changed from: 0000 */
    public boolean updated(boolean z) {
        boolean z2 = this.mUpdated;
        this.mUpdated = z;
        return z2;
    }
}
