package com.miui.gallery.assistant.model;

import android.content.ContentValues;
import android.database.Cursor;
import com.miui.gallery.assistant.AssistantConstants;
import com.miui.gallery.assistant.algorithm.Algorithm;
import com.miui.gallery.assistant.jni.filter.ISceneResult;
import com.miui.gallery.assistant.jni.filter.SceneResult;
import com.miui.gallery.assistant.jni.score.QualityScore;
import com.miui.gallery.dao.base.Entity;
import com.miui.gallery.dao.base.TableColumn;
import com.miui.gallery.util.GsonUtils;
import java.util.ArrayList;
import java.util.List;

public class ImageFeature extends Entity implements Comparable<ImageFeature> {
    public static final String ALL_FEATURE_PROCESSED_SELECTION;
    public static final String ALL_IQA_CLUSTER_SELECTION;
    public static final String ALL_PROCESSED_SELECTION;
    public static final String SCENE_TAG_SELECTION;
    private float[] mClusterFeature;
    private long mClusterGroupId;
    private long mCreateTime;
    private long mImageDateTime;
    private long mImageId;
    private int mImageType;
    private double mIqaBala;
    private double mIqaBlur;
    private int mIqaBlurType;
    private double mIqaComp;
    private double mIqaExpo;
    private double mIqaHaze;
    private double mIqaNima;
    private double mIqaNois;
    private double mIqaSatu;
    private int mResultFlag;
    private float mSceneScore;
    private int mSceneTag;
    private int mSceneTagA;
    private int mSceneTagB;
    private int mSceneTagC;
    private double mScore;
    private String mSha1;
    private int mVersion;

    static {
        StringBuilder sb = new StringBuilder();
        sb.append("imageId>0 AND version = 2 AND (imageType = 0 OR imageType = 1) AND resultFlag & ");
        sb.append(Integer.toString(1));
        sb.append(" > 0");
        sb.append(" AND ");
        sb.append("clusterGroupId");
        sb.append(">0");
        ALL_IQA_CLUSTER_SELECTION = sb.toString();
        StringBuilder sb2 = new StringBuilder();
        sb2.append("imageId>0 AND version = 2 AND (imageType = 0 OR imageType = 1) AND ");
        sb2.append(getFlagsMatchSql(Algorithm.FLAG_FEATURE_ALL_ARRAY));
        ALL_FEATURE_PROCESSED_SELECTION = sb2.toString();
        StringBuilder sb3 = new StringBuilder();
        sb3.append("imageId>0 AND version = 2 AND (imageType = 0 OR imageType = 1) AND ");
        sb3.append(getFlagsMatchSql(Algorithm.FLAG_FEATURE_ALL_ARRAY));
        sb3.append(" AND ");
        sb3.append("clusterGroupId");
        sb3.append(">0");
        ALL_PROCESSED_SELECTION = sb3.toString();
        StringBuilder sb4 = new StringBuilder();
        sb4.append("imageId>0 AND version = 2 AND (imageType = 0 OR imageType = 1) AND resultFlag & ");
        sb4.append(Integer.toString(16));
        sb4.append(" > 0");
        sb4.append(" AND ");
        sb4.append("imageDatetime");
        sb4.append(">?");
        sb4.append(" AND ");
        sb4.append("imageDatetime");
        sb4.append("<?");
        sb4.append(" AND ");
        sb4.append("(");
        sb4.append("sceneTagA");
        sb4.append(" IN (%s)");
        sb4.append(" OR ");
        sb4.append("sceneTagB");
        sb4.append(" IN (%s)");
        sb4.append(" OR ");
        sb4.append("sceneTagC");
        sb4.append(" IN (%s)");
        sb4.append(")");
        SCENE_TAG_SELECTION = sb4.toString();
    }

    private ImageFeature() {
        this.mVersion = 2;
    }

    public ImageFeature(long j, String str, long j2) {
        this.mImageId = j;
        this.mSha1 = str;
        this.mVersion = 2;
        this.mSceneTag = -1;
        this.mSceneScore = 0.0f;
        this.mIqaBlurType = -1;
        this.mSceneTagA = -1;
        this.mSceneTagB = -1;
        this.mSceneTagC = -1;
        this.mImageType = 0;
        this.mCreateTime = System.currentTimeMillis();
        this.mImageDateTime = j2;
    }

    private static String getFlagsMatchSql(int[] iArr) {
        if (iArr == null || iArr.length == 0) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < iArr.length; i++) {
            sb.append("resultFlag");
            sb.append(" & ");
            sb.append(Integer.toString(iArr[i]));
            sb.append(" > 0");
            if (i != iArr.length - 1) {
                sb.append(" AND ");
            }
        }
        return sb.toString();
    }

    public int compareTo(ImageFeature imageFeature) {
        return Double.compare(this.mScore, imageFeature.mScore);
    }

    public float[] getClusterFeature() {
        return this.mClusterFeature;
    }

    public long getClusterGroupId() {
        return this.mClusterGroupId;
    }

    public int getFeatureFlag() {
        return this.mResultFlag;
    }

    public long getImageDateTime() {
        return this.mImageDateTime;
    }

    public long getImageId() {
        return this.mImageId;
    }

    public double getScore() {
        return this.mScore;
    }

    public String getSha1() {
        return this.mSha1;
    }

    /* access modifiers changed from: protected */
    public List<TableColumn> getTableColumns() {
        ArrayList arrayList = new ArrayList();
        addColumn((List<TableColumn>) arrayList, "imageId", "INTEGER", true);
        addColumn(arrayList, "sha1", "TEXT");
        addColumn(arrayList, "version", "INTEGER");
        addColumn(arrayList, "score", "REAL");
        addColumn(arrayList, "sceneTag", "INTEGER");
        addColumn(arrayList, "sceneScore", "REAL");
        addColumn(arrayList, "iqaExpo", "REAL");
        addColumn(arrayList, "iqaSatu", "REAL");
        addColumn(arrayList, "iqaBala", "REAL");
        addColumn(arrayList, "iqaHaze", "REAL");
        addColumn(arrayList, "iqaNois", "REAL");
        addColumn(arrayList, "iqaBlur", "REAL");
        addColumn(arrayList, "iqaComP", "REAL");
        addColumn(arrayList, "iqaNima", "REAL");
        addColumn(arrayList, "iqaBlueType", "INTEGER");
        addColumn(arrayList, "clusterFeature", "TEXT");
        addColumn(arrayList, "sceneTagA", "INTEGER");
        addColumn(arrayList, "sceneTagB", "INTEGER");
        addColumn(arrayList, "sceneTagC", "INTEGER");
        addColumn(arrayList, "resultFlag", "INTEGER");
        addColumn(arrayList, "clusterGroupId", "INTEGER");
        addColumn(arrayList, "imageType", "INTEGER");
        addColumn(arrayList, "createTime", "INTEGER");
        addColumn(arrayList, "imageDatetime", "INTEGER");
        return arrayList;
    }

    public boolean hasClusterFeature() {
        return this.mClusterFeature != null && this.mClusterFeature.length == 1024;
    }

    public boolean isDocumentImage() {
        int[] iArr = AssistantConstants.TAGS_DOCUMENTS;
        for (int i = 0; i < iArr.length; i++) {
            if (this.mSceneTagA == iArr[i] || this.mSceneTagB == iArr[i] || this.mSceneTagC == iArr[i]) {
                return true;
            }
        }
        return false;
    }

    public boolean isFeatureDone(int i) {
        return (i & this.mResultFlag) > 0;
    }

    public boolean isPoorImage() {
        return (this.mIqaBlur < 82.0d && this.mIqaBlurType == 0) || this.mIqaNois < 79.4d || this.mIqaExpo < 62.3d;
    }

    public boolean isSelectionFeatureDone() {
        return isFeatureDone(1) && this.mClusterGroupId > 0;
    }

    /* access modifiers changed from: protected */
    public void onConvertToContents(ContentValues contentValues) {
        contentValues.put("imageId", Long.valueOf(this.mImageId));
        contentValues.put("sha1", this.mSha1);
        contentValues.put("version", Integer.valueOf(this.mVersion));
        contentValues.put("score", Double.valueOf(this.mScore));
        contentValues.put("sceneTag", Integer.valueOf(this.mSceneTag));
        contentValues.put("sceneScore", Float.valueOf(this.mSceneScore));
        contentValues.put("iqaExpo", Double.valueOf(this.mIqaExpo));
        contentValues.put("iqaSatu", Double.valueOf(this.mIqaSatu));
        contentValues.put("iqaBala", Double.valueOf(this.mIqaBala));
        contentValues.put("iqaHaze", Double.valueOf(this.mIqaHaze));
        contentValues.put("iqaNois", Double.valueOf(this.mIqaNois));
        contentValues.put("iqaBlur", Double.valueOf(this.mIqaBlur));
        contentValues.put("iqaBlueType", Integer.valueOf(this.mIqaBlurType));
        contentValues.put("iqaComP", Double.valueOf(this.mIqaComp));
        contentValues.put("iqaNima", Double.valueOf(this.mIqaNima));
        contentValues.put("sceneTagA", Integer.valueOf(this.mSceneTagA));
        contentValues.put("sceneTagB", Integer.valueOf(this.mSceneTagB));
        contentValues.put("sceneTagC", Integer.valueOf(this.mSceneTagC));
        contentValues.put("clusterFeature", GsonUtils.toString(this.mClusterFeature));
        contentValues.put("resultFlag", Integer.valueOf(this.mResultFlag));
        contentValues.put("clusterGroupId", Long.valueOf(this.mClusterGroupId));
        contentValues.put("imageType", Integer.valueOf(this.mImageType));
        contentValues.put("createTime", Long.valueOf(this.mCreateTime));
        contentValues.put("imageDatetime", Long.valueOf(this.mImageDateTime));
    }

    /* access modifiers changed from: protected */
    public void onInitFromCursor(Cursor cursor) {
        this.mImageId = getLong(cursor, "imageId");
        this.mSha1 = getStringDefault(cursor, "sha1", "");
        this.mVersion = getIntDefault(cursor, "version", 0);
        this.mScore = getDoubleDefault(cursor, "score", 0.0d);
        this.mSceneTag = getIntDefault(cursor, "sceneTag", -1);
        this.mSceneScore = getFloatDefault(cursor, "sceneScore", 0.0f);
        this.mIqaExpo = getDoubleDefault(cursor, "iqaExpo", 0.0d);
        this.mIqaSatu = getDoubleDefault(cursor, "iqaSatu", 0.0d);
        this.mIqaBala = getDoubleDefault(cursor, "iqaBala", 0.0d);
        this.mIqaHaze = getDoubleDefault(cursor, "iqaHaze", 0.0d);
        this.mIqaNois = getDoubleDefault(cursor, "iqaNois", 0.0d);
        this.mIqaBlur = getDoubleDefault(cursor, "iqaBlur", 0.0d);
        this.mIqaBlurType = getIntDefault(cursor, "iqaBlueType", -1);
        this.mIqaComp = getDoubleDefault(cursor, "iqaComP", 0.0d);
        this.mIqaNima = getDoubleDefault(cursor, "iqaNima", 0.0d);
        this.mClusterFeature = (float[]) GsonUtils.fromJson(getStringDefault(cursor, "clusterFeature", ""), float[].class);
        this.mSceneTagA = getIntDefault(cursor, "sceneTagA", -1);
        this.mSceneTagB = getIntDefault(cursor, "sceneTagB", -1);
        this.mSceneTagC = getIntDefault(cursor, "sceneTagC", -1);
        this.mResultFlag = getIntDefault(cursor, "resultFlag", 0);
        this.mClusterGroupId = getLongDefault(cursor, "clusterGroupId", 0);
        this.mImageType = getIntDefault(cursor, "imageType", 0);
        this.mCreateTime = getLongDefault(cursor, "createTime", 0);
        this.mImageDateTime = getLongDefault(cursor, "imageDatetime", 0);
    }

    public void setClusterFeature(float[] fArr) {
        if (fArr != null) {
            this.mClusterFeature = fArr;
            setFeatureFlag(4);
        }
    }

    public void setFeatureFlag(int i) {
        this.mResultFlag = i | this.mResultFlag;
    }

    public void setImageType(int i) {
        this.mImageType = i;
    }

    public void setQualityScore(QualityScore qualityScore) {
        if (qualityScore != null) {
            this.mIqaExpo = qualityScore.getIqaExpo();
            this.mIqaSatu = qualityScore.getIqaSatu();
            this.mIqaBala = qualityScore.getIqaBala();
            this.mIqaHaze = qualityScore.getIqaHaze();
            this.mIqaNois = qualityScore.getIqaNois();
            this.mIqaBlur = qualityScore.getIqaBlur();
            this.mIqaComp = qualityScore.getIqaComp();
            this.mIqaNima = qualityScore.getIqaNima();
            this.mIqaBlurType = (int) qualityScore.getIqaBlurType();
            this.mScore = this.mIqaNima;
            setFeatureFlag(1);
        }
    }

    public void setSceneResult(ISceneResult iSceneResult) {
        if (iSceneResult != null) {
            List tags = iSceneResult.getTags(3);
            if (tags != null) {
                int size = tags.size();
                if (size > 0) {
                    this.mSceneTagA = ((Integer) tags.get(0)).intValue();
                }
                if (size > 1) {
                    this.mSceneTagB = ((Integer) tags.get(1)).intValue();
                }
                if (size > 2) {
                    this.mSceneTagC = ((Integer) tags.get(2)).intValue();
                }
            }
            setFeatureFlag(16);
            return;
        }
        this.mSceneTagA = -1;
        this.mSceneTagB = -1;
        this.mSceneTagC = -1;
    }

    public void setSceneResult(SceneResult sceneResult) {
        if (sceneResult != null) {
            this.mSceneTag = sceneResult.getTag();
            this.mSceneScore = sceneResult.getScore();
            setFeatureFlag(2);
            return;
        }
        this.mSceneTag = -1;
        this.mSceneScore = 0.0f;
    }

    public void setVersion(int i) {
        this.mVersion = i;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("ImageFeature{mImageId=");
        sb.append(this.mImageId);
        sb.append(", mVersion=");
        sb.append(this.mVersion);
        sb.append(", mScore=");
        sb.append(this.mScore);
        sb.append(", mSceneTag=");
        sb.append(this.mSceneTag);
        sb.append(", mSceneScore=");
        sb.append(this.mSceneScore);
        sb.append(", mIqaExpo=");
        sb.append(this.mIqaExpo);
        sb.append(", mIqaSatu=");
        sb.append(this.mIqaSatu);
        sb.append(", mIqaBala=");
        sb.append(this.mIqaBala);
        sb.append(", mIqaHaze=");
        sb.append(this.mIqaHaze);
        sb.append(", mIqaNois=");
        sb.append(this.mIqaNois);
        sb.append(", mIqaBlur=");
        sb.append(this.mIqaBlur);
        sb.append(", mIqaBlurType=");
        sb.append(this.mIqaBlurType);
        sb.append(", mIqaComp=");
        sb.append(this.mIqaComp);
        sb.append(", mIqaNima=");
        sb.append(this.mIqaNima);
        sb.append(", mSceneTagA=");
        sb.append(this.mSceneTagA);
        sb.append(", mSceneTagB=");
        sb.append(this.mSceneTagB);
        sb.append(", mSceneTagC=");
        sb.append(this.mSceneTagC);
        sb.append(", mResultFlag=");
        sb.append(this.mResultFlag);
        sb.append(", mClusterGroupId=");
        sb.append(this.mClusterGroupId);
        sb.append(", mImageType=");
        sb.append(this.mImageType);
        sb.append(", mCreateTime=");
        sb.append(this.mCreateTime);
        sb.append('}');
        return sb.toString();
    }
}
